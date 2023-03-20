#
# (c) 2023 RENware Software Systems
# cosana system
#
# ========================
# ads_decision_criteria API
#
#

from data_models.ads_decision_criteria_data_models import \
    ads_decision_criteria, \
    ads_decision_criteria_details_1criterialist, \
    ads_decision_criteria_details_2maptoperson
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
# ads_decision_criteria API
# ============================================


#* MASTER object (ads_decision_criteria)
# ----------------------

#* MASTER object (ads_decision_criteria): API GET data route that returns JSON data
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/api/ads_decision_criteria_get/<sales_project_pk>', methods=['GET'])
def ads_decision_criteria_get(sales_project_pk):
    """ api routes for ads_decision_criteria GET method:
        - /api/ads_decision_criteria_get/<sales_project_pk> - get data for requested Sales Project _pk (FK in ADS)
    """
    #
    #*----------------------- CASE: GET data for a specified SalesProject PK
    if sales_project_pk:  # consider any string as SalesProject PK (ADS FK)
        _db_object = ads_decision_criteria.query.filter(ads_decision_criteria.sales_project_fk == sales_project_pk)
        #* prepare effecthive data (as data key)
        _data_out = {'data': [_item.as_dict() for _item in _db_object.all()]}
        if _data_out:
            return jsonify(_data_out)
        else:
            return jsonify(_data_out, 404)
    else:
        #
        #*-----------------------CASE other cases returns a 404 error
        return jsonify('failed - nothing to process', 404)


#* MASTER object (ads_decision_criteria): POST route that save data (`ads_decision_criteria` level)
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/api/ads_decision_criteria_post/<sales_project_pk>', methods=['GET', 'POST'])
def ads_decision_criteria_post(sales_project_pk):
    """ api routes for ads_decision_criteria POST method:
        - /api/ads_decision_criteria_post/<sales_project_pk> - INSERT or UPDATE for requested Sales Project _pk (FK in ADS)
    - structure of JSON data that is coming on http header
        ads_decision_criteria: {
                _pk: null,
                remarks: null,
                ads_decision_criteria_details_1criterialist_data: [
                    #... other specific atrributes here ...
                    ads_decision_criteria_details_2maptoperson_data: [],
                ]
            }
    - notes:
        - there are shown only relevant attributes, all other are not of interest
        - all keys are strings (being JSON format)
        - _pk attribute determine if database operation should be an INSERT (null / None or empty string value) or an UPDATE (relevant value)
        - _disabled attribute is igonored, on save it will be set on False
        - record sales_project_fk is taken from parameter sales_project_pk
        - local variable for ads_decision_criteria key will be named _ads_decision_criteria_key (to avoid conflicts with table name)
    """
    #
    if sales_project_pk:  # consider any string as SalesProject PK (ADS FK)
        #
        # get request query parameter ads_decision_criteria
        _length_of_ads_decision_criteria_key = request.content_length
        if _length_of_ads_decision_criteria_key == 0:  # no data sent
            return jsonify('fail - missing request data', 500)
        #
        #* get and parse JSON data from request header
        _ads_decision_criteria_key = request.get_json()
        #
        #* establish the database operation and create a database usable ads_decision_criteria object
        if (_ads_decision_criteria_key['_pk'] == '') or (not _ads_decision_criteria_key['_pk']):
            _database_operation = 'INSERT'
            _db_object = ads_decision_criteria()
        else:
            _database_operation = 'UPDATE'
            # this conversion is required because client JS consider it token (UUID tyep)
            _ads_decision_criteria_key['_pk'] = str(
                _ads_decision_criteria_key['_pk'])
            _db_object = ads_decision_criteria.query.filter(
                ads_decision_criteria._pk == _ads_decision_criteria_key['_pk']).first()
            if not _db_object:
                # variant_1: crates a new one to avoid loosing of user enetered data
                _db_object = ads_decision_criteria()
                _database_operation = 'INSERT'  # if variant_1 then re-declare operation as INSERT
        #
        #* fulfill the _db_object information
        # --- business attributes
        _db_object.remarks = _ads_decision_criteria_key['remarks']
        #
        #TODO RMAP.007 - ADS Decision Criteria save all function
        """ this should be adjusted to contain ONLY those detail records updated (row level btn Sav enabled)
            here is implemented the version where ignore detailed data sent by client
        # _db_object.ads_decision_criteria_details_1criterialist_data = _ads_decision_criteria_key['ads_decision_criteria_details_1criterialist_data'] # for the moment remains unchanged, maybe latter will change this
        """  # !#TODO RMAP.007 - END of issue implementation
        # --- FOREIGN KEYS
        # this is set as loaded Sales Project in interface
        _db_object.sales_project_fk = str(sales_project_pk)
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


