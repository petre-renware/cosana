<small>*(c) 2022, 2023 RENware Software Systems*</small>

**cosana**    
***Comprehensive Sales Analysis & Review***

[PDF VERSION](/download{{ request.path }})

***

[TOC]

# CHANGELOG v0.4.0 `ads` Evaluation business domain

<small>With (F) are marked those entries that are **FEATURES** so should be highlighted on *Release Note* documents.</small>    
<small>With (B) are marked those entries that are **BUG FIXES** so should be highlighted on *Release Note* documents.</small>

## 0.4.0 `ads` Evaluation business domain

### 047.beta (230206 16:10)

* 230206piu_f review & update `ads` documentation especially ref *230206piu_c*
* 230206piu_e `ads_start_page.html`, generalize getting data functions by using `ads_all_data.ads_general_data_ids_map` & `ads_all_data.ads_evaluation_ids_map`
* 230206piu_d `ads_start_page.html`, generalize getting data functions by using `ads_all_data.ads_general_data_ids_map`
* 230206piu_c `ads_general_data` UI **id-s** as id(s) `ads_evaluation` (respecting pattern `ads_...bss-domain..._...field-name...`)

### 046.alpha (230206 09:15)

* 230206piu_b review and clean `ads_evaluation` & `ads_general_data`
* 230206piu_a updated code and documentation for `ads_evaluation_api_models`, `ads_general_data_api_models` POST API
* 220205piu_c `ads_general_data` changed POST API to use JSON parameters and accordingly the ajax call from client side
* 230205piu_b `ads_start_page` updated function `save_ads_all_data(sales_project_pk)` to call ADS Evaluation POST API (`data_models.ads_evaluation_api_models`)
* 230205piu_a `ads_evaluation_api_models` POST route, changed all data assignments changed wit `str(...data received...)` - NO CHANGES, still err on binding param 5 (`sales_project_fk`) which appear to be correct from message details
* 230204piu_d1 created a new fresh DB and generated `db_script` for it: 1full_db_sys_0.4.0-046.sql`
* 230204piu_d `ads_evaluation_api_models` code POST API save route (`ads_evaluation_api_post(sales_project_pk)`)
* 230204piu_c `ads_start_page` generalize code for function `get_new_ads_evaluation()` using structure `ads_all_data.ads_...bss-domain..._ids_map`
* 230204piu_b `ads_start_page` generalize code for function `get_new_ads_general_data()` using structure `ads_all_data.ads_...bss-domain..._ids_map`
* 230204piu_a `ads_start_page` structure `ads_all_data` introduced a new key  for a business domain (`ads_...bss-domain..._ids_map`) which makes 1:1 correspondence between DB data and UI data based on the same hey as `ads_...bss-domain...` structure
* 230203piu_e `ads_start_page`, closed OK function `get_new_ads_evaluation()` with dirty checking disabled (commented) until solve change detection in ADS Evaluation TAB
* 230203piu_d `ads_evaluation.html` changed id(s) for: group. selector label and label controlled objects
* 230203piu_c `ads_start_page`, function `empty_ads_all_data()`,  changed creation of `_ads_all_data = new Object();` as clearly new object instead of previous `{}` - NO NOTABLE BEHAVIOR CHANGE
* 230203piu_b `ads_start_page` refactored all TAB adding postfix `"tab` to id
* 230203piu_a `ads_start_page` reviewed saving code and renamed all `save_ads_...bss-domain()` functions to `get_new_ads_...bss-domain()`
* 230202piu_b review and update `ads` README documentation

### 045.alpha (230202 06:00)

* 230202piu_a prepared ACTION PLAN for ADS Evaluation *saving data phase*
* 230201piu_h `ads_start_page` ADS Evaluation review / updated function `get_ads_evaluation(sales_project_pk)`
* 230201piu_g `ads_start_page` ADS Evaluation review / updated function `get_ads_all_data(sales_project_pk)`
* 230201piu_f review `ads_evaluation` data model, remove any property like `*_label` - places: `data_model @property`, `data_model as_dict()`, `ads_start_page.html ads_all_data['ads_evaluation']`
* 230201piu_e review `ads_start_page.html`: cleanup, fix bugs, clean useless FIXMEs and TODOs

### 044.alpha (230201 05:30)

* 230201piu_d archived version 0.2.0
* 230201piu_c ADS General Data add `score` property to return 999999 up to solve roadmap issue `RMAP.003 - ADS scoring`
* 230201piu_b `ads_evaluation.html` add `remarks` field; updated layout for a better visibility of evaluation groups; add a test record for `ads_evaluation`
* 230201piu_a `ads_start_page` ADS Evaluation updated function `init_page()`
* 230131piu_e `ads_evaluation.html` add simple audit attributes and apply sizing styles as in `ads_general_data.html`
* 230131piu_d generalize `ads_all_data` function `empty_ads_all_data()` new inner function (`inner_add_new_keys()`): creates new keys (`..._ids` and `..._dirty`)
* 230131piu_c `ads_start_page.html` prepare general data structure (`ads_all_data` function `empty_ads_all_data()`) for `ads_evaluation` business domain
* 230131piu_b `ads` all - review component, cleanup, update documentation (specific README)
* 230131piu_a solution - review `config.py`, dropped any *CSRF* token from Flask-WTF managed fields as nee check and used together with a Flask-CORS to be useful
* 230130piu_c `ads_evaluation` made api to get data (route `/api/ads_evaluation_get/<sales_project_pk>`)
* 230130piu_b `ads_evaluation` (`ads_evaluation.html`) rendering - closed SELECTOR ITEMS level
* 230130piu_a revisited data model, object `BaseInfoMixin` and add `__versioned__` property for future usage of `SQLAlchemy Continuum` package

### 043.alpha (230130 05:50)

* 230129piu_c revisited ADS Evaluation data model and modified to a `SalesProject 1:1 ads_evaluation`, dropped `record_day` property, updated DB scripts
* 230129piu_b ADS Evaluation (`ads_evaluation.html`) label for SELECTORs level: used the key by replacing `_` with `space`
* 230129piu_a ADS Evaluation (`ads_evaluation.html`) rendering - closed SELECTORs level
* 230128piu_d ADS Evaluation (`ads_evaluation.html`) rendering - closed GROUP level
* 230128piu_c `ads_evaluation_lov_models.py` function that return a HTML Jinja rendered usable by client UI instead of file `ads_evaluation_form....`
    * [x] 0. make an ACTION PLAN
    * [x] 1. made a draft ADS Evaluation TAB with a skeleton / example of accordion widget to start Jinja templating
    * [x] 2. marked in ADS Evaluation code-locations where to place Jinja elements: GROUP, SELECTOR, selector ITEMS (code, text, score)
    * [x] 3. refined ADS Evaluation TAB
* 230128piu_b refactored `crud_data_admin/crud_table_template.html` to `crud_data_admin/crud_start_page.html`
* 230128piu_a refactored `ads/ads_template.html` to `ads/ads_start_page.html`


--- ooo ---
