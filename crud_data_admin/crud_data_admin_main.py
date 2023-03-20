#
# copyright (C) 2022 RENware Software Systems
# ==========================================
# main portal entries
# author: Petre Iordanescu
#


import os, sys
import json, datetime, requests, pathlib
from flask import render_template, render_template_string, redirect, url_for, send_from_directory, request, jsonify, abort, url_for
from data_models.salesproject_data_models import SalesProject
from data_models.salesproject_form_models import SalesProjectForm
from libutil.utils import genpk


#* get database and app from Commons
from commons.commons import Commons
# gete database object fro Commons
db = Commons.GetItem("db_sys")
if not db:
    print(f"*** FATAL ERROR in {__name__} - db_sys is null. System exit")
    sys.exit(1)
# get app from Commons
app = Commons.GetItem("app_portal")
if not app:
    print(f"*** FATAL ERROR in {__name__} - portal app is null. System exit")
    sys.exit(1)
# get cosana web system root directory
APP_ROOT = Commons.GetItem("APP_ROOT")
if not app:
    print(f"*** FATAL ERROR in {__name__} - APP_ROOT is null. System exit")
    sys.exit(1)


#TODO (OPISS.001) integration variables / constants
#!====================================================================================================
#! should be fetched from Commons (these should be converted to objects and used accordingly in module)
#!      - ORM_object_name = SalesProject - is the name of **ORM** data object
#!      - FORM_object_name = SalesProjectForm - is the name of **FORM** data object used to add / edit data
#* locally calculated (not subject of Commons but listed for latter documentation)
#*      - PHY_object_name = salesproject - is the name of **physical** data object (physical table name) used in "routes and functions" name
#*        it is obtained by lowercase(ORM_object_name)
#*      - page_title - representing the page title and data form header
#*        it is calculated by inserting space before an upper letter in ORM_object_name
#*        followed by a constant string -administration or Data Form - this append being hard coded in HTML template because this is known what is good for
#!====================================================================================================
ORM_object_name = 'SalesProject'
FORM_object_name = 'SalesProjectForm'
page_title = ''.join(' ' + char if char.isupper() else char.strip() for char in ORM_object_name).strip()
PHY_object_name = ORM_object_name.lower() #!# route names should have it as parameter / OK.DONE \: [AJAX route sent to DataTable also obtain itt as as string]
#!====================================================================================================














