<small>*(c) 2022 RENware Software Systems*</small>

[PDF VERSION](/download{{ request.path }})

<small>

* Version: 0.12.0
* Last update: 230410
</small>

***

[TOC]

# Open Issues (OPISS)



## OPISS.008 - ARE main page loader, no ADS data in a business domain

* *Severity level:* low (can continue work by choosing right project)
* *Target component:* `are/are_main.py`
* *Synopsis:* to do a complete checking to see there are ADS data, for each bss domain




## **CLOSED @230320** OPISS.007 - ADS scoring

* *Severity level:* high
* *Status:* IMPLEMENTED, delivered in **0.10.0-070**



## OPISS.006 - ADS Review activate Bootstrap standard *validation for required fields*

* *Severity level:* nice to have
* *Synopsis:* changing all ADS business domains to "a big form" to ce able to introduce Bootstrap standard *validation for required fields*
* *Target component:* `ads`



## **CLOSED @23032x08** OPISS.005 - `crud_data_admin` error when save a new sales project

* *Severity level:* up to first implementation is ASAP, after is **CRITICAL**
* *Synopsis:* when try to create a new record and DB (table `salesproject`) is completely empty, in `crud_data_admin/crud_data_admin_main.py`
* *Status:* FIXED, delivered in **0.9.0-066**



## **CLOSED @230323** OPISS.004 - history tables

* *Severity level:* nice to have
* *Status:* IMPLEMENTED, delivered in **0.11.0-071**


## **OBSOLETE @230322** OPISS.001 - `crud_data_admin` functionality of SalesProject generalization for other master data objects


## **CLOSED @230322** OPISS.000 - moved to OPISS.001




# Roadmap (RMAP)


## RMAP.009 - System health check functionality

* Objective: make a system DATA health check
* Implementation: -
* Location:
    * server-side: in `health_check` component as separated module-file
    * client-side: NOT YET DEFINED
* Status info: open [piu]@@230324


## RMAP.008 - System configuration functionality

* Objective: define & load system configuration
* Implementation: define system configurable elements @ UI level and reload them (@230315 the consists of LOV elements defined in data models)
* Location:
    * server-side: in `sys_core` component as separated module-file
    * client-side: NOT YET DEFINED
* Status info: open [piu]@230315


## RMAP.007 - ADS Decision Criteria "save all" feature

* Objective: "save all" functionality for all DETAIL level add / changed records
* Implementation:
    * function should be written in `ads_decision_criteria.html` in specific scripts section and called by `ads_start_page.html` function `get_new_ads_decision_criteria()`
    * optional, the API should be updated to implement a *bulk save* or use existing save in a for loop record-by-record
* Location: client-side `ads_start_page.html` & `ads_solution.html`, server-side `ads_decision_criteria_api_models.py`
* Status info: open [piu]@230302, updated [piu]@230302


## RMAP.006 - ADS Solution "save all" feature

* Objective: "save all" functionality for all DETAIL level add / changed records
* Implementation:
    * function should be written in `ads_solution.html` in specific scripts section and called by `ads_start_page.html` function `get_new_ads_solution()`
    * optional, the API should be updated to implement a *bulk save* or use existing save in a for loop record-by-record
* Location: client-side `ads_start_page.html` & `ads_solution.html`, server-side `ads_solution_api_models.py`
* Status info: open [piu]@230222, updated [piu]@@230222


## RMAP.005 - ADS Relationships Approach "save all" feature

* Objective: "save all" functionality for all DETAIL level add / changed records
* Implementation:
    * function should be written in `ads_relationships.html` in specific scripts section and called by `ads_start_page.html` function `get_new_ads_relationships()`
    * optional, the API should be updated to implement a *bulk save* or use existing save in a for loop record-by-record
* Location: client-side `ads_start_page.html` & `ads_relationships.html`, server-side `ads_relationships_api_models.py`
* Status info: open [piu]@230222, updated [piu]@@230222


## RMAP.004 - ADS Organization Map "save all" feature

* Objective: "save all" functionality for all DETAIL level add / changed records
* Implementation:
    * function should be written in `ads_org_map.html` in specific scripts section and called by `ads_start_page.html` function `get_new_ads_org_map()`
    * optional, the API should be updated to implement a *bulk save* or use existing save in a for loop record-by-record
* Location: client-side `ads_start_page.html` & `ads_org_map.html`, server-side `ads_org_map_api_models.py`
* Status info: open [piu]@230119, updated [piu]@230121



## **CLOSED @230320** RMAP.003 - ADS scoring

* Objective: construct and maintain a **scoring** for ADS. Scoring is documented in [`ads/README_ads.md`](ds/README_ads.md)
* Implementation:
    * *business domain score* will be implemented as `get_score()` methods for each `ads_...` business domain
    * *general scoring* at Sales Project level
    * [x] badges on each tab content
    * [ ] *badge displayed score:* **Poor** (`<= 30%`), **Acceptable** (`> 30% and <= 60%`), **Good** (`> 60% and <= 90%`), **Very good** (`> 90%`)
* Location: all ADS ORM data models
* Status info: open [piu]@230119, updated [piu]@230121


## RMAP.002 - Sales Projects administration, UI align to standard practices

* Objective: CRUD admin Data table interface improvements
* Location: `APP_ROOT/>crud_data_admin/crud_data_admin_main.py` function `get_data(only_keys=None)` add a general action button for all supplementary actions imitating standardized interface: DASHES button or 3 horizontal LINE or WHEEL button (in fact acts like a dropdown)
* Status info: open [piu]@230104


## **OBSOLETE @230322** RMAP.001 - CRUD Data Table server side filtering and search

* Objective: Data Table data endpoint - AJAX data provider - build functionalities for *server side data filtering* and *server side data search*
* Location: `APP_ROOT/>crud_data_admin/crud_data_admin_main.py` function `crud_data_feeder()` (view function of route `/crud_table_data_feeder/salesproject`)
* Status info: open [piu]@221222


## RMAP.000 - user / role level protection

* *Severity level:* up to version 1 does not matter, after is ASAP
* *Synopsis*: all routes must be revised and code protected for access at level of **role** (minimum)






# External references

* BOOK.003-101 - implementation details (useful at "kit" preparation phase)
* BOOK.003-116 - advanced functionality ref using AI in ADS evaluation

--- ooo ---
