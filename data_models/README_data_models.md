<small>*(c) 2022 RENware Software Systems*</small>

[PDF VERSION](/download{{ request.path }})

<small>

* Version: 0.12.0
* Last update: 230423
</small>

**Data models for system objects**

***

[TOC]

# Overview
## Physical organization

This component is designed to keep all data models for system objects. The data models can be:

* **data models** - class data models (mainly ORM mapped)
    >files with name `...OBJ...data_models.py`

* **API models** - "mini" API data models used basically for system internal operations
    >files with name `...OBJ...api_models.py`)

* **admin models** - models used by Flask Admin (system objects explorer) component[^na]
    >files with name `...OBJ...admin_model...`)

* **forms models** - forms for entering data through UI (usually but not strictly using *HTML forms* and *Flask-ETF*)
    >files with name `...OBJ...form_models.py`

* **LOV models** - list of values specific to that component / module
    >files with name `...OBJ...lov_models.py`



where `...OBJ...` prefix is the system object code-name. A special case of OBJ is reserver name `base_keys` - see following note.

>**NOTE 1**: `base_keys` (and code-files `base_keys...py`) represent templates (contain Mixin classes) for mandatory keys that should appear in almost all system objects, for example: primary key (as `_pk`), tenant code (as `_tenant_id`), etc.

>**NOTE 2**: the `.py` files define coded data in Python files, so any change in them will require (in most cases) restart of application. Sometimes, to have the ability to change data "on the fly" but to not store it in DB in relational format, it is kept as `JSON` files. These files will have yhe extension `.json` and name as representing do ain of what data contain.




## Conceptual data models

Conceptual model design can be found in [810.03 System Data](/810_DSGN/810.03_System_Data.md).



## Main data objects

This section is about ***logical organization***. Data objects are:

* **templates** which represents *standards* for data entities, attributes, etc. These can be found in `base_keys_data_models.py` file.

* **transactional data** which represents "day-by-day" data, frequently used in current activity. In this category enters:
    * **Sales Project** the projects at sales compartment level
    * **ads** representing the Account Data Sheet and all its detail objects. It can be found in `ads_[business_domain]_data_models.py` files, where `business_domain` can be one of the following:
        * `general_data`
        * `decision_criteria`
        * `evaluation`
        * `organization_map`
        * `relationships_approach`
        * `revenue`
        * `solution`

* **master data** which represents data with low changes rate, with interest at cross organization level and subject of interfacing with other systems. These can be found in `master_data_models.py` file. In this category enters:
    * **Company** is the list of organization clients and potential clients
    * **Solution** is the list of organization selling solutions, products, services, etc






## COSANA standard considerations

The following rules apply for all COSANA objects:

* objects primary keys are technical ones, meaning they are not business related anymore and are guaranteed to be unique worldwide, more exactly `string of uuid4` of 36 characters length, the string type assuring compatibility with any database model even JSON types (if database server allow for GUID / UUID types it can be easily converted back)
* for business reasons (search and human identification) all relevant objects are a `code` attribute which acts as alternate key (is unique and indexed) of UTF-8 string of 10 characters
* all objects are very permissive allowing `NULL` data for foreign keys; on the other hand, these kind of objects has a method named `check_health()` which returns `True` if a record "seems" to have completed all necessary data, otherwise returns `False` if any necessary attribute was left `NULL`; this rule assure for partial completion of data and letting finalization for latter or for other person
* all records have a minimum of audit data consisting of user that made last changes (`_updated_by`) and timestamp when did it (`_updated_at`)

>A complete list of *logical attributes* of an object (usable at development level), please note that all *business related object* has a method `as_dict()` who enumerates *business attributes*. The technical attributes are also included in resulted dictionary, but these are constructed using the corresponding inherited COSANA mixin (`BaseModel`).




# API Models

 This section describe implemented APIs, more exactly methods and routes


## SalesProject object