#* DECISION CRITERIA list object (ads_decision_criteria_details_1criterialist)
# ----------------------


#* DECISION CRITERIA object (ads_decision_criteria_details_1criterialist): DELETE route that save data (`ads_decision_criteria_details_1criterialist` level)
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/api/ads_decision_criteria_details_1criterialist_delete/<ads_decision_criteria_details_1criterialist_pk>', methods=['DELETE'])
def ads_decision_criteria_details_1criterialist_delete(ads_decision_criteria_details_1criterialist_pk):
    """ api route for ads_decision_criteria_details_1criterialist DELETE methods:
        - `/api/ads_decision_criteria_details_1criterialist_delete/<ads_decision_criteria_details_1criterialist_pk>` - DELETE for requested ADS Organization Map detail
    Parameters:
    =======================
        - ads_decision_criteria_details_1criterialist_pk - mandatory - PK of ADS Organization Map detail
    """
    # get data object that should be deeted
    _db_object = ads_decision_criteria_details_1criterialist.query.filter(
        ads_decision_criteria_details_1criterialist._pk == ads_decision_criteria_details_1criterialist_pk).first()
    if (not _db_object):  # --- object does not exist (frequent was already deleted by somebody else)
        return jsonify('failed - nothing to process', 404)
    #
    # remove all childs of level 1 (ie, level 2 associated objects) - the can be found on `ads_decision_criteria_details_2maptoperson_data` attribute
    _db_childs = _db_object.ads_decision_criteria_details_2maptoperson_data
    if (_db_childs):
        for _child in _db_childs:
            db.session.delete(_child)
    #
    # continue to delete the object in subject for this procedure
    db.session.delete(_db_object)
    db.session.commit()
    return jsonify('success', 200)


