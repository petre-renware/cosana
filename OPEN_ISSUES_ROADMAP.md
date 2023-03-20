<small>*(c) 2022 RENware Software Systems*</small>

[PDF VERSION](/download{{ request.path }})

<small>

* Version: 0.10.0
* Last update: 230320
</small>

***

[TOC]

# Open Issues (OPISS)


## **CLOSED** OPISS.007 - ADS scoring for Relationships approach

* *Severity level:* high
* *Synopsis:* calculation of ***current score*** seems to be wrong but I am not sure... please make a business scenario
* *Location:* `/data_models/ads_relationships_data_models.py`, function `xxx`, code marker to search for `FIXME here something seems to be wrong but I am not sure... please make a business scenario`
* *Indications:*
    * a business scenario for a consistent & more coherent test should be made
    * check if Organization Map (where is derived MAXIMUM score for in subject bss domain: Relationships Approach) is completed as core / progress as ***if Organization Map is not completed, THERE IS NO WAY TO COMPLETE Relationships Approach***



## OPISS.006 - ADS business domains introduce Bootstrap standard *validation for required fields*

* *Severity level:* nice to have
* *Synopsis:* changing all ADS business domains to "a big form" to ce able to introduce Bootstrap standard *validation for required fields*



## OPISS.005 - `crud_data_admin` error when save a new sales project

* *Severity level:* up to first implementation is ASAP, after is **CRITICAL**
* *Synopsis:* when try to create a new record and DB (table `salesproject`) is completely empty, in `crud_data_admin/crud_data_admin_main.py` ref code:

    ```
    #* common part regardless of new / edit operation: call view function of DEF-RT, send it form status to be shown as alert on rendered page
            _redirect_url = url_for('crud_admin_builder',
                                    visible = _op_status['visible'],
                                    pk = _op_status['pk'],
                                    code = _op_status['code'])
    ```

    raise error:

    ```
    File "/mnt/d/_T0_PROJECTS/0000-0128 COSANA Comprehensive Sales Analysis Review/830-DEV/crud_data_admin/crud_data_admin_main.py", line 157, in crud_data_form
        visible = _op_status['visible'],
    UnboundLocalError: local variable '_op_status' referenced before assignment
    ```



## OPISS.004 - history table

* *Severity level:* nice to have
* *Synopsis:* all `ads` objects should have a history; can be a simple descriptive or more complex that allow for revert but should be
* *Implementation steps:*
    * use package `xxx`
    * all tables / objects inherit an attribute `__versioned__ = {}` (already derived from `BaseInfoMixin()` base class, otherwise should be manually add)
    * initialize `SQLAlchemy Continuum` package at end af *data models* initialization by `sa.orm.configure_mappers()`


## **CLOSED** RMAP.000 - moved to RMAP.000


## OPISS.001 - `crud_data_admin` functionality of SalesProject generalization steps

* *Severity level:* not important, maybe nice to have
* crud admin init - make a "big" function as wrapper (imitate a class)

* `data_models`component should have an *init* file that publish in Commons under key <DATA_OBJECT_NAME> a dict with this sample:

```
{
    'class_name': 'SalesProject',
    'table_name': 'salesproject',
    'data_api_url': '/api/salesproject',
    'crud_url': '/crud_admin/salesproject',
    'ajax_feeder_url': '/crud_table_data_feeder/salesproject'
}
```

* `crud_data_admin` component *init* should take from Commons (key <DATA_OBJECT_NAME>) to build "UI administrators" callable from main menu / navbar






# Roadmap (RMAP)


## RMAP.008 - System configuration functionality

* Objective: define & load system configuration
* Implementation: define system configurable elements @ UI level and reload them (@230315 the consists of LOV elements defined in data models)
* Location:
    * server-side: in `sys_core` component as separated module-file
    * client-side: NOT YET DEFINED
* Status info: open [piu]@230315, updated [piu]@230315


## RMAP.007 - ADS Decision Criteria save all function

* Objective: save all functionality for all DETAIL level add / changed records
* Implementation:
    * function should be written in `ads_decision_criteria.html` in specific scripts section and called by `ads_start_page.html` function `get_new_ads_decision_criteria()`
    * optional, the API should be updated to implement a *bulk save* or use existing save in a for loop record-by-record
* Location: client-side `ads_start_page.html` & `ads_solution.html`, server-side `ads_decision_criteria_api_models.py`
* Status info: open [piu]@230302, updated [piu]@230302


## RMAP.006 - ADS Solution save all function

* Objective: save all functionality for all DETAIL level add / changed records
* Implementation:
    * function should be written in `ads_solution.html` in specific scripts section and called by `ads_start_page.html` function `get_new_ads_solution()`
    * optional, the API should be updated to implement a *bulk save* or use existing save in a for loop record-by-record
* Location: client-side `ads_start_page.html` & `ads_solution.html`, server-side `ads_solution_api_models.py`
* Status info: open [piu]@230222, updated [piu]@@230222


## RMAP.005 - ADS Relationships Approach save all function

* Objective: save all functionality for all DETAIL level add / changed records
* Implementation:
    * function should be written in `ads_relationships.html` in specific scripts section and called by `ads_start_page.html` function `get_new_ads_relationships()`
    * optional, the API should be updated to implement a *bulk save* or use existing save in a for loop record-by-record
* Location: client-side `ads_start_page.html` & `ads_relationships.html`, server-side `ads_relationships_api_models.py`
* Status info: open [piu]@230222, updated [piu]@@230222


## RMAP.004 - ADS Organization Map save all function

* Objective: save all functionality for all DETAIL level add / changed records
* Implementation:
    * function should be written in `ads_org_map.html` in specific scripts section and called by `ads_start_page.html` function `get_new_ads_org_map()`
    * optional, the API should be updated to implement a *bulk save* or use existing save in a for loop record-by-record
* Location: client-side `ads_start_page.html` & `ads_org_map.html`, server-side `ads_org_map_api_models.py`
* Status info: open [piu]@230119, updated [piu]@230121



## RMAP.003 - ADS scoring

* Objective: construct and maintain a **scoring** for ADS. Scoring is documented in [`ads/README_ads.md`](ds/README_ads.md)
* Implementation:
    * *business domain score* will be implemented as `get_score()` methods for each `ads_...` business domain
    * *general scoring* at Sales Project level
    * [x] badges on each tab content
    * [ ] *badge displayed score:* **Poor** (`<= 30%`), **Acceptable** (`> 30% and <= 60%`), **Good** (`> 60% and <= 90%`), **Very good** (`> 90%`)
* Location: all ADS ORM data models
* Status info: open [piu]@230119, updated [piu]@230121


## RMAP.002 - CRUD Data Table server side filtering and search

* Objective: CRUD admin Data table interface improvements
* Location: `APP_ROOT/>crud_data_admin/crud_data_admin_main.py` function `get_data(only_keys=None)` add a general action button for all supplementary actions imitating standardized interface: DASHES button or 3 horizontal LINE or WHEEL button (in fact acts like a dropdown)
* Status info: open [piu]@230104


## RMAP.001 - CRUD Data Table server side filtering and search

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
