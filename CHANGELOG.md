<small>*(c) 2022, 2023 RENware Software Systems*</small>

**cosana**    
***Comprehensive Sales Analysis & Review***

[PDF VERSION](/download{{ request.path }})

<small>

* Version: 0.12.0
* Last update: 230331
</small>

***

[TOC]

# CHANGELOG

<small>With (F) are marked those entries that are **FEATURES** so should be highlighted on *Release Note* documents.</small>    
<small>With (B) are marked those entries that are **BUG FIXES** so should be highlighted on *Release Note* documents.</small>


## 0.12.0 - ARE details and charts

### 075.wip

* wip... --- [ ASAP ACTION PLAN: ]-------------------------------------------------------------
* tbd... ARE generating charts route - get real data directly from history table `ads_general_data_version` (pls `see are_main.py` comment ref object name and check WHAT detail object is accessed or is enough main object as it could have all score history in `score` property by accessing corresponding historical records from details)
* tbd... all bss domains data models make property for *historical score*


* tbd... `ads data models` for each detail tables use attribute `_useless_to_keep_history` to force history generate rec at parent level (in case of decision criteria domain data model there 2 levels and each of them force history in parent ***ONLY on decision criteria line***)

* 230331piu_a `base_keys_data_models.py` add field `_useless_to_keep_history: bool, optional no default` just usable to set and keep history at ADS level tables - usage: at each detail change, set it as `set _useless_to_keep_history = not _useless_to_keep_history` to force versioning component to save history










## 0.11.0 - Data history features & ARE summary zone

### 074.beta (230330 06:00)

* 230330piu_b ARE UI interface close summary zone for all business domains. Made following:
    * [x] ---(already done in `073.alpha 230327piu_d`)--- General data
    * [x] ---(already done in `230329piu_a`)--- Evaluation
    * [x] ---(already done in `230330piu_a`)---  Organization map
    * [x] ---(already done in `230329piu_a`)--- Revenue
    * [x] ---(already done in `230329piu_a`)--- Relationship approach
    * [x] Solution
    * [x] Decision criteria
* 230330piu_a ARE UI interface close summary zone for all business domains. Made following:
    * [x] ---(already done in `073.alpha 230327piu_d`)--- General data
    * [x] ---(already done in `230329piu_a`)--- Evaluation
    * [x] Organization map
    * [x] ---(already done in `230329piu_a`)--- Revenue
    * [x] Relationship approach
    * [ ] Solution
    * [ ] Decision criteria
* 230329piu_b refactored `ads_revenue_get(...)` from `ads_revenue_api_models` api function to `ads_revenue_api_get(...)` keeping signature (reason: consistency naming convention)
* 230329piu_a ARE UI interface close summary zone for all business domains. Made following:
    * [x] ---(already done in `073.alpha 230327piu_d`)--- General data
    * [x] Evaluation
    * [ ] Organization map
    * [x] Revenue
    * [ ] Relationship approach
    * [ ] Solution
    * [ ] Decision criteria
* 230328piu_b ARE route for generating charts `are_chart(...)`
    - list of allowed domains ans chart types, parameters validation
    - return a sample chart just for test - test PASSED
* 230328piu_a ARE initialized charts area:
    - created HTML zone and tags for accommodate the 3 charts, "titled" them accordingly: *Last 10 days chart*, *Last 30 days chart*, *All project activity chart*
    - route for generating charts `are_main.py` initialized, commented specs
    - updated ARE README specs with written helper functions and charts generating function (URL: `/are_chart/...business_domain.../...chart_type...`, view function: `are_chart(...)`)


### 073.alpha (230327 19:40)

* 230327piu_d ARE convert last update date to local time by using a small button next to corresponding displayed info
* 230327piu_c ARE `general_data` bss domain - *summary zone* preserved `_updated_at` field and send formatted date in `fmt_updated_at`, both as UTC time zone
* 230327piu_b ARE `general_data` bss domain - *summary zone* convert last updated date to a more readable humanized format
* 230327piu_a ARE `general_data` bss domain - get *summary zone* data: last updated date and score info
* 230326piu_c updated skeleton for `are_general_data.html` page with *charts data* placeholders; made actions plan as comments in `are_main.py`
* 230326piu_b made skeleton for `are_general_data.html` page with *summary data* and *charts data* - need to be populated
* 230326piu_a cleaned ADS start page for fixed "FIXME sections"


