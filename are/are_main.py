#
# copyright (C) 2023 RENware Software Systems
# ==========================================
# are (Account Review and Evaluation) entries
# author: Petre Iordanescu
#

import os, sys, uuid
import json
import pathlib
from datetime import datetime
import pendulum
from flask import render_template, render_template_string, redirect, url_for, send_from_directory, request, jsonify, abort
from data_models.salesproject_data_models import SalesProject
import matplotlib.pyplot as plt
from libutil.utils import genpk




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
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/are')
def are_builder():
    # get query parameter
    _tmp = request.args.get('sales_project_pk')
    if not _tmp:
        # from crud_data_admin.crud_data_admin_main import crud_admin_builder
        return redirect(url_for('crud_admin_builder'))
    #
    # check if sales project exists
    sales_project_object_chosen = _tmp if _tmp else 'unknown'
    # make an ampty default structure usable in case there is no ADS data for a domain
    _empty_bss_domain_response = {
        '_updated_at': '', # this is the meaning that is no "real" data available for that ADS business domein
        'score': {
            'crt_score': 0,
            'max_score': 0,
            'progress_percent': 0
        }
    }
    #
    # --- START of businesses domains loading
    #
    # render are_general_data
    _file = pathlib.Path(APP_ROOT + '/are/are_general_data.html')
    _str_of_are_template_html = _file.read_text()
    from data_models.ads_general_data_api_models import ads_general_data_api_get
    general_data_summary_info = ads_general_data_api_get(sales_project_object_chosen).get_json()
    if len(general_data_summary_info['data']) > 0:
        general_data_summary_info = general_data_summary_info['data'][0] # [0] is the last and only one record
        _tmp_date = pendulum.parse(general_data_summary_info['_updated_at']) # format date to a more "humanized" string
        _tmp_date = _tmp_date.to_day_datetime_string()
        general_data_summary_info['fmt_updated_at'] = _tmp_date # put formatted date in a different keyword to preserve original one as str of timestamp
    else:
        general_data_summary_info = _empty_bss_domain_response
    are_general_data = render_template_string(_str_of_are_template_html,
                                              general_data_summary_info = general_data_summary_info)
    #
    #
    # render are_evaluation
    _file = pathlib.Path(APP_ROOT + '/are/are_evaluation.html')
    _str_of_are_template_html = _file.read_text()
    from data_models.ads_evaluation_api_models import ads_evaluation_api_get
    evaluation_summary_info = ads_evaluation_api_get(sales_project_object_chosen).get_json()
    if len(evaluation_summary_info['data']) > 0:
        evaluation_summary_info = evaluation_summary_info['data'][0] # [0] is the last and only one record
        _tmp_date = pendulum.parse(evaluation_summary_info['_updated_at']) # format date to a more "humanized" string
        _tmp_date = _tmp_date.to_day_datetime_string()
        evaluation_summary_info['fmt_updated_at'] = _tmp_date # put formatted date in a different keyword to preserve original one as str of timestamp
    else:
        evaluation_summary_info = _empty_bss_domain_response
    are_evaluation = render_template_string(_str_of_are_template_html,
                                            evaluation_summary_info = evaluation_summary_info)
    #
    #
    # render are_revenue
    _file = pathlib.Path(APP_ROOT + '/are/are_revenue.html')
    _str_of_are_template_html = _file.read_text()
    from data_models.ads_revenue_api_models import ads_revenue_api_get
    revenue_summary_info = ads_revenue_api_get(sales_project_object_chosen).get_json()
    if len(revenue_summary_info['data']) > 0:
        revenue_summary_info = revenue_summary_info['data'][0] # [0] is the last and only one record
        _tmp_date = pendulum.parse(revenue_summary_info['_updated_at']) # format date to a more "humanized" string
        _tmp_date = _tmp_date.to_day_datetime_string()
        revenue_summary_info['fmt_updated_at'] = _tmp_date # put formatted date in a different keyword to preserve original one as str of timestamp
    else:
        revenue_summary_info = _empty_bss_domain_response
    are_revenue = render_template_string(_str_of_are_template_html,
                                         revenue_summary_info = revenue_summary_info)
    #
    #
    # render are_org_map
    _file = pathlib.Path(APP_ROOT + '/are/are_org_map.html')
    _str_of_are_template_html = _file.read_text()
    from data_models.ads_org_map_api_models import ads_org_map_get
    org_map_summary_info = ads_org_map_get(sales_project_object_chosen).get_json()
    if len(org_map_summary_info['data']) > 0:
        org_map_summary_info = org_map_summary_info['data'][0] # [0] is the last and only one record
        _tmp_date = pendulum.parse(org_map_summary_info['_updated_at']) # format date to a more "humanized" string
        _tmp_date = _tmp_date.to_day_datetime_string()
        org_map_summary_info['fmt_updated_at'] = _tmp_date # put formatted date in a different keyword to preserve original one as str of timestamp
    else:
        org_map_summary_info = _empty_bss_domain_response
    are_org_map = render_template_string(_str_of_are_template_html,
                                         org_map_summary_info = org_map_summary_info)
    #
    #
    # render are_relationships
    _file = pathlib.Path(APP_ROOT + '/are/are_relationships.html')
    _str_of_are_template_html = _file.read_text()
    from data_models.ads_relationships_api_models import ads_relationships_get
    relationships_summary_info = ads_relationships_get(sales_project_object_chosen).get_json()
    if len(relationships_summary_info['data']) > 0:
        relationships_summary_info = relationships_summary_info['data'][0] # [0] is the last and only one record
        _tmp_date = pendulum.parse(relationships_summary_info['_updated_at']) # format date to a more "humanized" string
        _tmp_date = _tmp_date.to_day_datetime_string()
        relationships_summary_info['fmt_updated_at'] = _tmp_date # put formatted date in a different keyword to preserve original one as str of timestamp
    else:
        relationships_summary_info = _empty_bss_domain_response
    are_relationships = render_template_string(_str_of_are_template_html,
                                               relationships_summary_info = relationships_summary_info)
    #
    #
    # render are_solution
    _file = pathlib.Path(APP_ROOT + '/are/are_solution.html')
    _str_of_are_template_html = _file.read_text()
    from data_models.ads_solution_api_models import ads_solution_get
    solution_summary_info = ads_solution_get(sales_project_object_chosen).get_json()
    if len(solution_summary_info['data']) > 0:
        solution_summary_info = solution_summary_info['data'][0] # [0] is the last and only one record
        _tmp_date = pendulum.parse(solution_summary_info['_updated_at']) # format date to a more "humanized" string
        _tmp_date = _tmp_date.to_day_datetime_string()
        solution_summary_info['fmt_updated_at'] = _tmp_date # put formatted date in a different keyword to preserve original one as str of timestamp
    else:
        solution_summary_info = _empty_bss_domain_response
    are_solution = render_template_string(_str_of_are_template_html,
                                          solution_summary_info = solution_summary_info)
    #
    #
    # render are_decision_criteria
    _file = pathlib.Path(APP_ROOT + '/are/are_decision_criteria.html')
    _str_of_are_template_html = _file.read_text()
    from data_models.ads_decision_criteria_api_models import ads_decision_criteria_get
    decision_criteria_summary_info = ads_decision_criteria_get(sales_project_object_chosen).get_json()
    if len(decision_criteria_summary_info['data']) > 0:
        decision_criteria_summary_info = decision_criteria_summary_info['data'][0] # [0] is the last and only one record
        _tmp_date = pendulum.parse(decision_criteria_summary_info['_updated_at']) # format date to a more "humanized" string
        _tmp_date = _tmp_date.to_day_datetime_string()
        decision_criteria_summary_info['fmt_updated_at'] = _tmp_date # put formatted date in a different keyword to preserve original one as str of timestamp
    else:
        decision_criteria_summary_info = _empty_bss_domain_response
    are_decision_criteria = render_template_string(_str_of_are_template_html,
                                                   decision_criteria_summary_info = decision_criteria_summary_info)
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
                                  general_data_summary_info=general_data_summary_info,
                                  are_evaluation=are_evaluation,
                                  evaluation_summary_info=evaluation_summary_info,
                                  are_revenue=are_revenue,
                                  revenue_summary_info=revenue_summary_info,
                                  are_org_map=are_org_map,
                                  org_map_summary_info=org_map_summary_info,
                                  are_relationships=are_relationships,
                                  relationships_summary_info=relationships_summary_info,
                                  are_solution=are_solution,
                                  solution_summary_info=solution_summary_info,
                                  are_decision_criteria=are_decision_criteria,
                                  decision_criteria_summary_info=decision_criteria_summary_info
                                  )





