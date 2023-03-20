#
# copyright (C) 2023 RENware Software Systems
# ==========================================
# ads (Account Data Sheet) entries
# author: Petre Iordanescu
#

import os, sys, pprint
import json, datetime, requests, pathlib
from flask import render_template, render_template_string, redirect, url_for, send_from_directory, request, jsonify, abort, url_for
from data_models.salesproject_data_models import SalesProject
from libutil.utils import genpk



#* get database and app from Commons
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



#*---------------------------------------------------------------------------------
#*----- initial package data (component instance parameters)
#*---------------------------------------------------------------------------------
sales_project_object_chosen = 'unknown' # PK of "in subject" Sales Project
page_title = 'Account Data Sheet'






#*---------------------------------------------------------------------------------
#*----- ADS-RT [main route and UI builder]  (see component README for details)
#*---------------------------------------------------------------------------------
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/ads')
def ads_builder():
    # get query parameter
    _tmp = request.args.get('sales_project_pk')
    #
    # check if sales project exists
    sales_project_object_chosen = _tmp if _tmp else 'unknown'
    #
    # render ads_general_data.html
    _file = pathlib.Path(APP_ROOT + '/ads/ads_general_data.html')
    _str_of_ads_template_html = _file.read_text()
    ads_general_data = render_template_string(_str_of_ads_template_html)
    #
    # render ads_evaluation
    _file = pathlib.Path(APP_ROOT + '/ads/ads_evaluation.html')
    _str_of_ads_template_html = _file.read_text()
    from data_models import ads_evaluation_lov_models
    _lov_ads_evaluation = ads_evaluation_lov_models.lov_ads_evaluation
    ads_evaluation = render_template_string(_str_of_ads_template_html,
                                            lov_ads_evaluation=_lov_ads_evaluation)
    #
    #
    #--- START of businesses domains loading
    #
    # render ads_revenue
    _file = pathlib.Path(APP_ROOT + '/ads/ads_revenue.html')
    _str_of_ads_template_html = _file.read_text()
    ads_revenue = render_template_string(_str_of_ads_template_html)
    #
    #
    # render ads_org_map
    _file = pathlib.Path(APP_ROOT + '/ads/ads_org_map.html')
    _str_of_ads_template_html = _file.read_text()
    from data_models.ads_org_map_api_models import ads_org_map_get
    _org_map_details_data = ads_org_map_get(sales_project_object_chosen)
    _org_map_details_data = _org_map_details_data.get_data(as_text=True)
    _org_map_details_data = json.loads(_org_map_details_data)
    if _org_map_details_data['data']:
        _org_map_details_data = _org_map_details_data['data'][0]['ads_org_map_details_data'] # it is expected list with exactly 1 object
    else:
        _org_map_details_data = _org_map_details_data['data']
    ads_org_map = render_template_string(_str_of_ads_template_html,
                                         org_map_details_data=_org_map_details_data)
    #
    #
    # render ads_relationships
    _file = pathlib.Path(APP_ROOT + '/ads/ads_relationships.html')
    _str_of_ads_template_html = _file.read_text()
    from data_models import ads_relationships_lov_models
    _lov_ads_relationships = ads_relationships_lov_models.lov_ads_relationships
    from data_models.ads_relationships_api_models import ads_relationships_get
    _relationships_details_data = ads_relationships_get(sales_project_object_chosen)
    _relationships_details_data = _relationships_details_data.get_json()
    if _relationships_details_data['data']:
        _relationships_details_data = _relationships_details_data['data'][0]['ads_relationships_details_data'] # it is expected list with exactly 1 object
    else:
        _relationships_details_data = _relationships_details_data['data']
    # use previously loaded business domain _org_map_details_data to get this info for "position" field (this comment is to pay attention to dependencies)
    ads_relationships = render_template_string(_str_of_ads_template_html,
                                               org_map_details_data = _org_map_details_data,
                                               relationships_details_data=_relationships_details_data,
                                               lov_ads_relationships=_lov_ads_relationships)
    #
    #
    # render ads_solution
    _file = pathlib.Path(APP_ROOT + '/ads/ads_solution.html')
    _str_of_ads_template_html = _file.read_text()
    from data_models import ads_solution_lov_models
    lov_ads_solution = ads_solution_lov_models.lov_ads_solution
    from data_models.ads_solution_api_models import ads_solution_get
    _solution_details_data = ads_solution_get(sales_project_object_chosen)
    _solution_details_data = _solution_details_data.get_json()
    if _solution_details_data['data']:
        _solution_details_data = _solution_details_data['data'][0]['ads_solution_details_data'] # it is expected list with exactly 1 object
    else:
        _solution_details_data = _solution_details_data['data']
    ads_solution = render_template_string(_str_of_ads_template_html,
                                          solution_details_data=_solution_details_data,
                                          lov_ads_solution=lov_ads_solution)
    #
    #
    # render ads_decision_criteria
    _file = pathlib.Path(APP_ROOT + '/ads/ads_decision_criteria.html')
    _str_of_ads_template_html = _file.read_text()
    from data_models import ads_decision_criteria_lov_models
    _lov_ads_decision_criteria = ads_decision_criteria_lov_models.lov_ads_decision_criteria
    from data_models.ads_decision_criteria_api_models import ads_decision_criteria_get
    _ads_decision_criteria_details_1criterialist_data = ads_decision_criteria_get(sales_project_object_chosen)
    _ads_decision_criteria_details_1criterialist_data = _ads_decision_criteria_details_1criterialist_data.get_json()
    if _ads_decision_criteria_details_1criterialist_data['data']:
        _ads_decision_criteria_details_1criterialist_data = _ads_decision_criteria_details_1criterialist_data['data'][0]['ads_decision_criteria_details_1criterialist_data'] # it is expected list with exactly 1 object
    else:
        _ads_decision_criteria_details_1criterialist_data = _ads_decision_criteria_details_1criterialist_data['data']
    # use previously loaded business domain to get `_relationships_details_data` info
    ads_decision_criteria = render_template_string(_str_of_ads_template_html,
                                                   relationships_details_data=_relationships_details_data,
                                                   ads_decision_criteria_details_1criterialist_data=_ads_decision_criteria_details_1criterialist_data,
                                                   lov_ads_decision_criteria=_lov_ads_decision_criteria)
    #
    #
    #--- END of businesses domains loading --- START loading main ADS page
    #
    #
    #*--- render ads mai page from template file
    _file = pathlib.Path(APP_ROOT + '/ads/ads_start_page.html')
    _str_of_ads_template_html = _file.read_text()
    return render_template_string(_str_of_ads_template_html,
                                  page_title = page_title,
                                  sales_project_pk = sales_project_object_chosen,
                                  ads_general_data = ads_general_data,
                                  ads_evaluation = ads_evaluation,
                                  ads_revenue = ads_revenue,
                                  ads_solution = ads_solution,
                                  ads_org_map = ads_org_map,
                                  ads_decision_criteria = ads_decision_criteria,
                                  ads_relationships = ads_relationships)















