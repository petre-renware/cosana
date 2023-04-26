#
# (c) 2022 RENware Software Systems
# cosana system
#
# ========================
# SalesProjects API
#
#

from data_models.salesproject_data_models import SalesProject
import json
import os
import sys
import inspect
import pprint
import pendulum
from flask import jsonify, request, abort
from libutil.utils import getusr


from commons.commons import Commons
db = Commons.GetItem("db_sys")
if not db:
    print(f"*** FATAL ERROR in {__name__} - db_sys is null. System exit")
    sys.exit(1)
app = Commons.GetItem("app_portal")
if not app:
    print(f"*** FATAL ERROR in {__name__} - app_portal is null. System exit")
    sys.exit(1)


#
# SalesProjects API
# ============================================

# * GET data route that returns JSON table data
#TODO ROADMAP.RMAP.000 login-protect route

@app.route('/api/salesproject', methods=['GET'])
@app.route('/api/salesproject/<operation_or_pk>', methods=['GET'])
def salesproject_api(operation_or_pk=None):
    """ api GET routes for SalesProject
        - /api/salesproject - get all data
        - /api/salesproject/columns_definition  - get only columns definition
        - /api/salesproject/<_pk> -  data only for requested _pk
    """
    #
    # *----------------------- CASE: get for ALL DATA
    if not operation_or_pk and (request.method == 'GET'):
        _db_data = SalesProject.query
        # * prepare effecthive data (as data key)
        _data_out = {'data': [_item.as_dict() for _item in _db_data.all()]}
        if _data_out:
            return jsonify(_data_out)
        else:
            return jsonify(_data_out, 404)
    #
    # *----------------------- CASE: get COLUMNS DEFINITION
    if operation_or_pk == 'columns_definition' and (request.method == 'GET'):
        # * prepare an empty effective data set (as data key)
        _data_out = {'data': []}
        # * prepare columns definition (name & type) as (columns_definition key)
        _columns_list = SalesProject().as_dict()
        _data_out['columns_definition'] = _columns_list
        return jsonify(_data_out)
    #
    # *----------------------- CASE: get data for A SPECIFIED PK
    # consider any other string as a potential PK
    if operation_or_pk and (request.method == 'GET'):
        _db_data = SalesProject.query.filter(SalesProject._pk == operation_or_pk)
        # * prepare effecthive data (as data key)
        _data_out = {'data': [_item.as_dict() for _item in _db_data.all()]}
        #
        if _data_out:
            return jsonify(_data_out)
        else:
            return jsonify(_data_out, 404)
    #
    # * on all other cases returns a 500 error
    return jsonify('Internal error in function *salesproject_api*. Logic is bad - this code should not be reached', 500)



# * GET history of a SalesProject (or history parts)
#TODO ROADMAP.RMAP.000 login-protect route

@app.route('/api/salesproject_history/<sales_project_pk>', methods=['GET'])
def salesproject_history_api(sales_project_pk=None):
    """ api GET routes for GET history of SalesProject
        - /api/salesproject_history/<sales_project_pk> - SalsesProject to get history data
    """
    #
    #
    _db_data = SalesProject.query.filter(SalesProject._pk == sales_project_pk).first()
    # * if a sales project not found
    if not _db_data:
        return jsonify('Internal error in function *salesproject_history_api*. Logic is bad - this code should not be reached', 500)
    #
    #!#TODO - intended to be done @ 240426 @ 05:00
    '''#NOTE - #! drop this comment when finish
        - loop for all ADS domains... RECOMANDATION: use an array to keep ADS objects identificaton as needed in `are/are_main.py` function `are_chart(...)`
        - to get history use SQLAlchecmy Continuum data accesiong `__version__` library methods (array with history and exists designed methods to traverse history)
        - maybe should be usefull to get also for only one domain? could be "a lot of data" for all (?)
    '''
    ... #!CODE HERE ...



