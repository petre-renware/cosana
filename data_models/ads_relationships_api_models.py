#
# (c) 2023 RENware Software Systems
# cosana system
#
# ========================
# ads_relationships API
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
# ads_relationships API
# ============================================
from data_models.ads_relationships_data_models import ads_relationships, ads_relationships_details



#* MASTER object (ads_relationships): API GET data route that returns JSON data
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/api/ads_relationships_get/<sales_project_pk>', methods=['GET'])
def ads_relationships_get(sales_project_pk):
    """ api routes for ads_relationships GET method:
        - /api/ads_relationships_get/<sales_project_pk> - get data for requested Sales Project _pk (FK in ADS)
    """
    #
    #*----------------------- CASE: GET data for a specified SalesProject PK
    if sales_project_pk: # consider any string as SalesProject PK (ADS FK)
        _ads_relationships_details_key = ads_relationships.query.filter(ads_relationships.sales_project_fk == sales_project_pk)
        #* prepare effecthive data (as data key)
        _data_out = {'data': [_item.as_dict() for _item in _ads_relationships_details_key.all()]}
        if _data_out:
            return jsonify(_data_out)
        else:
            return jsonify(_data_out, 404)
    else:
        #
        #*-----------------------CASE other cases returns a 404 error
        return jsonify('failed - nothing to process', 404)



#* DETAILS object (ads_relationships_details): DELETE route that save data (`ads_relationships_details` level)
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/api/ads_relationships_details_delete/<ads_relationships_details_pk>', methods=['DELETE'])
def ads_relationships_details_delete(ads_relationships_details_pk):
    """ api route for ads_relationships_details DELETE methods:
        - `/api/ads_relationships_details_delete/<ads_relationships_details_pk>` - DELETE for requested ADS Organization Map detail
    Parameters:
    =======================
        - ads_relationships_details_pk - mandatory - PK of ADS Organization Map detail
    """
    # get data object that should be deeted
    _db_object = ads_relationships_details.query.filter(ads_relationships_details._pk == ads_relationships_details_pk).first()
    if (not _db_object): #--- object does not exist (frequent was already deleted by somebody else)
        return jsonify('failed - nothing to process', 404)
    #
    db.session.delete(_db_object)
    db.session.commit()
    return jsonify('success', 200)



#* DETAILS object (ads_relationships_details): POST route that save data (`ads_relationships_details` level)
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/api/ads_relationships_details_post/<ads_relationships_pk>/<ads_relationships_details_pk>', methods=['GET', 'POST'])
@app.route('/api/ads_relationships_details_post/<ads_relationships_pk>', methods=['POST'])
def ads_relationships_details_post(ads_relationships_pk, ads_relationships_details_pk=None):
    """ api route for ads_relationships_details POST & DELETE methods:
        - /api/ads_relationships_details_post/<ads_relationships_pk>/<ads_relationships_details_pk> - INSERT, UPDATE, DELETE for requested ADS Organization Map detail
        NOTE: `ads_relationships_details_pk` can exist or not and the function will take accordingly decision for INSERT or UPDATE (aka *upsert* method)
    Parameters:
    =======================
        - ads_relationships_pk - mandatory - PK of ADS Organization Map
        - ads_relationships_details_pk - mandatory - PK of ADS Organization Map detail
    JSON query parameter structure (in data is as example):
    ========================
    ```
        ads_relationships_details_data": {
            "_disabled": false,
            "_pk": "pkd1",
            "_updated_at": "2023-02-21 15:39:30.207873",
            "_updated_by": "petre_1",
            "ads_relationships_fk": "any_string_usual_in_uuid4_format",
            "change_adaptability": "Visionary",
            "contact_status": "Briefly-Contacted",
            "name": "any_string",
            "our_status_in_relation": "Supporter",
            "position": "ad484237-7357-4371-bea2-560188b9e0c3",
        }
    ```
    """
    #
    # determine if should insert or update
    # NOTE: insert condition as True means INSERT and as False means UPDATE / DELETE
    _db_object = ads_relationships_details.query.filter(ads_relationships_details._pk == ads_relationships_details_pk).first()
    if (not _db_object): #--- determined as an INSERT operation
        _db_object = ads_relationships_details()
        _insert_condition = True
    else: #--- determined as an UPDATE operation and for GET methd returns the result
        _insert_condition = False
        if request.method == 'GET': #for GET methd returns the result
            _tmp_dict = dict(data = _db_object.as_dict())
            _rslt = jsonify(_tmp_dict)
            return _rslt
    # NOTE: in any case here resulted a valid `_db_object` that can be used to set-in data
    #
    #*--- get request query parameter ads_relationships_details
    _length_of_org_map_details_key = request.content_length
    if _length_of_org_map_details_key == 0: # no data sent
        return jsonify('fail - missing request data', 500)
    #* get and parse JSON data from request header
    _ads_relationships_details_key = request.get_json()
    # technical attributes
    if (_insert_condition): # if specified a clearly PK at insertion, that will be used, otherwise ORM model will generate a new one
        _tmp_pk = _ads_relationships_details_key.get('_pk')
        _db_object._pk = _tmp_pk if _tmp_pk else None
    _db_object.ads_relationships_fk = ads_relationships_pk # get it from route parameters
    # business attributes
    _db_object.name = _ads_relationships_details_key['name']
    _db_object.position = _ads_relationships_details_key['position']
    _db_object.change_adaptability = _ads_relationships_details_key['change_adaptability']
    _db_object.our_status_in_relation = _ads_relationships_details_key['our_status_in_relation']
    _db_object.contact_status = _ads_relationships_details_key['contact_status']
    #
    #*--- CASE: INSERT or UPDATE record
    if (request.method == 'POST'):
        if (_insert_condition): #--- only when INSERT record
            db.session.add(_db_object)
        db.session.commit()
        return jsonify('success', 200)
    #
    return jsonify('failed - nothing to process', 404)




