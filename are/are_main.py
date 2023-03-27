#
# copyright (C) 2023 RENware Software Systems
# ==========================================
# are (Account Review and Evaluation) entries
# author: Petre Iordanescu
#

import os, sys
import json
import pathlib
from datetime import datetime
import pendulum
from flask import render_template, render_template_string, redirect, url_for, send_from_directory, request, jsonify, abort, url_for
from data_models.salesproject_data_models import SalesProject
from libutil.utils import genpk
import pprint

# * get database and app from Commons
from commons.commons import Commons
# get database object from Commons
db = Commons.GetItem("db_sys")
if not db:
    print(f"*** FATAL ERROR in {__name__} - db_sys is null. System exit")
    sys.exit(1)
# get basic application object from Commons
app = Commons.GetItem("app_portal")
if not app:
    print(f"*** FATAL ERROR in {__name__} - app_portal is null. System exit")
    sys.exit(1)
# get cosana web system root directory
APP_ROOT = Commons.GetItem("APP_ROOT")
if not app:
    print(f"*** FATAL ERROR in {__name__} - APP_ROOT is null. System exit")
    sys.exit(1)


# *---------------------------------------------------------------------------------
# *----- initial package data (component instance parameters)
# *---------------------------------------------------------------------------------
sales_project_object_chosen = 'unknown'  # PK of "in subject" Sales Project
page_title = 'Account Review and Evaluation'





# *---------------------------------------------------------------------------------
# *----- ADS-RT [main route and UI builder]  (see component README for details)
# *---------------------------------------------------------------------------------
# TODO ROADMAP.RMAP.000 login-protect route
@app.route('/are')
def are_builder():
    # get query parameter
    _tmp = request.args.get('sales_project_pk')
    #
    # check if sales project exists
    sales_project_object_chosen = _tmp if _tmp else 'unknown'
    #
    # --- START of businesses domains loading
    #
    # render are_general_data.html
    _file = pathlib.Path(APP_ROOT + '/are/are_general_data.html')
    _str_of_are_template_html = _file.read_text()
    from data_models.ads_general_data_api_models import ads_general_data_api_get
    general_data_summary_info = ads_general_data_api_get(sales_project_object_chosen).get_json()
    general_data_summary_info = general_data_summary_info['data'][0] # [0] is the last and only one record
    _tmp_date = pendulum.parse(general_data_summary_info['_updated_at']) # format date to a more "humanized" string
    _tmp_date = _tmp_date.to_day_datetime_string()
    general_data_summary_info['fmt_updated_at'] = _tmp_date # put formatted date in a different keyword to preserve original one as str of timestamp
    are_general_data = render_template_string(_str_of_are_template_html,
                                              general_data_summary_info = general_data_summary_info)
    #
    #
    # render are_evaluation
    _file = pathlib.Path(APP_ROOT + '/are/are_evaluation.html')
    _str_of_are_template_html = _file.read_text()
    #!#FIXME load and send: current score, max score, max of last updated date from history and all objects of domain (get max from all objects them do max of max-es)
    are_evaluation = render_template_string(_str_of_are_template_html)
    #
    #
    # render are_revenue
    _file = pathlib.Path(APP_ROOT + '/are/are_revenue.html')
    _str_of_are_template_html = _file.read_text()
    #!#FIXME load and send: current score, max score, max of last updated date from history and all objects of domain (get max from all objects them do max of max-es)
    are_revenue = render_template_string(_str_of_are_template_html)
    #
    #
    # render are_org_map
    _file = pathlib.Path(APP_ROOT + '/are/are_org_map.html')
    _str_of_are_template_html = _file.read_text()
    #!#FIXME load and send: current score, max score, max of last updated date from history and all objects of domain (get max from all objects them do max of max-es)
    are_org_map = render_template_string(_str_of_are_template_html)
    #
    #
    # render are_relationships
    _file = pathlib.Path(APP_ROOT + '/are/are_relationships.html')
    _str_of_are_template_html = _file.read_text()
    #!#FIXME load and send: current score, max score, max of last updated date from history and all objects of domain (get max from all objects them do max of max-es)
    are_relationships = render_template_string(_str_of_are_template_html)
    #
    #
    # render are_solution
    _file = pathlib.Path(APP_ROOT + '/are/are_solution.html')
    _str_of_are_template_html = _file.read_text()
    #!#FIXME load and send: current score, max score, max of last updated date from history and all objects of domain (get max from all objects them do max of max-es)
    are_solution = render_template_string(_str_of_are_template_html)
    #
    #
    # render are_decision_criteria
    _file = pathlib.Path(APP_ROOT + '/are/are_decision_criteria.html')
    _str_of_are_template_html = _file.read_text()
    #!#FIXME load and send: current score, max score, max of last updated date from history and all objects of domain (get max from all objects them do max of max-es)
    are_decision_criteria = render_template_string(_str_of_are_template_html)
    #
    #
    # --- END of businesses domains loading --- START loading main ARE page
    #
    #
    # *--- render are mai page from template file
    _file = pathlib.Path(APP_ROOT + '/are/are_start_page.html')
    _str_of_are_template_html = _file.read_text()
    return render_template_string(_str_of_are_template_html,
                                  page_title=page_title,
                                  sales_project_pk=sales_project_object_chosen,
                                  are_general_data=are_general_data,
                                  are_evaluation=are_evaluation,
                                  are_revenue=are_revenue,
                                  are_org_map=are_org_map,
                                  are_relationships=are_relationships,
                                  are_solution=are_solution,
                                  are_decision_criteria=are_decision_criteria
                                  )





# *---------------------------------------------------------------------------------
# *----- ADS-CHART [chart routes]  (see component README for details)
# *---------------------------------------------------------------------------------
# TODO ROADMAP.RMAP.000 login-protect route
@app.route('/are_chart/<business_domain>/<chart_type>')
def are_chart(business_domain, chart_type):
    # check both parameters to be in allowe values as business domain and type of chart: last 10 days, last month, full activity
    # generate a filename as full path (using APP_ROOT from Commons)
    # get data for required chart type (do not forget, you make a chart with scores evolution in time, so just get data from first ads_* level)
    # generate chart as PNG file in `/tmp` directory
    #? load file in a local variable
    #? save in a loval variable the content of `send_from_directory()` Flask function to send file
    #? remove generated file
    #? return saved content from local variable
    return '#!#FIXME need to code here'
    pass #!#FIXME need to code here