#*---------------------------------------------------------------------------------
#*-----  FORM-RT [route for FORM data handling (specific HTML forms handling)] (see component README for details)
#*---------------------------------------------------------------------------------
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/crud_data_form/salesproject/<operation_or_pk>', methods=['GET', 'POST', 'DELETE'])
def crud_data_form(operation_or_pk):
    """
    Description:
    =============================
        - route for FORM data handling assuring specific CRUD DATA ADMIN operation and masking general system API (provided in data_models)
        - act as a proxy for data operations when user makes use of table action buttons (New, Edit, Delete)
    Methods & operations:
    =============================
        - GET: will try to find record with PK identified by parameter and return it otherwise return 404
        - DELETE: will delete the record with PK identified by parameter and return result of operation
        - POST: will treat http body as standard HTML POST request and do depending on parameter values:
            - *form_op_new* an insertion (new record data entered)
            - *form_op_edit* an updating (existeing record data changed)
    """
    #
    #* ------------------------------------------------------ GET method
    if (request.method == 'GET'):
        _resp = data_models.salesproject_api_models.salesproject_api(operation_or_pk) # get data using cosana API view function
        _data = _resp.json if _resp.status_code == 200 else abort(404, 'Bad request or missing data at request for /crud_data_form/salesproject/...')
        # adjust data to eliminate the list as this route always operate with ONE SINGLE / UNIQUE row of data
        _data["data"] = _data["data"][0]
        return jsonify(_data)
    #
    #* ------------------------------------------------------ DELETE method
    elif (request.method == 'DELETE'):
        SalesProject.query.filter(SalesProject._pk == operation_or_pk).delete()
        db.session.commit()
        _ok_resp = {'result': 'SUCCESS'}
        return jsonify(_ok_resp)
    #
    #* ------------------------------------------------------ POST method
    elif (request.method == 'POST'):
        # just give a default structure supposing the sales project is completely new; it will be updated latter accordingly
        _op_status = dict(
            visible = 'YES',
            pk = '',
            code = ''
        )
        #
        #* a NEW operation was requested by HTML form
        if (operation_or_pk == 'form_op_new'):
            _form_definition = SalesProjectForm()
            if _form_definition.validate_on_submit():
                # save data
                _sales_project_object = SalesProject()
                _sales_project_object._pk = genpk()
                _sales_project_object.code = _form_definition.code.data
                _sales_project_object.description = _form_definition.description.data
                _sales_project_object.notes = _form_definition.notes.data
                db.session.add(_sales_project_object) # generate new object
                db.session.commit()
                # build operation status
                _op_status = dict(
                    visible = 'YES',
                    pk = _sales_project_object._pk,
                    code = _sales_project_object.code
                )
        #
        #* an EDIT operation was requested by HTML form
        if (operation_or_pk == 'form_op_edit'):
            _form_definition = SalesProjectForm()
            if _form_definition.validate_on_submit():
                # get object that was edited
                _sales_project_object = SalesProject.query.filter(SalesProject._pk == _form_definition.pk.data).first()
                if not _sales_project_object: # was not found - possible deleted meanwhile by somebody else...
                    _op_status = dict(
                        visible = 'YES',
                        pk = '',
                        code = ''
                    )
                else: # was found, so save data
                    _sales_project_object.code = _form_definition.code.data
                    _sales_project_object.description = _form_definition.description.data
                    _sales_project_object.notes = _form_definition.notes.data
                    _sales_project_object._disabled = _form_definition.disabled.data
                    db.session.commit()
                    # build operation status
                    _op_status = dict(
                        visible = 'YES',
                        pk = _sales_project_object._pk,
                        code = _sales_project_object.code
                    )
        #
        #* common part regardless of new / edit operation: call view function of DEF-RT, send it form status to be shown as alert on rendered page
        _redirect_url = url_for('crud_admin_builder',
                                visible = _op_status['visible'],
                                pk = _op_status['pk'],
                                code = _op_status['code'])
        return redirect(_redirect_url)
    #
    #* ------------------------------------------------------ unknoknw method - this is a malfuntion or malitious call
    else:
        abort(404, 'Bad request or missing data at request for /crud_data_form/salesproject/...')
    return







#*---------------------------------------------------------------------------------
#*----- TABLE-RT [table data endpoint - data provider] (see component README for details)
#*---------------------------------------------------------------------------------
import data_models.salesproject_api_models
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/crud_table_data_feeder/salesproject')
def crud_data_feeder(): # act as a proxy for data
    """ Data Table data endpoint - AJAX data provider for:
        - all data (actual functionality)
        - server side filtered data (future functionality #TODO - ROADMAP.001)
        - server side search data (future functionality #TODO - ROADMAP.001)
    Returns:
        - dict(list(dict)) with data as required (see component README doc for details)
    """
    _tmp_data = get_data()
    return _tmp_data




#*---------------------------------------------------------------------------------
#*----- DEF-RT [main route and UI builder]  (see component README for details)
#*---------------------------------------------------------------------------------
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/crud_admin/salesproject')
def crud_admin_builder():
    """ CRUD main route that launch the table (define, configure and launch it)
    Notes:
    =======================
        - FORM-RT send *visible, pk, code* as request query parameters - all are strings
        - visible should be YES for show aler box or anything else not show
    """
    ajax_options = {
        "ajax_url": '/crud_table_data_feeder/' + PHY_object_name, # specifies ajax URL where to load data (obtained by calculating from crud admin parameters)
        "run_at_server_side": 'false' # server side processing is future functionlity @ #TODO - ROADMAP.001
    }
    # build DataTable script ajax options use get_data(only_keys=True) just for getting keys which are column names
    _data_dictionary_sample = get_data(only_keys=True)
    column_options = list()
    for _key in _data_dictionary_sample:
        _orderable = 'true'
        _searchable = 'true'
        #* special decisions for Actions column
        if _key == 'actions':
            _orderable = 'false'
            _searchable = 'false'
        column_options.append({
            "id": _key,
            "orderable": _orderable,
            "searchable": _searchable,
            "title": _key.title(),
            "visible": str(set_column_visibility(col_code_name=_key)).lower() # convert it to JavaScript boolean notations
        })
    # prepare (render for Jinja replacements) form data HTML (to be included in main crud_table_template)
    _form_file = pathlib.Path(APP_ROOT + '/crud_data_admin/crud_form_template.html')
    _form_definition = SalesProjectForm()
    _str_for_form_file_html = _form_file.read_text()
    _str_for_form_file_html = render_template_string(_str_for_form_file_html, form = _form_definition)
    _last_op_status = dict(
        visible = request.args.get('visible') or False,
        pk = request.args.get('pk') or "",
        code = request.args.get('code') or ""
    )
    # render table from template file
    _file = pathlib.Path(APP_ROOT + '/crud_data_admin/crud_start_page.html')
    _str_of_crud_table_template_html = _file.read_text()
    return render_template_string(_str_of_crud_table_template_html,
                                  page_title = page_title,
                                  ajax_options = ajax_options,
                                  column_options = column_options,
                                  form_template_HTML = _str_for_form_file_html,
                                  last_op_status = _last_op_status)



