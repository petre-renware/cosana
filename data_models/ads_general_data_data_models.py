#
# (c) 2023 RENware Software Systems
# cosana system
#
# ============================================
# ADS General Data
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
# ads_general_data
#   note: - _pk and audit columns come from BaseInfoMixin
#TODO -  OPISS.004 - history table
# ============================================
class ads_general_data(BaseModel, BaseInfoMixin):
    __tablename__ = 'ads_general_data'

    sales_project_fk = sa.Column(sa.String(36), sa.ForeignKey('salesproject._pk', ondelete='CASCADE'), nullable=False, unique=True, index=True)

    decisive_event = sa.Column(sa.String(100),  nullable=True)
    competition = sa.Column(sa.String(100),  nullable=True)
    potential_problems = sa.Column(sa.String(100),  nullable=True)
    team_members = sa.Column(sa.String(100),  nullable=True)
    client_company = sa.Column(sa.String(100),  nullable=True)

    @property
    # getter attribute for scoring (RMAP.003 - ADS scoring)
    def score(self):
        _MAX_SCORE = 5 # based on number of items in domain
        _crt_score = 0
        _crt_score += 1 if bool(self.decisive_event.strip()) else 0
        _crt_score += 1 if bool(self.competition.strip()) else 0
        _crt_score += 1 if bool(self.potential_problems.strip()) else 0
        _crt_score += 1 if bool(self.team_members.strip()) else 0
        _crt_score += 1 if bool(self.client_company.strip()) else 0
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
        _tmp_me = {
            "decisive_event": self.decisive_event,
            "competition": self.competition,
            "potential_problems": self.potential_problems,
            "team_members": self.team_members,
            "client_company": self.client_company,
            "score": self.score,
        }
        # unified dictionary contain both
        _tmp = dict()
        _tmp = _tmp_base.copy()
        _tmp.update(_tmp_me.copy())
        return _tmp

    def check_health(self):
        pass


