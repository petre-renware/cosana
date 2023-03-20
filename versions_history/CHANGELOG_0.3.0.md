<small>*(c) 2022, 2023 RENware Software Systems*</small>

**cosana**    
***Comprehensive Sales Analysis & Review***

[PDF VERSION](/download{{ request.path }})

***

[TOC]

# CHANGELOG v0.3.0 `ads` Evaluation business domain - DB level

<small>With (F) are marked those entries that are **FEATURES** so should be highlighted on *Release Note* documents.</small>    
<small>With (B) are marked those entries that are **BUG FIXES** so should be highlighted on *Release Note* documents.</small>

## 0.3.0 `ads` Evaluation business domain - DB level

### 042.beta (230127 06:00)

* (F) 230127piu_b `ads_evaluation` review documentation (all undocumented functions from data model and lov model)
* 230127piu_a `ads_evaluation_data_models` rename attribute `record_score` to `score` in order to assure a standard between all ADS Evaluation detail objects
* (F) 230126piu_i `ads_evaluation_data_models` finalize and close data model (to start UI coding ... will come updates there from)
    * 1. `record_day` property for help in assuring daily uniqueness of the record (will be assured through client-side - DB will implement the property)
    * 2. update `as_dict()` method to contain all fields and properties necessary in UI
    * 3. review data model code of object ADS Evaluation; fix and update
* 230126piu_h `ads_evaluation_lov_models.py` helper function that return total points of a level (total structure, group or selector): `get_level_total_score(item_group=None, evaluation_selector=None)`
* 230126piu_g preparations for v0.3.0 review and release

### 041.alpha (230126 12:00) - (F) group `win_worth`

* 230126piu_f `ads_evaluation` group `win_worth` selector `strategical_value` + updated *db_scripts*
* 230126piu_e `ads_evaluation` group `win_worth` selector `profitability` + updated *db_scripts*
* 230126piu_d `ads_evaluation` group `win_worth` selector `risk` + updated *db_scripts*
* 230126piu_c `ads_evaluation` group `win_worth` selector `long_term_revenue` + updated *db_scripts*
* 230126piu_b `ads_evaluation` group `win_worth` selector `short_term_revenue` + updated *db_scripts*
* 230126piu_a start level 1 of `ads_evaluation` group `win_worth`
    * 1. prepare database data model: `ads_evaluation_data_models.py`; format code with *Black* formatter
    * 2. open new level for `ads_evaluation`, prepare placeholders for its selectors
    * 3. make one selector as template and update group name in it as `win_capability`

### 040.alpha (230125 20:20) - (F) group `win_capability`

* 230125piu_i finalize `ads_evaluation` group `win_capability`
* 230125piu_h archived old DB scripts
* 230125piu_g `ads_evaluation` group `win_capability` selector `political_aspects` + updated *db_scripts*
* 230125piu_f `ads_evaluation` group `win_capability` selector `approach_decision_making_criteria` + updated *db_scripts*
* 230125piu_e `ads_evaluation` group `win_capability` selector `cultural_compatibility` + updated *db_scripts*
* 230125piu_d `ads_evaluation` group `win_capability` selector `credibility` + updated *db_scripts*
* 230125piu_c `ads_evaluation` group `win_capability` selector `internal_support` + updated *db_scripts*
* 230125piu_b start level 1 of `ads_evaluation` group `win_capability`
    * 1. prepare database data model: `ads_evaluation_data_models.py`
    * 2. open new level for `compete_capability`, prepare placeholders for its selectors
    * 3. make one selector as template and update group name in it as `win_capability`

### 039.alpha (230125 04:00) - (F) group `compete_capability`