* **GET routes**:
    * `/api/salesproject` - get all data
    * `/api/salesproject/columns_definition`  - get only columns definition
    * `/api/salesproject/<_pk>` -  data only for requested _pk




## ads_general_data object

* **GET routes**:
    * `/api/ads_general_data_get/<sales_project_pk>` - to get a a specified Sales Project

* **POST routes**:
    * `/api/ads_general_data_post/<sales_project_pk>` - to insert / update data for a specified Sales Project
    >**NOTE**: `_disabled` attribute is ignored, on save it will be set on False




## ads_evaluation object

* **GET routes**:
    * `/api/ads_evaluation_get/<sales_project_pk>` - to get a a specified Sales Project

* **POST routes**:
    * `/api/ads_evaluation_post/<sales_project_pk>` - to insert / update data for a specified Sales Project
    >NOTE: `_disabled` attribute is ignored, on save it will be set on False




## ads_org_map object

### main level (`ads_org_map` object)

* **GET routes**:
    * `/api/ads_org_map_get/<sales_project_pk>` - to get a a specified Sales Project

* **POST routes**:
    * `/api/ads_org_map_post/<sales_project_pk>` - to insert / update data for a specified Sales Project
    >**NOTE 1**: `_disabled` attribute is ignored, on save it will be set on False
    >**NOTE 2**: details are not saved by default (see section ref to details object: *"details level (`ads_org_map_details` object)"*)




### details level (`ads_org_map_details` object)

* **GET routes**:
    * `/api/ads_org_map_details_post/<ads_org_map_pk>/<ads_org_map_details_pk>` - GET data for requested ADS Organization Map detail (with `ads_org_map_details` PK)
    * `/api/ads_org_map_details_post/<ads_org_map_pk>` - returns an UNPREDICTABLE / IRRELEVANT result (no data or first found row whatever will be it)

* **POST routes**:
    * `/api/ads_org_map_details_post/<ads_org_map_pk>/<ads_org_map_details_pk>` - INSERT, UPDATE for requested ADS Organization Map detail (with forcing a `ads_org_map_details` PK)
    * `/api/ads_org_map_details_post/<ads_org_map_pk>` - INSERT, UPDATE, DELETE for requested ADS Organization Map detail  (without forcing a `ads_org_map_details` PK)
    >**NOTE**: `ads_org_map_details_pk` can exist or not and the function will take accordingly decision for INSERT or UPDATE (aka *upsert* method)

* **DELETE routes**:
    * `/api/ads_org_map_details_delete/<ads_org_map_details_pk>` - DELETE for requested ADS Organization Map detail

* **Parameters** (for all methods):
    * ads_org_map_pk - mandatory - PK of ADS Organization Map
    * ads_org_map_details_pk - optional - PK of ADS Organization Map detail

* **attached JSON structure** (provided with example data and shorted to relevant attributes at API level):

    ```json
    ads_org_map_details_data": {
        "_disabled": false,
        "_pk": "1b30c52b-a962-4165-9c7c-e65be186e7d3",
        "_updated_at": "2023-02-08 19:00:02.379619",
        "_updated_by": "petre",
        "ads_org_map_fk": "037a7274-adec-4b20-bf2b-a0af97e3ce35",
        "code": "FM",
        "consultant": false,
        "decision_make": false,
        "financial_evaluation": true,
        "name": "Financial Manager",
        "need_to_sign": true,
        "technical_evaluation": false
        }
    ```




## ads_revenue object

* **GET routes**:
    * `/api/ads_revenue_api_get/<sales_project_pk>` - to get a a specified Sales Project

* **POST routes**:
    * `/api/ads_revenue_post/<sales_project_pk>` - to insert / update data for a specified Sales Project
    >**NOTE**: `_disabled` attribute is ignored, on save it will be set on False





## ads_relationships object

### main level (`ads_relationships` object)

* **GET routes**:
    * `/api/ads_relationships_get/<sales_project_pk>` - to get a a specified Sales Project

