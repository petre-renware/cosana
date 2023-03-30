#!/usr/bin/python3

#
# cosana
# ====================
# (C) 2022 RENware Software Systems
#
# this module initialize all the system (and components) according to 810-DSGN System Landscape document
# created by: Petre Iordanescu
#

import os, sys


""" # order to follow - ref README_sys_core.md

#*--- `commons` - independent python class
tbd... `get_hostname` - gets the node identification as hostname
#*--- `app_portal` - Main Flask application creation ([see here](/app_portal/README_app_portal.md)) and update `commons`
#* `config` - system configuration data
#* `db_sys` - system database derived from `app_portal` and `SQLAlchemy` and update `commons` and
#*          + `migrate` - Flask Migrate at least for beginning stage up to database stabilization (this component is not mentioned in System Landscape document)
#* `data_models` - system data models (ORM)
#* `crud_data_admin` - CRUD data administration component
#* `ads` - Account Data Sheet
#* `are` - Account Review and Evaluation
#* `doc_viewer` - is self contained with own init ([see here](/doc_viewer/README_doc_viewer.md))
tbd... `sys_cfg` - system configuration
tbd... `health_check` - syst health check
tbd... `usr_prefs` - is self contained with own init ([see here](/usr_prefs/README_usr_prefs.md)) and update `commons`
#*--- `main routes` - load index page routes

"""



print("*** Initializing cosana system")

#*---------------------------------------------------------
#* `commons` - independent python class
print("Initializing *commons*...", end="", flush=True)
from commons.commons import Commons
print(" [DONE]")



#*---------------------------------------------------------
#* `get_hostname` - gets the node identification as hostname
'''
print("Initializing *get_hostname*...", end="", flush=True)
from libutil.get_hostname import get_hostname
tmp = get_hostname()
if tmp['retCode'] == 1:
    hname = tmp['hname']
else:
    hname = 'Unknown HOST'
Commons.SetItem("HOSTNAME", hname)
print(" [DONE]")
'''



#*---------------------------------------------------------
#* `app_portal` - Main Flask application creation ([see here](/app_portal/README_app_portal.md)) and update `commons`
print("Initializing *app_portal*...", end="", flush=True)
from app_portal import init_portal
app_portal = init_portal.create_portal()
Commons.SetItem("app_portal", app_portal)
print(" [DONE]")



#*---------------------------------------------------------
#* `config` - system configuration data
print("Initializing *config*...", end="", flush=True)
from config import Config
app_portal.config.from_object(Config)
Commons.SetItem("APP_ROOT", app_portal.config["APP_ROOT_DIR"])
print(" [DONE]")



#*---------------------------------------------------------
#* `db_sys` - system database derived from `app_portal` and `SQLAlchemy` and update `commons`
print("Initializing *db_sys*...", end="", flush=True)
from db_sys import init_db_sys
db_sys = init_db_sys.create_sys_data(app_portal)
Commons.SetItem("db_sys", db_sys)
#*          + `migrate` - Flask Migrate at least for beginning stage up to database stabilization
print(" + *db migration utility*...", end="", flush=True)
from flask_migrate import Migrate
migrate = Migrate(app_portal, db_sys, render_as_batch=True)
print(" [DONE]")



#*---------------------------------------------------------
#* `data_models` - system data models
print("Initializing *data_models* [ORM models...]", end="", flush=True)
# starts data history creation
from data_models.init_data_history import init_data_history
init_data_history('start')
#
# continue with all models importing
from data_models import master_data_models
#
from data_models import salesproject_data_models
from data_models import ads_general_data_data_models
from data_models import ads_evaluation_data_models
from data_models import ads_org_map_data_models
from data_models import ads_revenue_data_models
from data_models import ads_relationships_data_models
from data_models import ads_solution_data_models
from data_models import ads_decision_criteria_data_models
#
print(" [API models...]", end="", flush=True)
from data_models import salesproject_api_models
from data_models import ads_general_data_api_models
from data_models import ads_evaluation_api_models
from data_models import ads_org_map_api_models
from data_models import ads_revenue_api_models
from data_models import ads_relationships_api_models
from data_models import ads_solution_api_models
from data_models import ads_decision_criteria_api_models
#
print(" [FORM models...]", end="", flush=True)
from data_models import salesproject_form_models
#
# finish data history creation
init_data_history('end')
# and nothing to do with models st this moment (220908 12:40) - is JUST TO TEST as something wrong will terminate with stack dump
print(" [DONE]")



#*---------------------------------------------------------
#* `crud_data_admin` - CRUD data administration component
print("Initializing *crud_data_admin*...", end="", flush=True)
from crud_data_admin.init_crud_data_admin import init_crud_admin
_ = init_crud_admin()
print(" [DONE]")



#*---------------------------------------------------------
#* `ads` - Account Data Sheet
print("Initializing *ads*...", end="", flush=True)
from ads.init_ads import init_ads
_ = init_ads()
print(" [DONE]")



#*---------------------------------------------------------
#* `are` - Account Review and Evaluation
print("Initializing *are*...", end="", flush=True)
from are.init_are import init_are
_ = init_are()
print(" [DONE]")



#*---------------------------------------------------------
#* `doc_viewer` - is self contained with own init ([see here](/doc_viewer/README_doc_viewer.md))
print("Initializing *doc_viewer*...", end="", flush=True)
from doc_viewer import doc_viewer_routes
print(" [DONE]")



#*---------------------------------------------------------
#* `sys_cfg` - system configuration
#!#FIXME tbd...
'''
print("Initializing *system configuration*...", end="", flush=True)
print(" [DONE]")
'''


#*---------------------------------------------------------
#* `health_check` - syst health check
#!#FIXME tbd...
'''
print("Initializing *system health check*...", end="", flush=True)
print(" [DONE]")
'''



#*---------------------------------------------------------
#* `usr_prefs` - is self contained with own init ([see here](/usr_prefs/README_usr_prefs.md)) and update `commons`
#!#FIXME tbd...



#*---------------------------------------------------------
#* `main / index routes` - load index page routes
print("Initializing *main / index routes*...", end="", flush=True)
from app_portal import main_routes
print(" [DONE]")