### 072.alpha (230326 05:30)

* 230325piu_d *skeleton* for route to return file with `send_from_directory(..., file=...)`:
    * location `are\are_main.py`
    * view function code-name: `are_chart`
    * route name: `/are_chart/<busines_domain>/<chart_type>` where chart type is one of those specified in [ads README specs](ads/README_ads.md)
    * update [ads README specs](ads/README_ads.md)
* 230325piu_c create empty templates for all `are_bss...dom.html`
* 230325piu_b `are_start_page` organize and base layout of ARE start page
* 230325piu_a archived 0.10.0 pre-release version
* 230324piu_c defined specs for ARE start page


### 071.alpha (230324 0730)

* 230324piu_b init component **ARE - Account Review and Evaluation**, published on *top menu bar* and in *Sales Projects administration page* (ARE button)
* 230324piu_a review and update [ROADMAP](/OPEN_ISSUES_ROADMAP.md)
* 230323piu_b Data history feature:
    * [x] 1. prepare project environment with required packages (SQLAlchemy Continuum) ==> `requirements.txt` and `810_DSGN/820.90_Toolstack_notes.md` updated
    * [x] 2. activate in system init chain (`sys_core/init_system.py`) history objects creation
    * [x] 3. use history in following objects: ads_general_data_data_models, ads_decision_criteria_data_models, ads_evaluation_data_models, ads_org_map_data_models, ads_relationships_data_models, ads_revenue_data_models, ads_solution_data_models; update & generate a fresh database
    * [x] 4. close OPISS.004, test and release feature
* (B) 230323piu_a fixed `ads_revenue.html` business domain UI to display `Updated by... at...` field (corrected `_updated_by` & `_updated_at` fields id)
* 230322piu_a `crud_data_admin_main` component: review and updated roadmap RMAP.001, RMAP.002, cleaned obsolete objectives code and comments
* 230321piu_b archived version 0.9.0
* 230321piu_a publish 01.10.0-070.re-release on test-development server
















# Older versions

## 0.10 releases

* [0.10.0 pre-release `ads` ADS scoring](/versions_history/CHANGELOG_0.10.0.md)

## 0.2 to 0.9 releases (only beta)

* [0.9.0 `ads` ADS Decision criteria business domain](/versions_history/CHANGELOG_0.9.0.md)
* [0.8.0 `ads` ADS Solution business domain](/versions_history/CHANGELOG_0.8.0.md)
* [0.7.0 `ads` ADS Relationships Approach business domain](/versions_history/CHANGELOG_0.7.0.md)
* [0.6.0 `ads` Revenue business domain](/versions_history/CHANGELOG_0.6.0.md)
* [0.5.1 `ads` Organization map business domain (bug fixes)](/versions_history/CHANGELOG_0.5.1.md)
* [0.5.0 `ads` Organization map business domain](/versions_history/CHANGELOG_0.5.0.md)
* [0.4.0 `ads` Evaluation business domain](/versions_history/CHANGELOG_0.4.0.md)
* [0.3.0 `ads` Evaluation business domain - DB level](/versions_history/CHANGELOG_0.3.0.md)
* [0.2.0 `ads` General data business domain](/versions_history/CHANGELOG_0.2.0.md)

## 0.0 to 0.1 releases (only beta)

* [0.1.1](/versions_history/CHANGELOG_0.1.1.md), [0.1.0](/versions_history/CHANGELOG_0.1.0.md), [0.0.5](/versions_history/CHANGELOG_0.0.5.md), [0.0.4](/versions_history/CHANGELOG_0.0.4.md), [0.0.3](/versions_history/CHANGELOG_0.0.3.md), [0.0.2](/versions_history/CHANGELOG_0.0.2.md), [0.0.1](/versions_history/CHANGELOG_0.0.1.md), [0.0.0](/versions_history/CHANGELOG_0.0.0.md)


## Notes

<small>

* Older versions are available in `/versions_history`
* versions suffixed by `(PRS)` in list are **pre-release** versions
* 
</small>





--- ooo ---