* 230125piu_a finalize `ads_evaluation` group `compete_capability`
* 230124piu_h `ads_evaluation` group `compete_capability` selector `value_of_business_proposal` + updated *db_scripts*
* 230124piu_g `ads_evaluation` group `compete_capability` selector `current_relation_with_customer` + updated *db_scripts*
* 230124piu_f `ads_evaluation` group `compete_capability` selector `resources_required_to_sell` + updated *db_scripts*
* 230124piu_e `ads_evaluation` group `compete_capability` selector `solution_matching` + updated *db_scripts*
* 230124piu_d `ads_evaluation` group `compete_capability` selector `formal_decision_making_criteria` + updated *db_scripts*
* 230124piu_c start level 1 of `ads_evaluation` group `compete_capability`
    * 1. prepare database data model: `ads_evaluation_data_models.py`
    * 2. open new level for `compete_capability`, prepare placeholders for its selectors

### 038.alpha (230124 15:45) - (F) group `opportunity_realism`

* 230124piu_b finish level 1 of `ads_evaluation` group `opportunity_realism`
    * 1. `ads_evaluation` make field properties for *TOTAL score* and *label*
    * 2. `ads_evaluation_lov_models.py` introduced "label" key for level 1 - group (usable for UI)
    * 3. `ads_evaluation` cleanup code
* 220124piu_a `ads_evaluation` add evaluation selector `decisive_event` to data model (ref `ads_evaluation_lov_models.py`); updated `db_scripts`
* 220123piu_h `ads_evaluation` add evaluation selector `access_to_funds` to data model (ref `ads_evaluation_lov_models.py`); updated `db_scripts`
* 220123piu_g `ads_evaluation` add evaluation selector `_customer_financials` to data model (ref `ads_evaluation_lov_models.py`); updated `db_scripts`
* 220123piu_f `ads_evaluation` add evaluation selector `_customer_business` to data model (ref `ads_evaluation_lov_models.py`); updated `db_scripts`
* (F) 230123piu_e `data_models` update README documentation ref `ads_evaluation_lov_models` (helper functions)
* 210123piu_d `ads_evaluation_lov_models.py` set *code* (selector[0]) like analysis code documentation +  seq number for ordering (A.n.x, B.n.x, C.n.x, D.n.x)

### 037.alpha (230123 17:30)

* 210123piu_c cleanup code, migrate DB schema  & update `db_script`
* 220123piu_b `ads_evaluation` add evaluation selector `final_applicability` to data model (`ads_evaluation_lov_models.py`)
    * 1. pilot model for current evaluation selector
    * 2. test pilot model (DB copy, DB generate, inspect columns), cleanup code & generalize up to here, update `db_script`
    * 3. generalized current selector evaluation selector after pilot for
    * 4. made `get_lov_list_of_tuples(item_group, evaluation_selector)` (`ads_evaluation_lov_models.py`) that returns all possible tuples (usable mainly in UI)
* 220123piu_a `ads_evaluation_lov_models.py` created helper function `get_lov_list_of_codes(item_group, evaluation_item)`
* 230122piu_c `ads_evaluation` generate draft physical data_model and updated `db_scripts` ref new DB schema

### 036.alpha (230121 19:00)

* 230122piu_b `ads_evaluation` create data_model, documentation, LOVs:
    * 1. *auxiliary attributes*: documentation, data model
    * 2. `opportunity_realism`: documentation, data model
    * 3. `compete_capability`: documentation, data model
    * 4. `opportunity_realism`: LOV (ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`)
    * 5. `compete_capability`: LOV (ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`)
    * 6. `win_capability`: documentation, data model
    * 7. `win_worth`: documentation, data model
    * 8. `win_capability` LOV (ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`)
    * 9. `win_worth` LOV (ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`)
* 230122piu_a `ads` introduced in data models the property / attribute `score` for *scoring* implementation (see RMAP.003 - ADS scoring)
* (F) 230121piu_e `ads`updated technical specs (README_ads.md file)
* (F) 230121piu_d `ads` put a score badge on ADS business domains title (see RMAP.003 - ADS scoring)
* 230121piu_c `ads_evaluation` update `810.03_system_Data` - data specifications:
    * object code-name: **`ads_evaluation`**
    * each evaluation criteria is an **ATTRIBUTE**
    * relationship **1 SalesProject : 1 ads_evaluation**


--- ooo ---
