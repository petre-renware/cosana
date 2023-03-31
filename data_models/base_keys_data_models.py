#
# (c) 2022, 2023 RENware Software Systems
# cosana system
#
# ========================
# mixin template used by almost abjects to inherut required attributes and properrties
#
#

import json, os, sys

import sqlalchemy as sa
from sqlalchemy.orm import relationship
from sqlalchemy.orm import declarative_base

from libutil.utils import genpk, getusr
from datetime import date, datetime, timedelta
from commons.commons import Commons






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
# BaseInfo
# ============================================
class BaseInfoMixin(object):
    """ Mixin to create the following columns:
        * _pk for technical PK - string of uuid4
        * _updated_at, _updated_by as minimum audit data
        * _tenant_id as tenant owner of record (no FK for it but indexed)
        * _disabled to allow for records disabling
        * column `_useless_to_keep_history` is usable to set and keep history at ADS level tables - usage: at each detail change, set it as `set _useless_to_keep_history = not _useless_to_keep_history` to force versioning component to save history
    """

    # identification columns
    _pk = sa.Column(sa.String(36), primary_key=True, default=genpk)
    # audit columns
    _updated_by = sa.Column(sa.String(100), default=getusr, onupdate=getusr, nullable=False, index=True)
    _updated_at = sa.Column(sa.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow,  nullable=False)
    # disabling column
    _disabled = sa.Column(sa.Boolean, nullable=False, index=True, default=False)
    # see note 1
    _useless_to_keep_history = sa.Column(sa.Boolean, nullable=True)


    def DiableRec(self):
        self._disabled = True

    def EnableRec(self):
        self._disabled = False

    def get_base_model_as__dict(self):
        return {
            "_pk": self._pk,
            "_updated_by": self._updated_by,
            "_updated_at": str(self._updated_at),
            "_disabled": self._disabled
        }

@sa.event.listens_for(BaseInfoMixin, 'before_update', propagate=True)
def timestamp_before_update(mapper, connection, target):
    # always update audit fields regardless of what developer wants
    target._updated_at = datetime.utcnow()
    target._updated_by = getusr()



