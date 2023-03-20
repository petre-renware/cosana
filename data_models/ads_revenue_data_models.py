#
# (c) 2023 RENware Software Systems
# cosana system
#
# ============================================
# ADS Revenue
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
# ads_revenue
#   note: - _pk and audit columns come from BaseInfoMixin
#TODO -  OPISS.004 - history table
# ============================================
class ads_revenue(BaseModel, BaseInfoMixin):
    __tablename__ = 'ads_revenue'

    sales_project_fk = sa.Column(sa.String(36), sa.ForeignKey('salesproject._pk', ondelete='CASCADE'), nullable=False, unique=True, index=True)

    remarks = sa.Column(sa.String(100),  nullable=False, default="system add as: ads_revenue information")
    max_expected = sa.Column(sa.Float, nullable=False, default=0)
    min_expected = sa.Column(sa.Float, nullable=False, default=0)
    allocated_budget = sa.Column(sa.Float, nullable=False, default=0)
    customer_min_expectation = sa.Column(sa.Float, nullable=False, default=0)
    customer_max_expectation = sa.Column(sa.Float, nullable=False, default=0)
    market_price = sa.Column(sa.Float, nullable=False, default=0)

    @property
    # getter attribute for scoring (RMAP.003 - ADS scoring)
    def score(self):
        _MAX_SCORE = 6 # based on number of items in domain
        _crt_score = 0
        _crt_score += 1 if bool(self.max_expected) else 0
        _crt_score += 1 if bool(self.min_expected) else 0
        _crt_score += 1 if bool(self.allocated_budget) else 0
        _crt_score += 1 if bool(self.customer_min_expectation) else 0
        _crt_score += 1 if bool(self.customer_max_expectation) else 0
        _crt_score += 1 if bool(self.market_price) else 0
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
            "remarks": self.remarks,
            "max_expected": self.max_expected,
            "min_expected": self.min_expected,
            "allocated_budget": self.allocated_budget,
            "customer_min_expectation": self.customer_min_expectation,
            "customer_max_expectation": self.customer_max_expectation,
            "market_price": self.market_price,
            "score": self.score,
        }
        # unified dictionary contain both
        _tmp = dict()
        _tmp = _tmp_base.copy()
        _tmp.update(_tmp_me.copy())
        return _tmp

    def check_health(self):
        pass




