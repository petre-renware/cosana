#
# (c) 2023 RENware Software Systems
# cosana system
#
# ============================================
# ADS Solution
#   and its details object
#
import json
import os
import sys

from flask import jsonify

import sqlalchemy as sa
from sqlalchemy.orm import declarative_base, relationship, backref

from libutil.utils import genpk, getusr
import pendulum
import datetime
from commons.commons import Commons
from data_models.base_keys_data_models import BaseInfoMixin
from data_models.salesproject_data_models import SalesProject
from data_models.ads_solution_lov_models import get_selector_info, get_selector_max_score


# get db_sys from Commons or make it agnostic (usualy apply when called from threads or other processes)
#    - if NULL inherit class object from a SQLAlchemy BaseModel (chk if req?) and from raw one
#    - if ***NOT*** NULL inherit class object from `db.model` and raw one
# declare a general data model (agnostic to Flask)
_PureBaseModel = declarative_base()
db = Commons.GetItem("db_sys")
if not db:
    BaseModel = _PureBaseModel
else:
    BaseModel = db.Model


#
# ads_solution
#   note: - _pk and audit columns come from BaseInfoMixin
# ============================================
class ads_solution(BaseModel, BaseInfoMixin):
    __versioned__ = {} # activate data history and versioning mechanism of SQLAlchemy Continuum
    __tablename__ = 'ads_solution'

    sales_project_fk = sa.Column(sa.String(36), sa.ForeignKey('salesproject._pk', ondelete='CASCADE', onupdate='CASCADE'), nullable=False, unique=True, index=True)

    remarks = sa.Column(sa.String(100),  nullable=False, default="system add as: ads_solution information")
    name = sa.Column(sa.String(100),  nullable=False, index=True)
    description = sa.Column(sa.String(100),  nullable=False)

    ads_solution_details_data = relationship("ads_solution_details", back_populates="ads_solution_data")

    @property
    # getter attribute for scoring (RMAP.003 - ADS scoring)
    def score(self):
        # get number of define solution elements
        _number_of_solution_elements = len(self.ads_solution_details_data)
        _crt_score = 0
        if _number_of_solution_elements >= 0:
            _MAX_SCORE = _number_of_solution_elements * get_selector_max_score('strength')
        else:
            _MAX_SCORE = 'n/a'
        # calculate current score
        for _solution_element in self.ads_solution_details_data:
            _crt_score += get_selector_info('strength', _solution_element.strength)['score']
        # produce the result in required format
        _tmp = {
            "crt_score": _crt_score,
            "max_score": _MAX_SCORE,
        }
        return _tmp

    def as_dict(self):
        # first part of dictionary is with base columns
        _tmp_base = dict()
        _tmp_base = self.get_base_model_as__dict()
        # second part of dictionary is with specific columns
        _tmp_me = dict()
        #
        # get child (ads_solution_details) data as serializable object
        _item_details_serializable = list()
        for _item in self.ads_solution_details_data:
            _item_details_serializable.append(_item.as_dict())
        #
        _tmp_me = {
            "remarks": self.remarks,
            "name": self.name,
            "description": self.description,
            "ads_solution_details_data": _item_details_serializable,
            "score": self.score,
        }
        # unified dictionary contain both
        _tmp = dict()
        _tmp = _tmp_base.copy()
        _tmp.update(_tmp_me.copy())
        return _tmp

    def check_health(self):
        pass


