<small>*(c) 2022, 2023 RENware Software Systems*</small>

**cosana**    
***Comprehensive Sales Analysis & Review***

[PDF VERSION](/download{{ request.path }})

***

[TOC]

# CHANGELOG v0.5.0 `ads` Organization map business domain

<small>With (F) are marked those entries that are **FEATURES** so should be highlighted on *Release Note* documents.</small>    
<small>With (B) are marked those entries that are **BUG FIXES** so should be highlighted on *Release Note* documents.</small>

## 0.5.0 `ads` Organization map business domain

### 053.beta (230215 05:30)

* 230215piu_b all-side work @ `ads_org_map` QA review and close and release
* 230215piu_a all-side work @ `ads_org_map` review and clean `ads_org_map_api_models.py` at MASTER level and `ads_start_page.html`
* 230214piu_d client-server-side work @ `ads_org_map` solve the problem with org map details by detecting if are changes in DETAILS area and deny MASTER saving
* 230214piu_c server-side work @ `ads_org_map` !- FIX ERRORS -! API POST route at MASTER level; updated documentation (README specs)
* 230214piu_b client-side work @ `ads_start_page.html` !- FIRST DRAFT -! continue with SAVE for MASTER record
* 230214piu_a server-side work @ `ads_org_map` !- FIRST DRAFT -! API POST route at MASTER level
* 230213piu_c client-side work @ `ads_start_page.html` continue with SAVE for MASTER record
    * [ ] 0. change attribute **Remarks** containing text `... and SAVE TO GENERATE A NEW ORGANIZATION MAP`


### 052.alpha (230213 05:30)

* 230213piu_b client-side work @ `ads_org_map.html` code DEL record
* 230213piu_a server-side work @ server-side `ads_org_map` API DEL route for details (`ads_org_map_details`) & update README specs
* 230212piu_a client-side work @ `ads_org_map.html` code NEW record (row) function (continue from 230211piu_f):
    * [x] 1. function `org_map_details_NEW_record()`: set new form as visible, empty form, activate new form on call, "go" to first field
    * [x] 2. function `org_map_details_ProcessNewFormData(boolean)`: detect what was pressed (Submit or Cancel) and if true continue saving process
    * [x] 3. collect new entry form data / reuse `org_map_details_CollectData(rec_pk)` to co collect from new data entry form when rec_pk is `null`
    * [x] 4. cleanup code `ads_org_map.html`; test for ADS ORg Map master existence, if no disable details area
    * [x] 5. updated technical documentation [`810.03_System_Data`](/810_DSGN/810.03_System_Data.md)
    * [x] 6. save new entry for data (request on the same route as in `org_map_details_SAV_record()` function)
* 230211piu_f client-side work @ `ads_org_map.html` code NEW record (row) function:
    * [x] 0. made strategy as: use a dedicated form / set of input fields to collect data - this "div" is hidden and maintained / displayed by "New" op
    * [x] 1. develop new form: div: `id="ads_org_map_new_data_form"` and input fields with `ads_org_map_details_new_...field_code_name...`
    * [x] 2. prepared skeleton for next 2 functions: `org_map_details_NEW_record()` & `org_map_details_ProcessNewFormData(boolean)` - marked zone with `#FIXME work area for 230211piu_f`
    * [x] 3. test for function `org_map_details_ProcessNewFormData()` if reached with right parameter (`true` when Submit and `false` when Cancel from new entry form) - *PASS*
    * ***continued on 230212piu_a***


### 051.alpha (230211 12:30)

* 230211piu_e fixed bug in file `ads/ads_main.py`
    ```
    File "/mnt/d/_T0_PROJECTS/0000-0128 COSANA Comprehensive Sales Analysis Review/830-DEV/ads/ads_main.py", line 88, in ads_builder
    _org_map_details_data = _org_map_details_data['data'][0]['ads_org_map_details_data'] # it is expected list with exactly 1 object IndexError: list index out of range
    ```
* 230211piu_d client-side work @ `ads_org_map.html` code SAVE record (row) function
* 230211piu_c client-side work `ads_org_map` collect entered data
* 230211piu_b client-side work `ads_org_map` init details section (own HTML file)
* 230211piu_a server-side `ads_org_map` API route, updated to allow for GET operations to bring data (ONLY for all parameters)
* 230210piu_c server-side `ads_org_map` API POST route for details (`ads_org_map_details`) - review, fix & update
* 230210piu_b server-side `ads_org_map` API, add POST route to INSERT, UPDATE, DELETE details (`ads_org_map_details`); updated technical documentation (README specs of `data_models`):
    * [x] 1. made an short plan
    * [x] 2. "calculate" condition for INSERT or UPDATE (upsert)
    * [x] 3. write code (search for `#!#FIXME determine and set right value`)
    * [x] 4. write code for DELETE operation
    * [x] 5. get data from request http header
    * [x] 6. write code for INSERT UPDATE operations
    * [x] 7. test it for errors at "compilation" (launch in python VM)


### 050.alpha (230210 04:10)

