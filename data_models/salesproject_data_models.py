#
# (c) 2022 RENware Software Systems
# cosana system
#
# ============================================
# SalesProjects (list of sales projects)
#
import json, os, sys

from flask import jsonify

import sqlalchemy as sa
from sqlalchemy.orm import declarative_base, relationship, backref

from libutil.utils import genpk, getusr
import pendulum, datetime
from commons.commons import Commons
from data_models.base_keys_data_models import BaseInfoMixin



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
# SalesProjects (list of sales projects)
#   note: - _pk, and audit columns come from BaseInfoMixin
# ============================================
class SalesProject(BaseModel, BaseInfoMixin):
    __tablename__ = 'salesproject'

    code = sa.Column(sa.String(10),  nullable=False, index=True, unique=True)
    description = sa.Column(sa.String(100),  nullable=False)
    notes = sa.Column(sa.String)

    # relationships to ADS (uselist on False will establish a logical 1:1 relationship that ORM is aware)
    ads_general_data = relationship('ads_general_data', uselist=False)
    ads_evaluation = relationship('ads_evaluation', uselist=False)
    ads_org_map = relationship('ads_org_map', uselist=False)
    ads_revenue = relationship('ads_revenue', uselist=False)
    ads_relationships = relationship('ads_relationships', uselist=False)
    ads_solution = relationship('ads_solution', uselist=False)
    ads_decision_criteria = relationship('ads_decision_criteria', uselist=False)


    def as_dict(self):
        # first part of dictionary is with base columns
        _tmp_base = dict()
        _tmp_base = self.get_base_model_as__dict()
        # second part of dictionary is with specific columns
        _tmp_me = dict()
        _tmp_me = {
            "code": self.code,
            "description": self.description,
            "notes": self.notes,
            "ads_general_data": self.ads_general_data.as_dict() if self.ads_general_data else None,
            "ads_evaluation": self.ads_general_data.as_dict() if self.ads_general_data else None,
            "ads_org_map": self.ads_org_map.as_dict() if self.ads_org_map else None,
            "ads_revenue": self.ads_revenue.as_dict() if self.ads_revenue else None,
            "ads_relationships": self.ads_relationships.as_dict() if self.ads_relationships else None,
            "ads_solution": self.ads_solution.as_dict() if self.ads_solution else None,
            "ads_decision_criteria": self.ads_decision_criteria.as_dict() if self.ads_decision_criteria else None,
        }
        # unified dictionary contain both
        _tmp = dict()
        _tmp = _tmp_base.copy()
        _tmp.update(_tmp_me.copy())
        return _tmp

    def check_health(self):
        # check for description attribute
        if not self.description:
            return False
        if self.description.strip() == '':
            return False
        return True


