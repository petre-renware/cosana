<small>*(c) 2022, 2023 RENware Software Systems*</small>

**cosana**    
***Comprehensive Sales Analysis & Review***

[PDF VERSION](/download{{ request.path }})

***

[TOC]

# CHANGELOG v0.9.0 - `ads` ADS Decision criteria business domain

<small>With (F) are marked those entries that are **FEATURES** so should be highlighted on *Release Note* documents.</small>    
<small>With (B) are marked those entries that are **BUG FIXES** so should be highlighted on *Release Note* documents.</small>

## 0.9.0 - `ads` ADS Decision criteria business domain

### 067.beta (230310 19:00)

* 230310piu_c check all DAS Decision Criteria code, made a full cleanup and release 0.9.0 as beta
* (B) 230310piu_b **FIXED** BUG @ saving MAP info for records having NO DATA in level 2 (MAP object - `ads_decision_criteria_details_2maptoperson`)
    * SOLUTION:  Jinja variable `ns.person_pk` is set inside level 2 loop **and moved outside level 2 loop**
    * probably is nothing constructed by Jinja render, having no record in MAP object
    * component: ads_decision_criteria.html`,
    * function: `decision_criteria_details_CollectData(rec_pk)`,
    * ERROR: - at EDIT for no data into level 2 MAP object
    * INDICATIONS: Jinja variable `ns.person_pk` not set for no records in level 2 MAP for a criteria / should check if set inside level 2 loop and move outside
* 230310piu_a1 ALL Solution updates and cleanings for extended tests:
    * update DB test with human readable PKs;
    * update data model set CASCADE for delete and update for domains: Organization Map; generate new db script as `full_db_sys_0.9.0-067.sql`
* 230310piu_a UI interface (`ads_decision_criteria.html`), made form and operation of *New* - for this operation only a new decision criteria with `our_status` is add, then user can update map with persons; updated API `ads_decision_criteria_api_models.py`
* 230310piu_a update ROADMAP (**OPISS.006**) with changing all ADS business domains to "a big form" to ce able to introduce Bootstrap standard *validation for required fields*
* 230309piu_d `ads_decision_criteria_details_1criterialist` full Sav of level 1 and 2 API for `ads_decision_criteria_details_1criterialist` for level 2 to do update / insert for all records (hide to client the details of M:M implementation as relational - as level 2 it would be attributes of level 1)
    * [x] 1. coded for UPDATE `client_importance` for existing records (persons mapped)
    * [x] 2. coded for INSERT `client_importance` for new records (persons unmapped)
* 230309piu_c code cleanup and small corrections and improvements, NOT functional but ref code styling
* 230309piu_b API test new data collected for MAP in 230308piu_f
* 230309piu_a LOV (`ads_decision_criteria_lov_models.py`) introduced a updated value for `client_importance` list: `NOT KNOWN` to 'UNKNOWN' and set dedicated selector option value to it (actual set on "")
* 230308piu_f UI interface (`ads_decision_criteria.html`) for level 2 (MAP) data
    * review and update `id(s)` and `data-person_pk`
    * update function `solution_details_CollectData` and *Sav* operations  where send collection of dictionaries `{ads_relationships_details_fk, client_importance}`
* 230308piu_e LOV (`ads_decision_criteria_lov_models.py`) introduced a new value for `client_importance` list: `NOT KNOWN` and set selector option for unknown, value to it (actual set on "")
* 230308piu_d UI interface (`ads_decision_criteria.html`), set for `client_importance` selector options the **`data-person_pk`** data attribute which contains *person PK* - will be used in build level 2 intersection (`ads_decision_criteria_details_2maptoperson`) as pair of ***(`ads_relationships_details_fk`, `client_importance`)***
* 230308piu_c UI interface (`ads_decision_criteria.html`), review and update `id(s)`; prepare *Collect New Data* and *Sav* operations for level 1 (`ads_decision_criteria_details_1criterialist`) (for level 2 just send collection of dictionaries `{ads_relationships_details_fk, client_importance}` and left for latter processing)


### 066.alpha (230308 05:45)

* 230308piu_b update API for `ads_decision_criteria_details_1criterialist` for level 1 (`ads_decision_criteria_details_1criterialist`) data
* 230308piu_a updated data_models README specs documentation ref API for `ads_decision_criteria_details_1criterialist`
* 230307piu_b API for `ads_decision_criteria_details_1criterialist` commented code where should "concentrate"
* 230307piu_a more changes:
    * [x] `ads_decision_criteria_lov_models.py` updated colors for Bootstrap colors
    * [x] `ads_decision_criteria.html` updated to activate "Sav" button on any change in details zone
    * [x] `ads_decision_criteria.html` updated to change cell color depending on information (`client_importance` attribute) loaded resulting a "visual colored map"
* 230306piu_c `ads_decision_criteria_api_models.py` change DELETE route function (`ads_decision_criteria_details_1criterialist_delete(ads_decision_criteria_details_1criterialist_pk)`) to dele MAP DETAILS using new relationship created at 230306piu_b (instead of accessing directly the 2nd level MAP object)
* 230306piu_b `ads_decision_criteria_data_models.py` restored `back_populates` clauses for relationship between 1st and 2nd level
* 230306piu_a review and update
    * [x] `as_dict()` functions for data models `ads_decision_criteria_data_models.py` after 230305piu_b changes - NO UPDATE NEEDED
    * [x] data models README specs and update last changed date
* 230305piu_b UI interface (`ads_decision_criteria.html`), made operations of *Del*; updated API `ads_decision_criteria_api_models.py` and data model `ads_decision_criteria_data_models.py`
* (B) 230305piu_a `crud_data_admin` table data get (`get_data(only_keys=None)`), scan for keys like 'ads_*' and alter them to show only a flag as symbol if info exists


### 065.alpha (230304 06:00)

* 230304piu_a UI interface (`ads_decision_criteria.html`) prepared section ref to `"PEOPLE TO DECISION_CRITERIA:..."` for future selector background color depending on option chosen (using `color` from corresponding OV value)
* 230303piu_g UI interface (`ads_decision_criteria.html`) made part of sparse matrix set with actual data and for missing set combo as `?`
* (B) 230303piu_f UI interface (`ads_decision_criteria.html`) is missing the 3rd person from test data, check looping data
* 230303piu_e UI interface (`ads_decision_criteria.html`) made part of sparse matrix fill with all data from LOV
* (B) 230303piu_d *symptom:* ADS Revenue data model fields are mandatory but have no default value, so app raise error if any of them is not completed
*solution:* fixed API route (`/api/ads_revenue_post/<sales_project_pk>`, function `ads_revenue_post(sales_project_pk)`) and UI interface cleaned of useless elements
* 230303piu_c clean code, drop cleared FIXMEs
* 230303piu_b UI interface, made DECISION CRITERIA LIST OBJECT (`ads_decision_criteria_details_1criterialist`)
* 230303piu_a cleaning UI interface (useless or debugging info elements)
* 230302piu_e update `README_data_models.py` ref ADS Decision Criteria API route for post at first level (`ads_decision_criteria` object)
* 230302piu_d UI interface, saving data ref MASTER OBJECT update `ads_start_page.html` corresponding save section `save_ads_all_data(sales_project_pk)`,  new section for ADS Decision Criteria (respecting the pattern of function) and function `get_new_ads_decision_criteria()`
* (B) 230302piu_c *symptom:* ADS Revenue data model fields are mandatory but have no default value, so app raise error if any of them is not completed
*solution:* updated input fields in UI interface, put and `*` in field name and made them `required="true"`


### 064.alpha (230302 18:00)

* 230302piu_b `ads_main.py` get ADS Relationship Details ALL data as needed to use NEW elements in `ads_decision_criteria_details_2maptoperson` (Jinja variable set `relationships_details_data`)
* 230302piu_a update API component (`ads_decision_criteria_api_models.py`)
* 230301piu_f `ads_start_page` UI interface, loading data (without save) ref MASTER OBJECT (`ads_decision_criteria`)
* 230301piu_e update `ads/ads_main.py` to load all necessary data (Jinja variables), ie *LOV* and *persons / involved people* from DAS Relationships Approach business domain:
    * [x] 1. make a sketch draft of `ads_decision_criteria.html`
    * [x] 2. update `ads_main.py`
* 230301piu_d small refactoring in `ads_main.py` to deny "pure local" some variable name obfuscate (prefix them with `_` ): `ads_evaluation`, `ads_relationships`, `ads_solution`
* 230301piu_c `salesproject_data_models` updated with relationship to `ads_decision_criteria`
* 230301piu_b `ads_decision_criteria` made API route for GET (@ MASTER OBJECT level) and commented for POT and next levels routes (DECISION CRITERIA OBJECT, PEOPLE MAP TO CRITERIA OBJECT); publish to system init chain (`sys_core/init_system.py`)
* 230301piu_a change PEOPLE MAP TO CRITERIA OBJECT - (`ads_decision_criteria_details_2maptoperson`) relationship to ADS Relationships Details for update & delete operations to CASCADE rule


### 063.alpha (230228 19:30)

* (B) 230228piu_c fix `ads_solution_data_models`, replace all "org_map" occurrences to "ads_solution" (exists in temporary data / variables)
* 230228piu_b ORM data model ref first pass TOP-DOWN  (physical attributes):
    * [x] 0. skeleton with all entities as blank (only technical attributes); loaded in system init chain (`sys_core/init_syste.py`) update physical data & db scripts
    * [x] 1. MASTER OBJECT                 - (`ads_decision_criteria`); update physical data & db scripts
    * [x] 2. DECISION CRITERIA OBJECT      - (`ads_decision_criteria_details_1criterialist`); update physical data & db scripts
    * [x] 3. PEOPLE MAP TO CRITERIA OBJECT - (`ads_decision_criteria_details_2maptoperson`) relation to *DECISION CRITERIA OBJECT*; update physical data & db scripts
    * [x] 4. PEOPLE MAP TO CRITERIA OBJECT - (`ads_decision_criteria_details_2maptoperson`) relation to *ADS Relationships Details*; update physical data & db scripts
    * [x] 5. PEOPLE MAP TO CRITERIA OBJECT - (`ads_decision_criteria_details_2maptoperson`) business attributes and `as_dict()` method


### 062.alpha (230228 04:30)

* 230228piu_a LOV data model (**`lov_ads_decision_criteria`**) ref:
    * [x] DECISION CRITERIA OBJECT      - (`our_status`) in (`ads_decision_criteria_details_1criterialist`)
    * [x] PEOPLE MAP TO CRITERIA OBJECT - (`client_importance`) in (`ads_decision_criteria_details_2maptoperson`)
    * [x] updated [System Data](/810_DSGN/810.03_System_Data.md) fer LOV object
    * [x] (B) fixed bugs ref `get_selector_info(selector, code)` in: `ads_solution_lov_models.py`, `ads_relationships_lov_models.py`
* 230227piu_a review, updated & closed iss # 230226piu_a
* 230226piu_a update [System Data](/810_DSGN/810.03_System_Data.md) ref *ADS Decision criteria* business domain
    * [x] 1. conceptual model, the three objects: *MASTER OBJECT*, *DECISION CRITERIA OBJECT*, *PEOPLE MAP TO CRITERIA OBJECT*
    * [x] 2. refactored object names to make easier identification (included level number after text "details_")
    * [3] 3. details ref MASTER OBJECT                 - (`ads_decision_criteria`)
    * [x] 4. details ref DECISION CRITERIA OBJECT      - (`ads_decision_criteria_details_1criterialist`)
    * [x] 5. details ref PEOPLE MAP TO CRITERIA OBJECT - (`ads_decision_criteria_details_2maptoperson`)
* (B) 230225piu_k fixed message displayed when no ADS Solution exists (prev version display about Relationships)
* 230225piu_j `salesproject_data_models` updated with relationship to `ads_solution`; archived version 0.7.0




--- ooo ---
