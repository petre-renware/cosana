<small>*(c) 2022, 2023 RENware Software Systems*</small>

**cosana**    
***Comprehensive Sales Analysis & Review***

[PDF VERSION](/download{{ request.path }})


***

[TOC]

# CHANGELOG v0.7.0 `ads` ADS Relationships Approach business domain

<small>With (F) are marked those entries that are **FEATURES** so should be highlighted on *Release Note* documents.</small>    
<small>With (B) are marked those entries that are **BUG FIXES** so should be highlighted on *Release Note* documents.</small>

## 0.7.0 - `ads` ADS Relationships Approach business domain

### 059.beta (220222 07:00)

* 230222piu_c cleanup all *ADS Relationships* code and update `README_ads` tech specs
* 230222piu_b client-side DETAILS JavaScript section - New, Del, Sav functionality
* 230222piu_a client-side DETAILS HTML section - New functionality
* 230221piu_g client-side DETAILS script section - detect changes in selectors and activate Sav button


### 058.alpha (230221 17:30)

* 230221piu_f client-side `ads_start_page.html` update to accommodate new business domain (part 2 MASTER Save, functions `get_new_ads_relationships()`, `save_ads_all_data(sales_project_pk)`, API POST route `/api/ads_relationships_post/<sales_project_pk>` view function `ads_relationships_post(sales_project_pk)`)
* 230221piu_e client-side `ads_start_page.html` update to accommodate new business domain (part 1 without MASTER Save, not done marked with text `ASAP tbd in 0.7.0`)
* 230221piu_d updated `ads_relationships.html` - SELECTOR: `position` - selector data is bring through Jinja data (`ads_main.py`) and comes from `ads_org_map_details` object (from its API); reviewed & updated `ads_org_map,html` ref improvements and cleanups in `ads_relationships.html`
* 230221piu_c updated `ads_org_map.html` - get actual data and complete values set for SELECTORS: `change_adaptability`, `contact_status`, `our_status_in_relation` / selectors data comes from `lov_ads_relationships` Jinja variable
* 230221piu_b client-side design `ads_relationships.html`
    * [x] 1. update `ads_main.py` to send `lov_ads_relationships` full structure at rendering and load from server-side; preserve this data as javascript global variable in `ads_relationships.html` page script section
    * [x] 2. reviewed & updated `ads_org_map.html` - dropped details table fields commented as "to check" if needed (test usage did not reveald their neccesity)
    * [x] 3. update `ads_main.py` to get, render and send actual data as Jinja variables; in `ads_relationships.html` saved also as global javascript date in variable `_relationships_details_data`; fixed various bugs at `ads_relationships` ORM data level
    * [x] 4. first draft / raw design: layout and zones (by copying from `ads_org_map.html`); need to refine selectors
* 230221piu_a reviewed and updated `ads_evaluation` HTML pag and alligned to current "presentation style" (fonts, backgroud, organization, etc)
* 230220piu_e `ads_relationships` make some useful comments on client HTML code and on API code (marked `#FIXME ------------------- these should be updated to ads_relationships (230220piu_d)`)
* 230220piu_d `ads_org_map` change new `ads_org_map_details` entry form to *modal*


### 057.alpha (230220 11:30)

* 230220piu_c made API GET for `ads_relationships` ad API POST for `ads_relationships_details`
    * [x] 1. updated all tech documentation ([data_models README](data_models/README_data_models.md) & [system design 810.03_System_data](/810_DSGN/810.03_System_Data.md))
    * [x] 2. brute change `ads_org_map...` with `ads_relationships...`in new copied file; publish in system init chain (`sys_core\init_system.py`); tested (what can be tested) = PASS - left markers in file for future ref
* 230220piu_b finalize properties: `change_adaptability_info`, `our_status_in_relation_info`, `contact_status_info`
* 230220piu_a prep LOV with helper definition for getting text, score, color as dictionary (`get_selector_info(selector, code`)
* (B) 230219piu_c fixed `ads_org_map` at "Cancel-ing" new data entry form - if entered some data will save it even if Cancel button pressed
* 230219piu_b design ORM & LOV models for ADS Relationships Approach
    * [x] 1. first model with rdy `ads_relationships` and draft of `ads_relationships_details`; included in sys init chain (`sys_core/init_system.py`) generate a DB script
    * [x] 2. LOV model for `ads_relationships_details` object fields; updated requirements.txt with *colors* library
    * [x] 3. ORM skeleton and all helpers model for `ads_relationships_details` object fields
    * [x] 4. intermediary ORM model (without position / role), physical database, data script
    * [x] 5. ORM model (position / role with corresponding info from related object), physical database, data script
    * [x] 6. (re) sample test data


### 056.alpha (230219 05:30)

* 230219piu_a review tech doc [System Data](/810_DSGN/810.03_System_Data.md), prep for ORM design (data_models/ads_relationships_data_models,py)
* (B) 230218piu_b *ADS Revenue* fixed UI TAB fields ref section "Potential client point of view..." displaying an `...>` at end of fields
* 230218piu_b updated main README ref team members
* (B) 230218piU_a *ADS Organization Map* client-side @ `ads_org_map` refactored DETAILS Sav button id from `sav_button_of_` to `sav_button_org_map_`
* 230217piu_e update tech doc [System Data](/810_DSGN/810.03_System_Data.md) ref *ADS Relationships Approach*
    * [x] 1. prepared document corresponding section
    * [x] 2. update DETAIL section ref attributes and described the entries in LOV for ADS Relationships Approach: `ads_relationship_lov_models` (steps 3 and 4 from analysis sheet)
    * [x] 3. update DETAIL section ref attributes and described the entries in LOV for ADS Relationships Approach: `ads_relationship_lov_models` (steps 5 from analysis sheet)
* 230217piu_d refactored `ads_relationships_approach` to `ads_relationships` (a shorter name but still clear will help to code visibility)
* 230217piu_c prepared to start *ADS Relationships approach business domain* (code-name: `ads_relationships_approach`)
* 230217piu_b archived versions *0.5.0* & *0.5.1*
* (B) 230217piu_a fixed bug at SalesProject master data admin screen
    * Symptom: does report error on *New Project > Save* without any "reason"
    * Cause detected as: form does not `validate_on_submit`
    * Remedy: reactivated form `form.csrf_token` which deny form validation as not trusted domain in all cases


--- ooo ---
