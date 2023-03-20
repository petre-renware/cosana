<small>*(c) 2022, 2023 RENware Software Systems*</small>

**cosana**    
***Comprehensive Sales Analysis & Review***

[PDF VERSION](/download{{ request.path }})

[TOC]

# CHANGELOG v0.8.0 - `ads` ADS Solution business domain

<small>With (F) are marked those entries that are **FEATURES** so should be highlighted on *Release Note* documents.</small>    
<small>With (B) are marked those entries that are **BUG FIXES** so should be highlighted on *Release Note* documents.</small>

## 0.8.0 - `ads` ADS Solution business domain

### 061.beta (230225 17:00)

* 230225piu_i all `ads_solution` cleanup code, drop old FIXME, update `OPEN_ISSUES_ROADMAP.md`, release 0.8.0-061.beta
* 230225piu_h `ads_solution` DETAILS section - review and update `ads_solution.html` (new functionality): form for new data
* 230225piu_g `das_relationships.html` fix mistyping errors
* 230225piu_f `ads_solution` cleanup code up here
* 230225piu_e `ads_solution` DETAILS section - review and update `ads_solution.html` (save, delete functionality)
* 230225piu_d `ads_solution` MASTER section - review and update `ads_start_page.html` (save functionality)
* (B) 230225piu_c fixed `ads_relationships.html` script section jquery selector for `ads-relationships-detail-new-rec-button` mistyped
* 230225piu_b load data of `ads_solution` MASTER section - review and update `ads_start_page.html` (without save functionality)
* 230225piu_a create first level of `ads_solution.html` (MASTER / MAIN AREA) & second level of `ads_solution.html` (DETAILS / TABLE area)
* 230224piu_e update `ads_main.py` and created `ads_solution_api_models.py` in order to load and render `ads_solution`
* 230224piu_d update `ads_main.py` load Jinja variables and render `ads_solution` LOV data


### 060.alpha (230224 14:50)

* 230224piu_c cleanup **SalesProject** ORM and API models (`/data_models/salesproject_data_models` & `/data_models/salesproject_api_models`)
* (B) 230224piu_b fixed name of key at **SalesProject** API (ref issue #230224piu_a) to eliminate character `_` from `ads_*` attributes; fixed `ads_org_map_data_models` to return `score` in its record dictionary
* 230224piu_a updated **SalesProject** API to generate all ADS related data
* 230223piu_e_fixes fix bugs / losses / wrong code-names in 230223piu_e
* 230223piu_e made ORM data model DETAILS area object `ads-solution_details`; generated physical model and a DB script
* 230223piu_d made ORM model MASTER area object `ads_solution`; inserted in system init chain (`/sys_core/init_system.py`); generated physical model and a DB script; small mistyping other fixes in `ads_relationships_data_models.py`
* 230223piu_b made LOV for information domain "predefined" elements; reviewed & updated [System Data](/810_DSGN/810.03_System_Data.md)
* 230223piu_a describe business domain *ADS Solution* information content in [System Data](/810_DSGN/810.03_System_Data.md)
* 230222piu_d archived 0.6.0 version; cleaned solution and updated [System Data](/810_DSGN/810.03_System_Data.md) ref conceptual model schema


--- ooo ---
