#
# (c) 2023 RENware Software Systems
# cosana system
#
# ========================
# ads_evaluation API
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
# ads_evaluation API
# ============================================
from data_models.ads_evaluation_data_models import ads_evaluation


#* API GET data route that returns JSON data
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/api/ads_evaluation_get/<sales_project_pk>', methods=['GET'])
def ads_evaluation_api_get(sales_project_pk):
    """ api routes for ads_evaluation GET method:
        - /api/ads_evaluation_get/<sales_project_pk> - get data for requested Sales Project _pk (FK in ADS)
    """
    #
    #*----------------------- CASE: GET data for a specified SalesProject PK
    if sales_project_pk: # consider any string as SalesProject PK (ADS FK)
        _db_data = ads_evaluation.query.filter(ads_evaluation.sales_project_fk == sales_project_pk)
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




#* API POST data route that save data
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/api/ads_evaluation_post/<sales_project_pk>', methods=['GET', 'POST'])
def ads_evaluation_api_post(sales_project_pk):
    """ api routes for ads_evaluation POST method:
        - /api/ads_evaluation_post/<sales_project_pk> - INSERT or UPDATE for requested Sales Project _pk (FK in ADS)
    - structure of JSON data that is coming on http header
        ads_evaluation: {
                _pk: null,
                all other attributes (over 20...) see ORM data model, method `as_dict()`
            }
    - notes:
        - there are shown only relevant attributes, all other are not of interest
        - all keys are strings (being JSON format)
        - _pk attribute determine if database operation should be an INSERT (null / None or empty string value) or an UPDATE (relevant value)
        - _disabled attribute is igonored, on save it will be set on False
        - record sales_project_fk is taken from parameter sales_project_pk
        - local variable for ads_evaluation key will be named _ads_evaluation_key (to avoid conflicts with table name)
    """
    #
    if sales_project_pk: # consider any string as SalesProject PK (ADS FK)
        #
        # get request query parameter ads_evaluation
        _length_of_ads_evaluation_key = request.content_length
        if _length_of_ads_evaluation_key == 0: # no data sent
            return jsonify('fail - missing request data', 500)
        #
        #* get and parse JSON data from request header
        _ads_evaluation_key = request.get_json()
        #
        #* establish the database operation and create a database usable ads_evaluation object
        if (_ads_evaluation_key['_pk'] == '') or (not _ads_evaluation_key['_pk']):
            _database_operation = 'INSERT'
            _db_object = ads_evaluation()
        else:
            _database_operation = 'UPDATE'
            _ads_evaluation_key['_pk'] = str(_ads_evaluation_key['_pk']) # this conversion is required because client JS consider it token (UUID tyep)
            _db_object = ads_evaluation.query.filter(ads_evaluation._pk == _ads_evaluation_key['_pk']).first()
            if not _db_object:
                _db_object = ads_evaluation() # variant_1: crates a new one to avoid loosing of user enetered data
                _database_operation = 'INSERT' # if variant_1 then re-declare operation as INSERT
        #
        #* fulfill the _db_object information
        #--- business attributes
        _db_object.remarks = _ads_evaluation_key['remarks']
        #--- SELECTORS
        _db_object._final_applicability = str(_ads_evaluation_key['_final_applicability'])
        _db_object._customer_business = str(_ads_evaluation_key['_customer_business'])
        _db_object._customer_financials = str(_ads_evaluation_key['_customer_financials'])
        _db_object._access_to_funds = str(_ads_evaluation_key['_access_to_funds'])
        _db_object._decisive_event = str(_ads_evaluation_key['_decisive_event'])
        _db_object._formal_decision_making_criteria = str(_ads_evaluation_key['_formal_decision_making_criteria'])
        _db_object._solution_matching = str(_ads_evaluation_key['_solution_matching'])
        _db_object._resources_required_to_sell = str(_ads_evaluation_key['_resources_required_to_sell'])
        _db_object._current_relation_with_customer = str(_ads_evaluation_key['_current_relation_with_customer'])
        _db_object._value_of_business_proposal = str(_ads_evaluation_key['_value_of_business_proposal'])
        _db_object._internal_support = str(_ads_evaluation_key['_internal_support'])
        _db_object._credibility = str(_ads_evaluation_key['_credibility'])
        _db_object._cultural_compatibility = str(_ads_evaluation_key['_cultural_compatibility'])
        _db_object._approach_decision_making_criteria = str(_ads_evaluation_key['_approach_decision_making_criteria'])
        _db_object._political_aspects = str(_ads_evaluation_key['_political_aspects'])
        _db_object._short_term_revenue = str(_ads_evaluation_key['_short_term_revenue'])
        _db_object._long_term_revenue = str(_ads_evaluation_key['_long_term_revenue'])
        _db_object._risk = str(_ads_evaluation_key['_risk'])
        _db_object._profitability = str(_ads_evaluation_key['_profitability'])
        _db_object._strategical_value = str(_ads_evaluation_key['_strategical_value'])
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






