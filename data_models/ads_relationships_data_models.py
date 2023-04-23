#
# (c) 2023 RENware Software Systems
# cosana system
#
# ============================================
# ADS Relationships
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
from data_models.ads_relationships_lov_models import get_selector_info
from data_models.ads_org_map_data_models import ads_org_map, ads_org_map_details

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
# ads_relationships
#   note: - _pk and audit columns come from BaseInfoMixin
# ============================================
class ads_relationships(BaseModel, BaseInfoMixin):
    __versioned__ = {} # activate data history and versioning mechanism of SQLAlchemy Continuum
    __tablename__ = 'ads_relationships'

    sales_project_fk = sa.Column(sa.String(36), sa.ForeignKey('salesproject._pk', ondelete='CASCADE', onupdate='CASCADE'), nullable=False, unique=True, index=True)

    remarks = sa.Column(sa.String(100),  nullable=False, default="system add as: ads_relationships information")
    ads_relationships_details_data = relationship("ads_relationships_details", back_populates="ads_relationships_data")

    @property
    # getter attribute for scoring (RMAP.003 - ADS scoring)
    def score(self):
        # maximum is the number of positions identified Organization Map (see `/ads/README_ads.md` ref score calculation)
        _tmp_max = ads_org_map.query.filter(ads_org_map.sales_project_fk == self.sales_project_fk).first()
        _MAX_SCORE = len(_tmp_max.ads_org_map_details_data) # in fact count for _tmp_max.ads_org_map_details_data which is the number of identified positions
        # to calculate current score first make a list with all combination of named positions (name, position) from ads_relationships_details_data
        _list_of_identified_positions = list()
        for i in self.ads_relationships_details_data:
            _list_of_identified_positions.append(i.position)
        # convert it to set then count the elements
        # current score is calculated by getting total distinct positions idetified
        _crt_score = len(set(_list_of_identified_positions))
        _crt_score = min(_crt_score, _MAX_SCORE)
        _tmp = {
            "crt_score": _crt_score,
            "max_score": _MAX_SCORE,
            "progress_percent": 0,
        }
        # calculate % of score
        if (not _tmp['max_score']) or (_tmp['max_score'] == 0):
            _tmp['progress_percent'] = _tmp['crt_score']
        else:
            _tmp['progress_percent'] = round(100 * _tmp['crt_score'] / _tmp['max_score'], 1)
        return _tmp

    def as_dict(self):
        # first part of dictionary is with base columns
        _tmp_base = dict()
        _tmp_base = self.get_base_model_as__dict()
        # second part of dictionary is with specific columns
        _tmp_me = dict()
        #
        # get child (ads_relationships_details) data as serializable object
        _org_map_details_serializable = list()
        for _item in self.ads_relationships_details_data:
            _org_map_details_serializable.append(_item.as_dict())
        #
        _tmp_me = {
            "remarks": self.remarks,
            "ads_relationships_details_data": _org_map_details_serializable,
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
# ads_relationships_details
#   note: - _pk and audit columns come from BaseInfoMixin
# ============================================
class ads_relationships_details(BaseModel, BaseInfoMixin):
    __versioned__ = {} # activate data history and versioning mechanism of SQLAlchemy Continuum
    __tablename__ = 'ads_relationships_details'

    ads_relationships_fk = sa.Column(sa.String(36), sa.ForeignKey('ads_relationships._pk', ondelete='CASCADE', onupdate='CASCADE'), nullable=False, index=True)
    ads_relationships_data = relationship("ads_relationships", back_populates="ads_relationships_details_data")

    name = sa.Column(sa.String(50), nullable=False, index=True, default=False)
    sa.UniqueConstraint(name, ads_relationships_fk, name="uix_name_per_relationships")

    # --- QUALIFYERS
    position = sa.Column(sa.String(36), sa.ForeignKey('ads_org_map_details._pk', ondelete='RESTRICT', onupdate='RESTRICT'), nullable=False, index=True)
    change_adaptability = sa.Column(sa.String(20), nullable=False, index=True)
    our_status_in_relation = sa.Column(sa.String(20), nullable=False, index=True)
    contact_status = sa.Column(sa.String(20), nullable=False, index=True)

    # --- QUALIFYERS info
    @property
    def position_info(self):
        _tmp = dict(
            position_code="n/a",
            position_name="n/a",
            position_qualifyers="n/a",
        )
        _position_data = ads_org_map_details.query.filter(ads_org_map_details._pk == self.position).first()
        if not _position_data: # not exists that information (was manually deleted)
            return _tmp
        # begin to costruct real data dict
        _tmp["position_code"] = _position_data.code
        _tmp["position_name"] = _position_data.name
        _tmp["position_qualifyers"] = ""
        _tmp["position_qualifyers"] += " DM " if _position_data.decision_make else ""
        _tmp["position_qualifyers"] += " NS  " if _position_data.need_to_sign else ""
        _tmp["position_qualifyers"] += " TE" if _position_data.technical_evaluation else ""
        _tmp["position_qualifyers"] += " FE " if _position_data.financial_evaluation else ""
        _tmp["position_qualifyers"] += " CNS " if _position_data.consultant else ""
        _tmp["position_qualifyers"] = " ".join(_tmp["position_qualifyers"].split())
        return _tmp

    @property
    def change_adaptability_info(self):
        """ Return dictionary {"text", "score", "color"} containing ref data actually stored in qualifyer
        """
        _tmp = get_selector_info('change_adaptability', self.change_adaptability)
        return _tmp

    @property
    def our_status_in_relation_info(self):
        """ Return dictionary {"text", "score", "color"} containing ref data actually stored in qualifyer
        """
        _tmp = get_selector_info('our_status_in_relation', self.our_status_in_relation)
        return _tmp

    @property
    def contact_status_info(self):
        """ Return dictionary {"text", "score", "color"} containing ref data actually stored in qualifyer
        """
        _tmp = get_selector_info('contact_status', self.contact_status)
        return _tmp


    def as_dict(self):
        # first part of dictionary is with base columns
        _tmp_base = dict()
        _tmp_base = self.get_base_model_as__dict()
        # second part of dictionary is with specific columns
        _tmp_me = dict()
        _tmp_me = {
            "ads_relationships_fk": self.ads_relationships_fk,
            "name": self.name,
            # --- QUALIFYERS
            "position": self.position,
            "change_adaptability": self.change_adaptability,
            "our_status_in_relation": self.our_status_in_relation,
            "contact_status": self.contact_status,
            # --- QUALIFYERS info
            "position_info": self.position_info,
            "change_adaptability_info": self.change_adaptability_info,
            "our_status_in_relation_info": self.our_status_in_relation_info,
            "contact_status_info": self.contact_status_info,
        }
        # unified dictionary contain both
        _tmp = dict()
        _tmp = _tmp_base.copy()
        _tmp.update(_tmp_me.copy())
        return _tmp



#
#*--- functions designed to capture insert / update / delete events and force versioning component to update history (see v0.12.0-xxx opiss 230402piu_a for more details)
@sa.event.listens_for(db.session, 'before_flush')
def details_lvl1_before_flush(session, flush_context, instances):
    # set mysellf
    for instance in session.dirty:
        # just for mysellf
        if isinstance(instance, ads_relationships_details): #? CHANGE FOR EACH OBJECT
            # update `ads_relationships_data`, attribute `_useless_to_keep_history`
            if type(instance.ads_relationships_data) == type(list()):  #? pay ATTN to PARENT RELATIONSHIP NAME
                _taregt_to_update = instance.ads_relationships_data[0] #? pay ATTN to PARENT RELATIONSHIP NAME
            else:
                _taregt_to_update = instance.ads_relationships_data #? pay ATTN to PARENT RELATIONSHIP NAME
            _new_target_value = not _taregt_to_update._useless_to_keep_history
            _taregt_to_update._useless_to_keep_history = _new_target_value
    for instance in session.deleted:
        if isinstance(instance, ads_relationships_details): #? CHANGE FOR EACH OBJECT
            # update `ads_relationships_data`, attribute `_useless_to_keep_history`
            if type(sa.orm.attributes.get_history(instance, 'ads_relationships_data').unchanged[0]) == type(list()):  #? pay ATTN to PARENT RELATIONSHIP NAME
                _taregt_to_update = sa.orm.attributes.get_history(instance, 'ads_relationships_data').unchanged[0][0] #? pay ATTN to PARENT RELATIONSHIP NAME
            else:
                _taregt_to_update = sa.orm.attributes.get_history(instance, 'ads_relationships_data').unchanged[0] #? pay ATTN to PARENT RELATIONSHIP NAME
            _new_target_value = not _taregt_to_update._useless_to_keep_history
            _taregt_to_update._useless_to_keep_history = _new_target_value
    for instance in session.new:
        # just for mysellf
        if isinstance(instance, ads_relationships_details): #? CHANGE FOR EACH OBJECT
            # update `ads_relationships` (principal parent), attribute `_useless_to_keep_history`
            _taregt_to_update = ads_relationships.query.filter(ads_relationships._pk == instance.ads_relationships_fk).one()
            _taregt_to_update._useless_to_keep_history = True # just put a True as being a new element and does not matter what value is