#* MASTER object (ads_relationships): POST route that save data (`ads_relationships` level)
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/api/ads_relationships_post/<sales_project_pk>', methods=['GET', 'POST'])
def ads_relationships_post(sales_project_pk):
    """ api routes for ads_relationships POST method:
        - /api/ads_relationships_post/<sales_project_pk> - INSERT or UPDATE for requested Sales Project _pk (FK in ADS)
    - structure of JSON data that is coming on http header
        ads_relationships: {
                _pk: null,
                remarks: null,
                ads_relationships_details_data: [],
            }
    - notes:
        - there are shown only relevant attributes, all other are not of interest
        - all keys are strings (being JSON format)
        - _pk attribute determine if database operation should be an INSERT (null / None or empty string value) or an UPDATE (relevant value)
        - _disabled attribute is igonored, on save it will be set on False
        - record sales_project_fk is taken from parameter sales_project_pk
        - local variable for ads_relationships key will be named _ads_relationships_key (to avoid conflicts with table name)
    """
    #
    if sales_project_pk: # consider any string as SalesProject PK (ADS FK)
        #
        # get request query parameter ads_relationships
        _length_of_ads_relationships_key = request.content_length
        if _length_of_ads_relationships_key == 0: # no data sent
            return jsonify('fail - missing request data', 500)
        #
        #* get and parse JSON data from request header
        _ads_relationships_key = request.get_json()
        #
        #* establish the database operation and create a database usable ads_relationships object
        if (_ads_relationships_key['_pk'] == '') or (not _ads_relationships_key['_pk']):
            _database_operation = 'INSERT'
            _db_object = ads_relationships()
        else:
            _database_operation = 'UPDATE'
            _ads_relationships_key['_pk'] = str(_ads_relationships_key['_pk']) # this conversion is required because client JS consider it token (UUID tyep)
            _db_object = ads_relationships.query.filter(ads_relationships._pk == _ads_relationships_key['_pk']).first()
            if not _db_object:
                _db_object = ads_relationships() # variant_1: crates a new one to avoid loosing of user enetered data
                _database_operation = 'INSERT' # if variant_1 then re-declare operation as INSERT
        #
        #* fulfill the _db_object information
        #--- business attributes
        _db_object.remarks = _ads_relationships_key['remarks']
        #
        #TODO RMAP.005 - ADS Relationships save all function
        ''' this should be adjusted to contain ONLY those detail records updated (row level btn Sav enabled)
            here is implemented the version where ignore detailed data sent by client
        # _db_object.ads_relationships_details_data = _ads_relationships_key['ads_relationships_details_data'] # for the moment remains unchanged, maybe latter will change this
        ''' #TODO RMAP.005 - END of issue implementation
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





