#
# (c) 2022 RENware Software Systems
# cosana system
#
# ========================
# master data objects: Company, solutiion
#
#

import json, os, sys

import sqlalchemy as sa
from sqlalchemy.orm import relationship
from sqlalchemy.orm import declarative_base

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
#  Company (list of sales clients)
# ============================================
class Company(BaseModel, BaseInfoMixin):
    __tablename__ = 'company'

    description = sa.Column(sa.String(10),  nullable=False)

    def check_health(self):
        # check for description attribute
        if not self.description:
            return False
        if self.description.strip() == '':
            return False
        return True



#
#  Solution (list of sales solutions, products, services, etc...)
# ============================================
class Solution(BaseModel, BaseInfoMixin):
    __tablename__ = 'solution'

    description = sa.Column(sa.String(100),  nullable=False)
    notes = sa.Column(sa.String)

    def check_health(self):
        # check for description attribute
        if not self.description:
            return False
        if self.description.strip() == '':
            return False
        return True
