<small>*(c) 2022, 2023 RENware Software Systems*</small>

**cosana**    
***Comprehensive Sales Analysis & Review***

[PDF VERSION](/download{{ request.path }})

***

[TOC]

# CHANGELOG v0.2.0

<small>With (F) are marked those entries that are **FEATURES** so should be highlighted on *Release Note* documents.</small>    
<small>With (B) are marked those entries that are **BUG FIXES** so should be highlighted on *Release Note* documents.</small>

## 0.2.0 `ads` General data business domain

### 035.beta (230121 06:30)

* 230121piu_b close build and beta 0.2.0 version; archive version 0.1.1
* 230121piu_a `ads_general_data` review, update user notification messages @ finish, cleanup code
* 230120piu_c `ads_general_data` save data
* 230120piu_b `ads_general_data` make ajax POST request to save data (to route: `/api/ads_general_data/<sales_project_pk>`); *FIXED, so need to clean involved files*
* 230120piu_a `ads_general_data_api_models` POST API review & update for final messages and status codes: *OK* job = **`(success, 200)`**, *NOK* job = **`(fail - ...details..., 500 / 404)`**
* 230119piu_j `ads_general_data_api_models` make POST API - differentiate *INSERT* / *UPDATE* by `_pk` attribute - see code ref how did it
* 230119piu_i archived 0.1.0 version
* 230119piu_h solution **SCORING** new roadmap issue and make a description of **ADS scoring** (code `RMAP.003 - ADS scoring`)
* 230119piu_g `ads_general_data` send `sales_project_pk` as parameter to `save_all_ads_data` function as it is mandatory on *`ads_general_data` API POST route*
* 230119piu_h `ads_general_data` cleanup code up here (ref saving process)
* 230119piu_g `ads_general_data` collect data from corresponding tab for latter saving; prepare all save related functions; update documentation
* 230119piu_f `ads_general_data` update short term ACTION PLAN up to close *General data* business domain


### 034.alpha (230119 06:15)

* 230119piu_e `ads_general_data` updated end-use manual (`euma/880.30_EUMA_SalesProjectsAdministration.md`) with notes ref changes done and what to write
* 230119piu_d `ads_general_data` compare data to original one to determine if *changes was made* and *make* tab of `class="text-danger"` if so
* 230119piu_c `ads_general_data` on revert() should make for all tags *a*, attribute *data-toggle="tab"* to have added in class *text-primary*
* 230119piu_b `ads_general_data` detect what business domain (TAB) was changed and marked its key as `ads_general_data_dirty` of `ads_all_data` object
* 230118piu_f `ads_general_data` include `_pk` in data read from server because need to send back to server to determine if necessary action is INSERT or UPDATE
* 230118piu_e `ads` let comments in file `ads/___README_COSANA_ADS_notes.md` ref how **copy** and **compare** 2 onjects in JS)
* 230118piu_d **@BUGFIX** `adma` recopied at its place (deleted from mistake...)
* 230118piu_c `ads_general_data` mark as *dirty* any change in TAB input data (bind tho change event for jQuery selector `$('input, textarea, .form-control')`)
* 230118piu_b `ads_general_data` audit data to LOAD and DISPLAY un corresponding tab
* 230118piu_a `ads_template.html` local variable `ads_all_data` should be divided at level 1 with business domains (how `ads_all_data: ads_general_data: ...`)
* 230117piu_k `ads` updated *EUMA* manual [`880.30_EUMA_ADS_Review.md` access here](/euma/880.30_EUMA_ADS_Review.md)
* 230117piu_j `ads_general_data` inform for general data disabled (ignore disabling as "abnormal" and is possible only with intervention at database level)
* 230117piu_i solution attribute `code` of `BaseInfoMixin` ORM data models template; in `SalesProject` appended individually
* 230117piu_h `ads_general_data` updated documentation ref all list and "1 line description" of helper functions
* 230117piu_g `ads_general_data` on a disabled or inexistent sales project STOP any process and do not try to load General Data or anything else as do now !!!
* 230117piu_f `ads_general_data` load from DB using api (`/api/ads_general_data/<sales_project_pk>`)
* 230117piu_e `ads_general_data` make api to get data for a specified SalesProject PK
* 23017piu_d `ads` created on object to keep all ads data as global `ads` variable (`ads_all_data`)

### 033.alpha (230117 06:00)

* 230117piu_c `ads` coded *Revert* button *onclick* function (`revert_page()`)
* 230117piu_b `ads` created function `mark_page_dirty(dirty: boolean)` that marks page as *dirty* or *clean* and enable or disable its *Save* button
* 230117piu_a `ads` create an `init_page()` function that initialize all page and its local variables
* 230116piu_m `ads_general_data` updated form - small visual improvements and corrections
* 230116piu_l solution update `db_scripts` with new database model
* 230116piu_k `ads_general_data` updated database introduced client company
* 230116piu_j `ads_general_data` design form and corresponding tab

### 032.alpha (230116 16:00)

* 230116piu_i solution update - review and update user manuals (adma & euma)
* 230116piu_h `ads` create `ads_general_data`, `ads_evaluation`, `ads_revenue`, `ads_solution`, `ads_organization_map`, `ads_decision_criteria`, `ads_relationships_approach` content as external HTML file, read it and include them in `ads_template.html`
* 230116piu_g solution update - markdown library installed extension for `admonitions`
* 230116piu_f @FIXED `ads` when no sales project was sent the `ads_template.html` page remains on message `... project loading ...`
* 230116piu_e created roadmap open issue OPISS.004 - history table
* 230116piu_d `ads` data model for *General data* created relationship at Sales Project object level
* 230116piu_c updated ADMA for Sales Projects resulted doc: `880.30_ADMA_SalesProjectsAdministration.md`
* 230116piu_b `ads` data model for *General data* created FK constraints
* 230116piu_a `ads` design data model for *General data* business domain (including DB and db scripts update):
    * object name: `ads_general_data`
    * relationships: **1** `SalesProject` to **0,1** `ads_general_data`
    * this object *PK* will be also *FK* to `SalesProject`
    * this object will define a `back_ref` that will create a "link" in SalesProject: `sales_project_fk = relationship("SalesProject", backref=backref("ads_general_data", uselist=False))`

--- ooo ---