* **POST routes**:
    * `/api/ads_relationships_post/<sales_project_pk>` - to insert / update data for a specified Sales Project
    >**NOTE 1**: `_disabled` attribute is ignored, on save it will be set on False
    >**NOTE 2**: details are not saved by default (see section ref to details object: *"details level (`ads_relationships_details` object)"*)



### details level (`ads_relationships_details` object)

* **GET routes**:
    * `/api/ads_relationships_details_post/<ads_relationships_pk>/<ads_relationships_details_pk>` - GET data for requested ADS Organization Map detail (with `ads_relationships_details` PK)
    * `/api/ads_relationships_details_post/<ads_relationships_pk>` - returns an UNPREDICTABLE / IRRELEVANT result (no data or first found row whatever will be it)

* **POST routes**:
    * `/api/ads_relationships_details_post/<ads_relationships_pk>/<ads_relationships_details_pk>` - INSERT, UPDATE for requested ADS Organization Map detail (with forcing a `ads_relationships_details` PK)
    * `/api/ads_relationships_details_post/<ads_relationships_pk>` - INSERT, UPDATE, DELETE for requested ADS Relationships detail  (without forcing a `ads_relationships_details` PK)
    >**NOTE**: `ads_relationships_details_pk` can exist or not and the function will take accordingly decision for INSERT or UPDATE (aka *upsert* method)

* **DELETE routes**:
    * `/api/ads_relationships_details_delete/<ads_relationships_details_pk>` - DELETE for requested ADS Organization Map detail

* **Parameters** (for all methods):
    * ads_relationships_pk - mandatory - PK of ADS Organization Map
    * ads_relationships_details_pk - optional - PK of ADS Organization Map detail

* **attached JSON structure** (provided with example data and shorted to relevant attributes at API level):

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




## ads_solution object

### main level (`ads_solution` object)

* **GET routes**:
    * `/api/ads_solution_get/<sales_project_pk>` - to get a a specified Sales Project

* **POST routes**:
    * `/api/ads_solution_post/<sales_project_pk>` - to insert / update data for a specified Sales Project
    >**NOTE 1**: `_disabled` attribute is ignored, on save it will be set on False
    >**NOTE 2**: details are not saved by default (see section ref to details object: *"details level (`ads_solution_details` object)"*)



### details level (`ads_solution_details` object)

* **GET routes**:
    * `/api/ads_solution_details_post/<ads_solution_pk>/<ads_solution_details_pk>` - GET data for requested ADS Organization Map detail (with `ads_solution_details` PK)
    * `/api/ads_solution_details_post/<ads_solution_pk>` - returns an UNPREDICTABLE / IRRELEVANT result (no data or first found row whatever will be it)

* **POST routes**:
    * `/api/ads_solution_details_post/<ads_solution_pk>/<ads_solution_details_pk>` - INSERT, UPDATE for requested ADS Organization Map detail (with forcing a `ads_solution_details` PK)
    * `/api/ads_solution_details_post/<ads_solution_pk>` - INSERT, UPDATE, DELETE for requested ADS Relationships detail  (without forcing a `ads_solution_details` PK)
    >**NOTE**: `ads_solution_details_pk` can exist or not and the function will take accordingly decision for INSERT or UPDATE (aka *upsert* method)

* **DELETE routes**:
    * `/api/ads_solution_details_delete/<ads_solution_details_pk>` - DELETE for requested ADS Organization Map detail

* **Parameters** (for all methods):
    * ads_solution_pk - mandatory - PK of ADS Organization Map
    * ads_solution_details_pk - optional - PK of ADS Organization Map detail

