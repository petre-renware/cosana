#
# (c) 2023 RENware Software Systems
# cosana system
#
# ============================================
# ADS Decision Crietria
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
from data_models.ads_decision_criteria_lov_models import get_selector_info, get_selector_max_score
from data_models.ads_relationships_data_models import ads_relationships_details


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
# ads_decision_criteria
#   note: - _pk and audit columns come from BaseInfoMixin
# ============================================
class ads_decision_criteria(BaseModel, BaseInfoMixin):
    __versioned__ = {} # activate data history and versioning mechanism of SQLAlchemy Continuum
    __tablename__ = 'ads_decision_criteria'

    sales_project_fk = sa.Column(sa.String(36), sa.ForeignKey('salesproject._pk', ondelete='CASCADE', onupdate='CASCADE'), nullable=False, unique=True, index=True)

    remarks = sa.Column(sa.String(100),  nullable=False, index=True)

    ads_decision_criteria_details_1criterialist_data = relationship("ads_decision_criteria_details_1criterialist", back_populates="ads_decision_criteria_data")

    @property
    # getter attribute for scoring (RMAP.003 - ADS scoring)
    def score(self): # for specs ref calculation see `ads\README_ads.md`
        # calculate actual score as number of (maximum of our_status points) * len(self.ads_decision_criteria_details_1criterialist_data)
        if not self.ads_decision_criteria_details_1criterialist_data:
            crt_score = 0
            _MAX_SCORE = 'n/a'
        else:
            _MAX_SCORE = len(self.ads_decision_criteria_details_1criterialist_data) * get_selector_max_score('our_status')
            # calculate actual score as number of (total actual our_status points)
            crt_score = 0
            for i in self.ads_decision_criteria_details_1criterialist_data:
                _item_score = get_selector_info('our_status', i.our_status)
                crt_score += _item_score['score']
        # prepare result and return it
        _tmp = {
            "crt_score": crt_score,
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
        # get child (ads_decision_criteria_details_1criterialist) data as serializable object
        _item_serializable = list()
        for _item in self.ads_decision_criteria_details_1criterialist_data:
            _item_serializable.append(_item.as_dict())
        #
        _tmp_me = {
            "remarks": self.remarks,
            "ads_decision_criteria_details_1criterialist_data": _item_serializable,
            "score": self.score,
        }
        # unified dictionary contain both
        _tmp = dict()
        _tmp = _tmp_base.copy()
        _tmp.update(_tmp_me.copy())
        return _tmp



#
# ads_decision_criteria_details_1criterialist
#   note: - _pk and audit columns come from BaseInfoMixin
# ============================================
class ads_decision_criteria_details_1criterialist(BaseModel, BaseInfoMixin):
    __versioned__ = {} # activate data history and versioning mechanism of SQLAlchemy Continuum
    __tablename__ = 'ads_decision_criteria_details_1criterialist'
    ads_decision_criteria_fk = sa.Column(sa.String(36), sa.ForeignKey('ads_decision_criteria._pk', ondelete='CASCADE', onupdate='CASCADE'), nullable=False, index=True)
    ads_decision_criteria_data = relationship("ads_decision_criteria", back_populates="ads_decision_criteria_details_1criterialist_data") # to TOP
    ads_decision_criteria_details_2maptoperson_data = relationship("ads_decision_criteria_details_2maptoperson", back_populates="ads_decision_criteria_details_1criterialist_data") # to BOTTOM

    name = sa.Column(sa.String(50), nullable=False, index=True, default=False)
    sa.UniqueConstraint(name, ads_decision_criteria_fk, name="uix_name_per_solution")

    # --- QUALIFYERS
    our_status = sa.Column(sa.String(20),  nullable=False, index=True)

    # --- QUALIFYERS info
    @property
    def our_status_info(self):
        """ Return dictionary {"text", "score", "color"} containing ref data actually stored in qualifyer
        """
        _tmp = get_selector_info('our_status', self.our_status)
        return _tmp

    def as_dict(self):
        # first part of dictionary is with base columns
        _tmp_base = dict()
        _tmp_base = self.get_base_model_as__dict()
        # second part of dictionary is with specific columns
        _tmp_me = dict()
        #
        # get child (ads_decision_criteria_details_1criterialist) data as serializable object
        _item_serializable = list()
        for _item in self.ads_decision_criteria_details_2maptoperson_data:
            _item_serializable.append(_item.as_dict())
        _tmp_me = {
            "ads_decision_criteria_fk": self.ads_decision_criteria_fk,
            "name": self.name,
            # --- QUALIFYERS and their info
            "our_status": self.our_status,
            "our_status_info": self.our_status_info,
            # --- BOTTOM data
            "ads_decision_criteria_details_2maptoperson_data": _item_serializable,
        }
        # unified dictionary contain both
        _tmp = dict()
        _tmp = _tmp_base.copy()
        _tmp.update(_tmp_me.copy())
        return _tmp


#
# ads_decision_criteria_details_2maptoperson
#   note: - _pk and audit columns come from BaseInfoMixin
# ============================================
class ads_decision_criteria_details_2maptoperson(BaseModel, BaseInfoMixin):
    __versioned__ = {} # activate data history and versioning mechanism of SQLAlchemy Continuum
    __tablename__ = 'ads_decision_criteria_details_2maptoperson'

    # to TOP: DECISION CRITERIA OBJECT (ads_decision_criteria_details_1criterialist)
    ads_decision_criteria_details_1criterialist_fk = sa.Column(sa.String(36), sa.ForeignKey('ads_decision_criteria_details_1criterialist._pk', ondelete='CASCADE', onupdate='CASCADE'), nullable=False, index=True)
    ads_decision_criteria_details_1criterialist_data = relationship("ads_decision_criteria_details_1criterialist", back_populates="ads_decision_criteria_details_2maptoperson_data")
    # to BOTTOM: ADS Relationship Details (ads_relationships_details)
    ads_relationships_details_fk = sa.Column(sa.String(36), sa.ForeignKey('ads_relationships_details._pk', ondelete='CASCADE', onupdate='CASCADE'), nullable=False, index=True)
    # make unique the pair of FKs
    sa.UniqueConstraint(ads_decision_criteria_details_1criterialist_fk, ads_relationships_details_fk, name="uix_person_per_criteria")

    # --- QUALIFYERS
    client_importance = sa.Column(sa.String(20), nullable=False, index=True)

    # --- QUALIFYERS info
    @property
    def client_importance_info(self):
        """ Return dictionary {"text", "score", "color"} containing ref data actually stored in qualifyer
        """
        _tmp = get_selector_info('client_importance', self.client_importance)
        return _tmp

    def as_dict(self):
        # first part of dictionary is with base columns
        _tmp_base = dict()
        _tmp_base = self.get_base_model_as__dict()
        # second part of dictionary is with specific columns
        _tmp_me = dict()
        _tmp_me = {
            "ads_decision_criteria_details_1criterialist_fk": self.ads_decision_criteria_details_1criterialist_fk,
            "ads_relationships_details_fk": self.ads_relationships_details_fk,
            # --- QUALIFYERS & their info
            "client_importance": self.client_importance,
            "client_importance_info": self.client_importance_info,
        }
        # unified dictionary contain both
        _tmp = dict()
        _tmp = _tmp_base.copy()
        _tmp.update(_tmp_me.copy())
        return _tmp


