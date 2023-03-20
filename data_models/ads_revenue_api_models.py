#
# (c) 2023 RENware Software Systems
# cosana system
#
# ========================
# ads_revenue API
#
#

import json, os, sys
import inspect, pprint
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
# ads_revenue API
# ============================================
from data_models.ads_revenue_data_models import ads_revenue



#* MASTER object (ads_revenue): API GET data route that returns JSON data
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/api/ads_revenue_get/<sales_project_pk>', methods=['GET'])
def ads_revenue_get(sales_project_pk):
    """ api routes for ads_revenue GET method:
        - /api/ads_revenue_get/<sales_project_pk> - get data for requested Sales Project _pk (FK in ADS)
    """
    #
    #*----------------------- CASE: GET data for a specified SalesProject PK
    if sales_project_pk: # consider any string as SalesProject PK (ADS FK)
        _db_data = ads_revenue.query.filter(ads_revenue.sales_project_fk == sales_project_pk)
        #* prepare effecthive data (as data key)
        _data_out = {'data': [_item.as_dict() for _item in _db_data.all()]}
        if _data_out:
            return jsonify(_data_out)
        else:
            return jsonify(_data_out, 404)
    else:
        #
        #*-----------------------CASE other cases returns a 404 error
        return jsonify('failed - nothing to process', 404)






#* MASTER object (ads_revenue): POST route that save data (`ads_revenue` level)
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/api/ads_revenue_post/<sales_project_pk>', methods=['GET', 'POST'])
def ads_revenue_post(sales_project_pk):
    """ api routes for ads_revenue POST method:
        - /api/ads_revenue_post/<sales_project_pk> - INSERT or UPDATE for requested Sales Project _pk (FK in ADS)
    - notes:
        - there are shown only relevant attributes, all other are not of interest
        - all keys are strings (being JSON format)
        - _pk attribute determine if database operation should be an INSERT (null / None or empty string value) or an UPDATE (relevant value)
        - _disabled attribute is igonored, on save it will be set on False
        - record sales_project_fk is taken from parameter sales_project_pk
        - local variable for ads_revenue key will be named _ads_revenue_key (to avoid conflicts with table name)
    """
    #
    if sales_project_pk: # consider any string as SalesProject PK (ADS FK)
        #
        # get request query parameter ads_revenue
        _length_of_ads_revenue_key = request.content_length
        if _length_of_ads_revenue_key == 0: # no data sent
            return jsonify('fail - missing request data', 500)
        #
        #* get and parse JSON data from request header
        _ads_revenue_key = request.get_json()
        #
        #* establish the database operation and create a database usable ads_revenue object
        if (_ads_revenue_key['_pk'] == '') or (not _ads_revenue_key['_pk']):
            _database_operation = 'INSERT'
            _db_object = ads_revenue()
        else:
            _database_operation = 'UPDATE'
            _ads_revenue_key['_pk'] = str(_ads_revenue_key['_pk']) # this conversion is required because client JS consider it token (UUID tyep)
            _db_object = ads_revenue.query.filter(ads_revenue._pk == _ads_revenue_key['_pk']).first()
            if not _db_object:
                _db_object = ads_revenue() # variant_1: crates a new one to avoid loosing of user enetered data
                _database_operation = 'INSERT' # if variant_1 then re-declare operation as INSERT
        #
        #* fulfill the _db_object information
        #--- business attributes
        _db_object.remarks = _ads_revenue_key['remarks']
        _db_object.max_expected = round(float(_ads_revenue_key['max_expected'] or 0), 2)
        _db_object.min_expected = round(float(_ads_revenue_key['min_expected'] or 0), 2)
        _db_object.allocated_budget = round(float(_ads_revenue_key['allocated_budget'] or 0), 2)
        _db_object.market_price = round(float(_ads_revenue_key['market_price'] or 0), 2)
        _db_object.customer_min_expectation =round(float( _ads_revenue_key['customer_min_expectation'] or 0), 2)
        _db_object.customer_max_expectation = round(float(_ads_revenue_key['customer_max_expectation'] or 0), 2)
        #
        #--- FOREIGN KEYS
        _db_object.sales_project_fk = str(sales_project_pk) # this is set as loaded Sales Project in interface
        # all other aparmeters are left as null being defaulted
        #* execute database operation (only for INSERT case needed) and commit
        if _database_operation == 'INSERT':
            db.session.add(_db_object)
        db.session.commit()
        return jsonify('success', 200)
    else:
        #
        #*-----------------------CASE: other cases returns a 404 error
        return jsonify('failed - nothing to process', 404)