#* DECISION CRITERIA object (ads_decision_criteria_details_1criterialist): POST route that save data (`ads_decision_criteria_details_1criterialist` level)
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/api/ads_decision_criteria_details_1criterialist_post/<ads_decision_criteria_pk>/<ads_decision_criteria_details_1criterialist_pk>', methods=['GET', 'POST'])
@app.route('/api/ads_decision_criteria_details_1criterialist_post/<ads_decision_criteria_pk>', methods=['POST'])
def ads_decision_criteria_details_1criterialist_post(ads_decision_criteria_pk, ads_decision_criteria_details_1criterialist_pk=None):
    """ api route for ads_decision_criteria_details_1criterialist POST methods:
        - /api/ads_decision_criteria_details_1criterialist_post/<ads_decision_criteria_pk>/<ads_decision_criteria_details_1criterialist_pk> - INSERT, UPDATE, DELETE for requested ADS Organization Map detail
        NOTE: `ads_decision_criteria_details_1criterialist_pk` can exist or not and the function will take accordingly decision for INSERT or UPDATE (aka *upsert* method)
    Parameters:
    =======================
        - ads_decision_criteria_pk - mandatory - PK of ADS Organization Map
        - ads_decision_criteria_details_1criterialist_pk - mandatory - PK of ADS Organization Map detail
    JSON query parameter structure (in data is as example):
    ========================
    ```
        ads_decision_criteria_details_1criterialist_data": [
        {
            "_disabled": false,
            "_pk": "test1_PK2",
            "_updated_at": "2023-03-01 05:30:00.259668",
            "_updated_by": "petre",
            "ads_decision_criteria_details_2maptoperson_data": [
                {
                    "_disabled": false,
                    "_pk": "mypk3",
                    "_updated_at": "2023-03-03 05:30:00.259668",
                    "_updated_by": "tot petre",
                    "ads_decision_criteria_details_1criterialist_fk": "test1_PK2",
                    "ads_relationships_details_fk": "3f7fda32-8717-4a03-9215-87a7997aa068",
                    "client_importance": "Neutral",
                },
                ...
            ],
            "ads_decision_criteria_fk": "PKtest1",
            "name": "criteriu 1",
            "our_status": "Strong",
            },
            ...
        ],
    ```
    """
    #
    # determine if should insert or update
    # NOTE: insert condition as True means INSERT and as False means UPDATE / DELETE
    _db_object = ads_decision_criteria_details_1criterialist.query.filter(
        ads_decision_criteria_details_1criterialist._pk == ads_decision_criteria_details_1criterialist_pk).first()
    if (not _db_object):  # --- determined as an INSERT operation
        _db_object = ads_decision_criteria_details_1criterialist()
        _insert_condition = True
    else:  # --- determined as an UPDATE operation and for GET methd returns the result
        _insert_condition = False
        if request.method == 'GET':  # for GET methd returns the result
            _tmp_dict = dict(data=_db_object.as_dict())
            _rslt = jsonify(_tmp_dict)
            return _rslt
    # NOTE: in any case here resulted a valid `_db_object` that can be used to set-in data
    #
    #*--- get request query parameter ads_decision_criteria_details_1criterialist
    _length_of_org_map_details_key = request.content_length
    if _length_of_org_map_details_key == 0:  # no data sent
        return jsonify('fail - missing request data', 500)
    #* get and parse JSON data from request header
    _ads_decision_criteria_details_1criterialist_key = request.get_json()
    # technical attributes
    if (_insert_condition):  # if specified a clearly PK at insertion, that will be used, otherwise ORM model will generate a new one
        _tmp_pk = _ads_decision_criteria_details_1criterialist_key.get('_pk')
        _db_object._pk = _tmp_pk if _tmp_pk else None
    # get it from route parameters
    _db_object.ads_decision_criteria_fk = ads_decision_criteria_pk
    # business attributes
    _db_object.name = _ads_decision_criteria_details_1criterialist_key['name']
    _db_object.our_status = _ads_decision_criteria_details_1criterialist_key['our_status']
    #
    #*--- process data for level 2 by attribute `ads_decision_criteria_details_2maptoperson_data.ads_decision_criteria_details_2maptoperson_data`
    _sent_map = _ads_decision_criteria_details_1criterialist_key['ads_decision_criteria_details_2maptoperson_data']
    _existing_map_persons = list() # initialize list of existing persons
    for i in _db_object.ads_decision_criteria_details_2maptoperson_data: # construct list of existing persons
        _existing_map_persons.append(i.ads_relationships_details_fk)
    for _sent_person in _sent_map:
        # check if in MAP object exists in set of keys (ads_relationships_details_fk)
        if _sent_person['ads_relationships_details_fk'] in _existing_map_persons:
            # UPDATE object in relationship decision (see how constructed _existing_map_persons)
            _idx = _existing_map_persons.index(_sent_person['ads_relationships_details_fk'])
            _to_update_map_object = _db_object.ads_decision_criteria_details_2maptoperson_data[_idx]
            _to_update_map_object.client_importance = _sent_person['client_importance']
        else:
            # INSERT decision (create new ads_decision_criteria_details_2maptoperson(), set data from sent ine, append in relationship-list)
            _to_insert_map_object = ads_decision_criteria_details_2maptoperson()
            _to_insert_map_object.client_importance = _sent_person['client_importance']
            _to_insert_map_object.ads_relationships_details_fk = _sent_person['ads_relationships_details_fk']
            _db_object.ads_decision_criteria_details_2maptoperson_data.append(_to_insert_map_object)
    #
    #*--- CASE: INSERT or UPDATE record
    if (request.method == 'POST'):
        if (_insert_condition):  # --- only when INSERT record
            db.session.add(_db_object)
        db.session.commit()
        return jsonify('success', 200)
    #
    return jsonify('failed - nothing to process', 404)
