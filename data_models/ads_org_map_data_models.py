#
# (c) 2023 RENware Software Systems
# cosana system
#
# ============================================
# ADS Organization Map
#   and its details object
#
import json, os, sys

from flask import jsonify

import sqlalchemy as sa
from sqlalchemy.orm import declarative_base, relationship, backref

from libutil.utils import genpk, getusr
import pendulum, datetime
from commons.commons import Commons
from data_models.base_keys_data_models import BaseInfoMixin
from data_models.salesproject_data_models import SalesProject
from data_models import ads_org_map_lov_models



# get db_sys from Commons or make it agnostic (usualy apply when called from threads or other processes)
#    - if NULL inherit class object from a SQLAlchemy BaseModel (chk if req?) and from raw one
#    - if ***NOT*** NULL inherit class object from `db.model` and raw one
_PureBaseModel = declarative_base() # declare a general data model (agnostic to Flask)
db = Commons.GetItem("db_sys")
if not db:
    BaseModel = _PureBaseModel
else:
    BaseModel = db.Model



#
# ads_org_map
#   note: - _pk and audit columns come from BaseInfoMixin
# ============================================
class ads_org_map(BaseModel, BaseInfoMixin):
    __versioned__ = {} # activate data history and versioning mechanism of SQLAlchemy Continuum
    __tablename__ = 'ads_org_map'

    sales_project_fk = sa.Column(sa.String(36), sa.ForeignKey('salesproject._pk', ondelete='CASCADE', onupdate='CASCADE'), nullable=False, unique=True, index=True)

    remarks = sa.Column(sa.String(100),  nullable=False, default="system add as: ads_org_map information")
    ads_org_map_details_data = relationship("ads_org_map_details", back_populates="ads_org_map_data")

    @property
    # getter attribute for scoring (RMAP.003 - ADS scoring)
    def score(self):
        _MAX_SCORE = ads_org_map_lov_models.get_score_total()
        _MAX_OF_DECISION_MAKE = ads_org_map_lov_models.lov_scoring_org_map['_MAX_OF_DECISION_MAKE']
        _MAX_OF_NEED_TO_SIGN = ads_org_map_lov_models.lov_scoring_org_map['_MAX_OF_NEED_TO_SIGN']
        _MAX_OF_TECHNICAL_EVALUATION = ads_org_map_lov_models.lov_scoring_org_map['_MAX_OF_TECHNICAL_EVALUATION']
        _MAX_OF_FINANCIAL_EVALUATION = ads_org_map_lov_models.lov_scoring_org_map['_MAX_OF_FINANCIAL_EVALUATION']
        _MAX_OF_CONSULTANT = ads_org_map_lov_models.lov_scoring_org_map['_MAX_OF_CONSULTANT']
        # loop over detailed data to calculate actual score
        _crt_score_of_decision_make = 0
        _crt_score_of_need_to_sign = 0
        _crt_score_of_technical_evaluation = 0
        _crt_score_of_financial_evaluation = 0
        _crt_score_of_consultant = 0
        for i in self.ads_org_map_details_data:
            _crt_score_of_decision_make += int(i.decision_make)
            _crt_score_of_need_to_sign += int(i.need_to_sign)
            _crt_score_of_technical_evaluation += int(i.technical_evaluation)
            _crt_score_of_financial_evaluation += int(i.financial_evaluation)
            _crt_score_of_consultant += int(i.consultant)
        # adjust score to not be over MAX, ie, choose min between them
        _crt_score_of_decision_make = min(_crt_score_of_decision_make, _MAX_OF_DECISION_MAKE)
        _crt_score_of_need_to_sign = min(_crt_score_of_need_to_sign, _MAX_OF_NEED_TO_SIGN)
        _crt_score_of_technical_evaluation = min(_crt_score_of_technical_evaluation, _MAX_OF_TECHNICAL_EVALUATION)
        _crt_score_of_financial_evaluation = min(_crt_score_of_financial_evaluation, _MAX_OF_FINANCIAL_EVALUATION)
        _crt_score_of_consultant = min(_crt_score_of_consultant, _MAX_OF_CONSULTANT)
        # calculate total current / actual score
        _crt_score = _crt_score_of_decision_make + _crt_score_of_need_to_sign + _crt_score_of_technical_evaluation + _crt_score_of_financial_evaluation + _crt_score_of_consultant
        _tmp = {
            "crt_score": _crt_score,
            "max_score": _MAX_SCORE,
            "detailed_crt_points": {
                "decision_make": _crt_score_of_decision_make,
                "need_to_sign": _crt_score_of_need_to_sign,
                "financial_evaluation": _crt_score_of_financial_evaluation,
                "technical_evaluation": _crt_score_of_technical_evaluation,
                "consultant": _crt_score_of_consultant,
            },
            "detailed_MAX_points": {
                "decision_make": _MAX_OF_DECISION_MAKE,
                "need_to_sign": _MAX_OF_NEED_TO_SIGN,
                "financial_evaluation": _MAX_OF_FINANCIAL_EVALUATION,
                "technical_evaluation": _MAX_OF_TECHNICAL_EVALUATION,
                "consultant": _MAX_OF_CONSULTANT,
            }
        }
        return _tmp
    def as_dict(self):
        # first part of dictionary is with base columns
        _tmp_base = dict()
        _tmp_base = self.get_base_model_as__dict()
        # second part of dictionary is with specific columns
        _tmp_me = dict()
        #
        # get child (ads_org_map_details) data as serializable object
        _org_map_details_serializable = list()
        for _item in self.ads_org_map_details_data:
            _org_map_details_serializable.append(_item.as_dict())
        #
        _tmp_me = {
            "remarks": self.remarks,
            "ads_org_map_details_data": _org_map_details_serializable,
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
# ads_org_map_details
#   note: - _pk and audit columns come from BaseInfoMixin
# ============================================
class ads_org_map_details(BaseModel, BaseInfoMixin):
    __versioned__ = {} # activate data history and versioning mechanism of SQLAlchemy Continuum
    __tablename__ = 'ads_org_map_details'

    ads_org_map_fk = sa.Column(sa.String(36), sa.ForeignKey('ads_org_map._pk', ondelete='CASCADE', onupdate='CASCADE'), nullable=False, index=True)
    ads_org_map_data = relationship("ads_org_map", back_populates="ads_org_map_details_data")

    code = sa.Column(sa.String(10), nullable=False, index=True, default=False)
    sa.UniqueConstraint(code, ads_org_map_fk, name="uix_code_per_org_map")
    name = sa.Column(sa.String(50), nullable=False, index=True, default=False)

    decision_make = sa.Column(sa.Boolean, nullable=False, index=True, default=False)
    need_to_sign = sa.Column(sa.Boolean, nullable=False, index=True, default=False)
    technical_evaluation = sa.Column(sa.Boolean, nullable=False, index=True, default=False)
    financial_evaluation = sa.Column(sa.Boolean, nullable=False, index=True, default=False)
    consultant = sa.Column(sa.Boolean, nullable=False, index=True, default=False)



    def as_dict(self):
        # first part of dictionary is with base columns
        _tmp_base = dict()
        _tmp_base = self.get_base_model_as__dict()
        # second part of dictionary is with specific columns
        _tmp_me = dict()
        _tmp_me = {
            "ads_org_map_fk": self.ads_org_map_fk,
            "code": self.code,
            "name": self.name,
            "decision_make": self.decision_make,
            "need_to_sign": self.need_to_sign,
            "technical_evaluation": self.technical_evaluation,
            "financial_evaluation": self.financial_evaluation,
            "consultant": self.consultant,
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
        if isinstance(instance, ads_org_map_details): #? CHANGE FOR EACH OBJECT
            # update `ads_org_map_data`, attribute `_useless_to_keep_history`
            if type(instance.ads_org_map_data) == type(list()):  #? pay ATTN to PARENT RELATIONSHIP NAME
                _taregt_to_update = instance.ads_org_map_data[0] #? pay ATTN to PARENT RELATIONSHIP NAME
            else:
                _taregt_to_update = instance.ads_org_map_data #? pay ATTN to PARENT RELATIONSHIP NAME
            _new_target_value = not _taregt_to_update._useless_to_keep_history
            _taregt_to_update._useless_to_keep_history = _new_target_value
    for instance in session.deleted:
        if isinstance(instance, ads_org_map_details): #? CHANGE FOR EACH OBJECT
            # update `ads_org_map_data`, attribute `_useless_to_keep_history`
            if type(sa.orm.attributes.get_history(instance, 'ads_org_map_data').unchanged[0]) == type(list()):  #? pay ATTN to PARENT RELATIONSHIP NAME
                _taregt_to_update = sa.orm.attributes.get_history(instance, 'ads_org_map_data').unchanged[0][0] #? pay ATTN to PARENT RELATIONSHIP NAME
            else:
                _taregt_to_update = sa.orm.attributes.get_history(instance, 'ads_org_map_data').unchanged[0] #? pay ATTN to PARENT RELATIONSHIP NAME
            _new_target_value = not _taregt_to_update._useless_to_keep_history
            _taregt_to_update._useless_to_keep_history = _new_target_value