# *---------------------------------------------------------------------------------
# *----- ADS-CHART [chart routes]  (see component README for details)
# *---------------------------------------------------------------------------------
# TODO ROADMAP.RMAP.000 login-protect route
@app.route('/are_chart/<business_domain>/<chart_type>')
def are_chart(business_domain, chart_type):
    # check both parameters to be in allowe values as business domain and type of chart: last 10 days, last month, full activity
    _allowed_business_domains = ['general_data', 'evaluation', 'revenue', 'org_map', 'relationships', 'solution', 'decision_criteria']
    _allowed_chart_types = ['10_days', '30_days', 'full_period']
    #!#FIXME pay ATTN that need data fro history object which is sufficed with `_version` and is on details table(s)
    _business_domain_orm_object = ['ads_general_data', 'ads_evaluation', 'ads_revenue', 'ads_org_map', 'ads_relationships', 'ads_solution', 'ads_decision_criteria']
    if (business_domain not in _allowed_business_domains) or (chart_type not in _allowed_chart_types):
        return None
    #
    # generate a filename as full path (using APP_ROOT from Commons)
    _temp_fullname = str(uuid.uuid4()) + '.png'
    _picture_file = pathlib.Path(APP_ROOT + '/tmp/' + _temp_fullname) #!#FIXME check if generate a unique name as the is some latency in processing and not always chart is right generated but on server could be different !
    #
    #
    ''' the following graphs should be generated:
            1. last 10 days** - for last 10 days of activity
            2. last 30 days** - for last 30 days of activity
            3. full activity
        data will be get in full (for chart 3) the filtered to obtaind data for charts 1 & 2
    '''
    #
    # get data for required chart type (do not forget, you make a chart with scores evolution in time, so just get data from first ads_* level)
    #
    # generate chart as PNG file in `/tmp` directory
    #!#FIXME - DROP ME NEXT - test with some sample chart
    xpoints = [1, 6, 3, 5, 2]
    ypoints = [10, 60, 30, 50, 20]
    plt.plot(xpoints, ypoints)
    plt.savefig(_picture_file)
    #!#FIXME - TEST PASSED - chart generated
    #
    # split file into directory and name as neede by `send_from_directory()` function and return file content
    _path_file = os.path.split(_picture_file)
    _file_response = send_from_directory(_path_file[0], _path_file[1])
    #
    # remove any previously generated file
    ''' #TODO CODE FOR DELAYED REMOVE - probably do not need but just in case of performance issues...
    import subprocess, threading
    t = threading.Timer(10.0, subprocess.call, args=(['rm ... --- command ---'],))
    t.start()
    '''
    try: # ignore errors if file not exists
        os.remove(_picture_file)
    except:
        pass
    #
    return _file_response