* **attached JSON structure** (provided with example data and shorted to relevant attributes at API level):

    ```
        ads_solution_details_data": {
            "_disabled": false,
            "_pk": "testPK",
            "_updated_at": "2023-02-19 15:48:57.601344",
            "_updated_by": "petre",
            "ads_solution_details_data": [
                {
                    "_disabled": false,
                    "_pk": "xxx_test_detalii",
                    "_updated_at": "2023-02-19 15:48:57.601344",
                    "_updated_by": "petrica",
                    "ads_solution_fk": "testPK",
                    "feature_type": "Advantage",
                    "feature_type_info": {
                        "color": "orange",
                        "score": 10,
                        "text": "Advantage"
                    },
                    "name": "element de solutie de test #1",
                    "strength": "Weak",
                    "strength_info": {
                        "color": "red",
                        "score": 0,
                        "text": "Weak"
                    }
                }
            ],
            "description": "descriere solutie de test",
            "name": "solutie de test intro de Petre",
            "remarks": "inregistrare de test api GET",
            "score": 999999
        }
    ```




## ads_decision criteria object

### MASTER OBJECT (`ads_decision_criteria` object)

* **GET routes**:
    * `/api/ads_decision_criteria_post/<sales_project_pk>` - to get a a specified Sales Project

* **POST routes**:
    * `/api/ads_decision_criteria_post/<sales_project_pk>` - to insert / update data for a specified Sales Project
    >**NOTE 1**: `_disabled` attribute is ignored, on save it will be set on False
    >**NOTE 2**: details are not saved by default (see section ref to details object: *"details level (`ads_decision_criteria_details_1criterialist` object)"*)


### DECISION CRITERIA LIST OBJECT (`ads_decision_criteria_details_1criterialist` object)

* **DELETE routes**:
    * `/api/ads_decision_criteria_details_1criterialist_delete/<ads_decision_criteria_details_1criterialist_pk>` - DELETE for requested ADS Decision Criteria detail (List of criteria)

* **POST** routes:
    * `/api/ads_decision_criteria_details_1criterialist_post/<ads_decision_criteria_pk>/<ads_decision_criteria_details_1criterialist_pk>` - INSERT, UPDATE for requested ADS Organization Map detail
    * **NOTE 1**: `ads_decision_criteria_details_1criterialist_pk` can exist or not and the function will take accordingly decision for INSERT or UPDATE (aka *upsert* method)
    * **Parameters**:
        * `ads_decision_criteria_pk` - mandatory - PK of ADS Organization Map
        * `ads_decision_criteria_details_1criterialist_pk` - mandatory - PK of ADS Organization Map detail
    * **attached JSON structure** (provided with example data and shorted to relevant attributes at API level):

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


### PEOPLE MAP TO CRITERIA OBJECT (`ads_decision_criteria_details_2maptoperson` object)

Level 2 (`ads_decision_criteria_details_2maptoperson`) is maintained through this API (being in fact an `m:m` intersection with `client_importance` attribute). Data sent will be collection of dictionaries `{ads_relationships_details_fk, client_importance}` as can be seen in attached JSON




# Data models special remarks

Data models are classic `SqlAlchemy` constructs and there is nothing special to note here. All data objects have `_pk` which represents *technical PK* normally and default generated as `string of uuid4`. In sime useful situations that pattern is broken by using a relevant and unique (even over distributed data deployments) combination of characters (`UTF-8`), usually to be recognizable in implementations and system maintenance.

Ref **ADS Evaluation** (code-name: `ads_evaluation`) object should note that most of attributes are calculated "around" each database attribute used for selection criteria (see ADS Evaluation tor a better understanding) and 2 pair of them are "not obvious" and the e are:

* properties terminated with `_score` which represents the score "bring" by that criteria, ie as selected by an user in UI
* properties terminated with `_text` which generate the "human" text used in UI for respective selector list (usual being something like a *combo box*)


All `ads_*` data models contains column  `_useless_to_keep_history: bool, optional no default` just *usable to set and keep history at ADS level tables*. Typical usage: at each detail change, set it as `UPDATE ads_...bss_domain... SET _useless_to_keep_history = not _useless_to_keep_history` to force versioning component to save history.

