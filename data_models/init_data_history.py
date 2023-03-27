#
# (c) 2023 RENware Software Systems
# cosana system
#
# ========================
# Data History component
#
#

import json, os, sys

import sqlalchemy as sa
from sqlalchemy_continuum import make_versioned
from sqlalchemy.orm import declarative_base

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


# initialize versioning / history creation of models
def init_data_history(phase='start'):
    """ History data creation objects as:
        - `phase = 'start'` (default) - begins the process
        - `phase = 'end'` - finalize the process
        - any other value do nothing
    """
    if phase == 'start':
        make_versioned(user_cls=None)
    elif phase == 'end':
        # after defined all your models, call configure_mappers:
        sa.orm.configure_mappers()