#
# ads_solution_details
#   note: - _pk and audit columns come from BaseInfoMixin
# ============================================
class ads_solution_details(BaseModel, BaseInfoMixin):
    __versioned__ = {} # activate data history and versioning mechanism of SQLAlchemy Continuum
    __tablename__ = 'ads_solution_details'

    ads_solution_fk = sa.Column(sa.String(36), sa.ForeignKey('ads_solution._pk', ondelete='CASCADE', onupdate='CASCADE'), nullable=False, index=True)
    ads_solution_data = relationship("ads_solution", back_populates="ads_solution_details_data")

    name = sa.Column(sa.String(50), nullable=False, index=True, default=False)
    sa.UniqueConstraint(name, ads_solution_fk, name="uix_name_per_solution")

    # --- QUALIFYERS
    strength = sa.Column(sa.String(20), nullable=False, index=True)
    feature_type = sa.Column(sa.String(20), nullable=False, index=True)

    # --- QUALIFYERS info
    @property
    def strength_info(self):
        """ Return dictionary {"text", "score", "color"} containing ref data actually stored in qualifyer
        """
        _tmp = get_selector_info('strength', self.strength)
        return _tmp

    @property
    def feature_type_info(self):
        """ Return dictionary {"text", "score", "color"} containing ref data actually stored in qualifyer
        """
        _tmp = get_selector_info('feature_type', self.feature_type)
        return _tmp

    def as_dict(self):
        # first part of dictionary is with base columns
        _tmp_base = dict()
        _tmp_base = self.get_base_model_as__dict()
        # second part of dictionary is with specific columns
        _tmp_me = dict()
        _tmp_me = {
            "ads_solution_fk": self.ads_solution_fk,
            "name": self.name,
            # --- QUALIFYERS
            "strength": self.strength,
            "feature_type": self.feature_type,
            # --- QUALIFYERS info
            "strength_info": self.strength_info,
            "feature_type_info": self.feature_type_info,
        }
        # unified dictionary contain both
        _tmp = dict()
        _tmp = _tmp_base.copy()
        _tmp.update(_tmp_me.copy())
        return _tmp


#
#*--- functions designed to capture insert / update / delete events and force versioning component to update history (see v0.12.0-xxx opiss 230402piu_a for more details)
@sa.event.listens_for(db.session, 'before_flush')
def details_lvl1_before_update(session, flush_context, instances):
    # set mysellf
    for instance in session.dirty:
        # just for mysellf
        if isinstance(instance, ads_solution_details): #? CHANGE FOR EACH OBJECT
            # update `ads_solution_data`, attribute `_useless_to_keep_history`
            if type(instance.ads_solution_data) == type(list()):  #? pay ATTN to PARENT RELATIONSHIP NAME
                _taregt_to_update = instance.ads_solution_data[0] #? pay ATTN to PARENT RELATIONSHIP NAME
            else:
                _taregt_to_update = instance.ads_solution_data #? pay ATTN to PARENT RELATIONSHIP NAME
            _new_target_value = not _taregt_to_update._useless_to_keep_history
            _taregt_to_update._useless_to_keep_history = _new_target_value


""" #!#FIXME error
File "/mnt/d/_T0_PROJECTS/0000-0128 COSANA Comprehensive Sales Analysis Review/830-DEV/data_models/ads_solution_data_models.py", line 188, in details_lvl1_insert
    _taregt_to_update._useless_to_keep_history = True # just put a True as being a new element and does not matter what value is
AttributeError: 'NoneType' object has no attribute '_useless_to_keep_history'
------------------------------------------------------------------------------------------
EXPL: at insertion momnt the object is still in construction (? REALLY? you're in after_flush - study more)
-------------------------------------------------------------------------------------------                          [ original code start from here]


@sa.event.listens_for(db.session, 'after_flush')
def details_lvl1_insert(session, flush_context):
    # set mysellf
    for instance in session.new:
        # just for mysellf
        if isinstance(instance, ads_solution_details): #? CHANGE FOR EACH OBJECT
            # update `ads_solution_data`, attribute `_useless_to_keep_history`
            if type(instance.ads_solution_data) == type(list()):  #? pay ATTN to PARENT RELATIONSHIP NAME
                _taregt_to_update = instance.ads_solution_data[0] #? pay ATTN to PARENT RELATIONSHIP NAME
            else:
                _taregt_to_update = instance.ads_solution_data #? pay ATTN to PARENT RELATIONSHIP NAME
            _taregt_to_update._useless_to_keep_history = True # just put a True as being a new element and does not matter what value is

"""