## Scoring

Every **ADS ...business...domain...** object has and expose a *`score`* attribute that calculate the *score for the whole record* and can be used in UI. Data structure returned for SCORING process is:

```
"score" = {
    "crt_score": 111111,
    "max_score": 999999,
    "progress_percent": 0,
}
```

The score (both current and maximum) is calculated ***distinct and specific*** for each business domain in corresponding *data model* file (ie, `ads_...business...domain..._data_models.py`). Calculations is of two types:

* **equally weighted** where each ***current*** item from respective domain has the same weight, equivalent of `score = number of items`; ***maximum*** is given by "number of items"
* **differently weighted** where each ***current*** item from respective domain has ith own points (in not equal values) and so has its contribution to score; ***maximum*** is given by `sum od max points of each item`; for these domains, if exists, is used also associated *LOV* code-file

Progress percennt is also calculated as `float` and *rounded to 1 decimal*.


## LOV data

Data regarding *values for lists / selectors* and *some scoring items* is kept out of database in *JSON structures stored as code python files* called **LOV - List Of Values**. Files are located in `data_models` component and respects all its conventions. The business domains that behave LOVs are:

* ads_decision_criteria_lov_models.py
* ads_evaluation_lov_models.py
* ads_org_map_lov_models.py
* ads_relationships_lov_models.py
* ads_solution_lov_models.py

Each of these code-files contains comments that describe structure and helpers defined.







# Functions list (ADS Evaluation business domain - server side)

## Database layer - LOV

### ADS Evaluation

Location: `data_models/ads_evaluation_lov_models.py`

* `get_lov_list_of_codes(item_group, evaluation_selector)`:
    * Return tuple with all posable codes for a selector
    * Parameters:
        * item_group: string - level 1, GROUP of evaluation criteria
        * evaluation_selector: string - the evaluation item searched for list of possible codes
    * Return:
        * tuple with all evaluation_selector possible codes

* `get_lov_list_of_tuples(item_group, evaluation_selector)`
    * Return all tuples for a selector
    * Parameters:
        * item_group: string - level 1, GROUP of evaluation criteria
        * evaluation_selector: string - the evaluation item searched for list of possible codes
    * Return:
        * tuple with all tuples for a selector

* `get_lov_selector_item_score(item_group, evaluation_selector, evaluation_code)`
    * Return score for a chosen value of a selector
    * Parameters:
        * item_group: string - level 1, GROUP of evaluation criteria
        * evaluation_selector: string - the evaluation item searched for list of possible codes
        * evaluation_code: string - the evaluation code selected from UI selection list of evaluation_tem
    * Return:
        * score

* `get_lov_selector_item_text(item_group, evaluation_selector, evaluation_code)`
    * Return text for a chosen value of a selector
    * Parameters:
        * item_group: string - level 1, GROUP of evaluation criteria
        * evaluation_selector: string - the evaluation item searched for list of possible codes
        * evaluation_code: string - the evaluation code selected from UI selection list of evaluation_tem
    * Return:
        * score

* `get_lov_group_label(item_group)`
    * Return group label
    * Parameters
        * item_group: string - level 1, GROUP of evaluation criteria
    * Return
        * label of specified group or 'ERR: Not known group ...name_of_group...'

* `get_max_achievable_score()`
    * Return total MAXIMUM achievable score for total STRUCTURE






### ADS Organization Map

* `get_score_total()`
    * Return score maximum points for Organization Map domain







### ADS Relationships

Location: `data_models/ads_relationships_lov_models.py`

* `get_selector_info(selector, code)`:
    * Return for a selector item text, score, color
    * Parameters:
        * selector - desired selector
        * code - desired item of selector
    * Return:
        * if data found return dictionary with {"text", "score", "color"} containing desired data
        * if data NOT found return dictionary with {"text", "score", "color"} containing null






[^na]: Component not available in open free CE edition