* 230210piu_a client-side work @ `ads_org_map.html` review and update page id(s) / activate "Sav" button on changes in table
* 230209piu_c client-side work @ `ads_org_map.html` finished with all Jinja variables ref TAB loading data including "updated by... at..." at org map details (table) level
* 230209piu_b **(@NOT WORKS - CHANGED STRATEGY in 230209piu_c)** client-side work @ `ads_org_map.html` table add a column to mark *dirty record*. This is `String` type and can be:
    * `null` or `''` (empty string) = nothing to do (it is default value at loading)
    * `to INS` = to insert that record (`_pk` attribute will be generated from here or left `null`, the API will decide what to do with it)
    * `to DEL` = to delete that record
    * `to UPD` to update that record
    * *NOTE:* code to maintain this column reside in `ads_org_map.html` specific (jva)scripts section
* 230209piu_a client-side work @ `ads_org_map.html` table for `ads_org_map_details`:
    * [x] 0. *DIS* (`_disable`) attribute does not appear and like "actual pattern" at **ADS** level, does not matter
    * [x] 1. make all rows editable, regardless of any state, exactly like it would be a n attribute of `ads_org_map`
    * [x] 2. drop *Edt*, *Sav* and *Revert* operations and buttons
    * [x] 3. keep *Del* button and ask for confirmation (*NOTE*: let the table behavior exactly like it would be a n attribute of `ads_org_map` - Del is a permanently action with confirmation and does not produce any *"dirty"* implications (it is like it would be without that record from page load))
    * ***NOTE:*** lef marker `<!-- //!#TODO - continue from here with Jinja data -->` where to continue from
* 230208piu_j client-side work @ `ads_org_map.html` table for `ads_org_map_details` make Jinja fields and render accordingly from server-side. ***CONCLUSION:**
    1. set the Jinja variables for _pk and fields up to `name` (exclusive)
    2. IT IS NOT GOOD TO USE JINJA BECAUSE page rendering is not STATIC @ page initial load and if data updates need refresh...
    3. TO CHANGE FOR Javascript load of table from sent data collected by get_ads_org_map(sales_project_pk)


### 049.alpha (230208 21:00)

* 230208piu_i client-side `ads_org_map.html` for remaining bss domains areas to update: *updated `get_ads_org_map(sales_project_pk)`*
* 230208piu_h server-side `ads_org_map_data_model`, collection `ads_org_map_details_data` attribute make serializable
* 230208piu_g server-side `ads_org_map_data_model`, object `ads_org_map_details` created UniqueConstraint for ()`code`, `ads_org_map_fk`) attribute combination; updated DB and DB script
* 230208piu_f client-side work @ `ads_org_map.html`, table for `ads_org_map_details` set `on-click` event buttons for: New, Save, Revert operations
* 230208piu_e client-side work @ `ads_org_map.html`, table for `ads_org_map_details` add buttons for: New, Save, Revert operations
* 230208piu_d client-side work @ `ads_start_page.html` for ADS Organization Map business domain (code `ads_org_map`):
    * [x] 1. create variables that keep api routes
    * [x] 2. create own general data structure in `ads_all_data'
    * [x] 3. changes detection function
    * [x] 4. changes visual mark, function `mark_page_dirty(dirty)`
* 230208piu_c prepare client side: enhance `ads_org_map.html`: field for `_pk`, HTML editable field (how to setup and use) and edit / delete controls
* 230208piu_b prepare client side: skeleton for `ads_org_map.html`: init data rendering, form with a (hidden) table for details + a specific draft java script
* (B) 230208piu_a fixed domain business TAB color changing for changes
* 230207piu_g update documentation (README specs) ref `ads_org_map_api_models.py` GET and POST routes (POST route as should be in future)


### 048.alpha (2230207 21:30)

* 230207piu_f created `ads_org_map_api_models.py` only for GET method (POST commented with example code from other ads business domain for latter code) and included in `sys_core` boot chain to verify that everything is right up here in order to go on to construct business data
* 230207piu_e created (for details see [`/810_DSGN/810.System_Data.md`](/810_DSGN/810.03_System_Data.md)):
    * *`ads_org_map_details_data`* attribute in objects `ads_org_map` to contain all related `ads_org_map_details` data (collection attribute style)
    * *`ads_org_map_data`* attribute in objects `ads_org_map` to contain related `ads_org_map` data (parent attribute style)
* 230207piu_e created required attributes in objects `ads_org_map_details` (see [`/810_DSGN/810.03_System_Data.md`](/810_DSGN/810.03_System_Data.md)); test, updated DB, updated DB script
* 230207piu_d physically create & test & fixed errors, the new created (in 230207piu_c) objects
* 230207piu_c started `ads_org_map` & `ads_org_map_details` draft objects (only skeleton with *remarks* attribute and technical keys) and included in `sys_core` boot chain to verify that everything is right up here in order to go on to construct business data
* 230207piu_b updated [`/810_DSGN/810.02_System_Landscape.md`](/810_DSGN/810.02_System_Landscape.md) ref availability version
* 230207piu_a updated doc [`/810_DSGN/810.03_System_Data.md`](/810_DSGN/810.03_System_Data.md) ref *ADS Organization map business domain*
* 220206piu_g archived CHANGELOG version 0.3.0

--- ooo ---