#*---------------------------------------------------------------------------------
#*----- [helper functions]
#*---------------------------------------------------------------------------------
#* get data from database
def get_data(only_keys=None):
    """ Get data from database and alter it to add Actions column(s)
    Parameters:
    ==========================
        - **only_keys=None** specify if to get real data or just a sample record for attributes name and type
    Returns:
    ==========================
        - list(dict) with data as required (empty or None if no datta found)
    """
    #
    #* get only data definition
    if only_keys:
        #* get columns definition using data_model api (called local by using the view function - so its return is a http response)
        _resp = data_models.salesproject_api_models.salesproject_api('columns_definition')
        data = _resp.json
        data = data['columns_definition']
        # add actions column as empty
        data['actions'] = ''
        return data
    #
    #* get data using data_model api (called local by using the view function - so its return is a http response)
    _resp = data_models.salesproject_api_models.salesproject_api()
    data = _resp.json if _resp.status_code == 200 else list()
    #
    #* scan for keys like 'ads_*' and alter them to show only a flag as symbol if info exists
    for _tmp_dict in data['data']:
        for _item_key in _tmp_dict:
            if (_tmp_dict[_item_key]) and ('ads_' in _item_key): # only if has some value and name references an ads_* entry
                _tmp_dict[_item_key] = '*'
    #
    #* add suplementary columns as needed: Actions, RowID
    for _tmp_row in data['data']:
        _row_pk = _tmp_row['_pk'] # get data for key == '_pk'
        # add Actions column (ie, with buttons for Edit, Delete and other specific depending of data)
        _tmp_row_edt = f'<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#neweditform" data-oper="EDIT" data-recpk="{_row_pk}" style="margin:2px;">EDT</button>'
        _tmp_row_del = f'<button type="button" class="btn btn-danger btn-sm" onclick="delete_data_row(\'{_row_pk}\')" style="margin:2px;">DEL</button>'
        _tmp_row_ads = f'<a class="btn btn-warning btn-sm" role="button" href="/ads?sales_project_pk={_row_pk}" style="margin:2px;">ADS</a>'
        #TODO: impelement RMAP.002 (new actions button here)
        _tmp_row['actions'] = _tmp_row_edt + ' ' + _tmp_row_del + ' ' + _tmp_row_ads
        # add RowId column
        _tmp_row['DT_RowId'] = _row_pk
    #
    #* set an ecplicit empty list of no data (HTML emplate will need it to make a right renedering for empty table)
    if data is None:
        data = [] # make it an empty list to have a status on screen
    #
    #* return corresponding data
    return data



def set_column_visibility(col_code_name):
    """
    Establish a column visibility (hidden) based on its code-name (columns with code name containing ['_pk', '_id', '_fk', 'ads_'] will be hidden)
    Parameters:
        - **col_code_name** the column code-name
    Returns: boolean
    """
    if not bool(col_code_name): return False # return False for emoty strings otherwise in operator return True
    col_code_name_lowered = col_code_name.lower()
    # NOTE: for nexte for loop:  'ads_' keys contain data ref each ADS business domain, so will be hidden because their "long name";
    # NOTE: if are not ignored they will show an "*" meaning that some data exists for that business domain, but the long name will decrease visibility of relevant data
    for special_names in ['pk', 'id', 'fk', 'ads_']:
        _test_it = bool(special_names in col_code_name_lowered)
        if _test_it: return False # pay attn that visibility is False in enumerated case
    return True



