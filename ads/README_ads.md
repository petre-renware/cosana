<small>*(c) 2022 RENware Software Systems*</small>

[PDF VERSION](/download{{ request.path }})

<small>

* Code name: `ads`
* Version: 0.10.0
* Last update: 230320
</small>

**Account Data Sheet (ADS) component**

***

[TOC]

# Overview

This component is designed for:

* sales projects data sheet information
* sales projects data sheet review
* sales projects data sheet analysis


# Components Description

## Files

The basic files used by component are (in a relative importance order):

* `ads_main.py` - this file contains code to expose all component route and functionalities
* `init_ads.py` - component initialization code (instead of automatic `__init__.py`)
* `ads_start_page.html` - main component user interface (table with data and corresponding actions)
* `__init__.py` - empty file for Python packaging purposes

Also there are files specific / dedicated to each *business domain*. These are named `ads_business...domain.html`, where `business...domain` is the *code-name* of corresponding business domain (see *(i2.b) area* section).

These files contains the "detail form" (ie, tab on UI) for *input / edit* data of respective business domain. Code to process the data is located in basic files, both on *server -side* and on *client-side*.


>*Note*: all HTML files are rendered from this directory (as being component specific) and from Flask template directory (except base templates).



## Main UI page

This is the main page of ADS (Account Data Sheet) that is seen by client / end user. It is organized in following layout zones:

* **(i1)** top zone; contains title and Sales Project info / selector (reserved for future versions)
* **(i2)** middle zone: contains the ADS information organized as tabs by business information domains; (i2) zone has 2 parts:
    * *i2.a-Navigation-area* designed for navigation through (i2) area content
    * *i2.b-Content-area* designed for ADS information / content organization in business relevant information domains. Details about [ADS information, structure, content and organization can be found in `/810_DSGN/810.03_System_Data.md`](/810_DSGN/810.03_System_Data.md).
* **(i3)** bottom zone: contains actions that can be done by an end user, mainly *Save* being the basic one

```
MAIN UI PAGE
+---------------------------------------------+
| (i1) zone / title and Sales Project         |
+---------------------------------------------+
| i2.a-Navigation-area  | (i3) zone / actions |
|                       +---------------------+
|                                             |
| (i2) zone / ADS information                 |
|                                             |
|                i2.b-Content-area            |
|                                             |
+---------------------------------------------+
```

### (i2.b) area

(i2.b) area as part with content for each business domain is essential  not only because of its data but because its complexity. Therefore it is important to be easy maintainable and from this point of view it was *"broken" into distinct HTML files*. These are loaded by a`ds_main.py` code at ADS UI rendering.

Corresponding to each tab - business domain, it is a dedicated file:

* `ads_general_data.html`
* `ads_decision_criteria.html`
* `ads_evaluation.html`
* `ads_org_map.html`
* `ads_relationships.html`
* `ads_revenue.html`
* `ads_solution.html`

Each of these file contains the corresponding tab content except area title which is located in `ads_start_page.html` file. The content is pure HTML and is rendered and included in `ads_start_page.html` as is. It is surrounded by a `div` section in main file.

Each *data input control* fas its own unique ID identified by `ads_...name...` where `...name...` is the code-name of data control [see `810_DSGN_System_Data.md` documentation](/810_DSGN/810.03_System_Data.md).

>***NOTE: `_disabled` attribute at business domain objects level has no importance, but an error message inform user to report this situation to a system administrator***

### (i3) area

* The button *Save* is identified by `ads_save_button` id to be *enabled* or *disabled* depending on ***page dirty*** local property; button call function **`save_ads_data(sales_project_pk)`**
* The button *Revert* is identified by `ads_revert_button` id and call function **`revert_page()`**

### page initialize and local states

The page maintains its own state variables which can be found u der `//*--- global page information` comment. There is a dedicated state regarding the ***dirty / clean*** current situation, state maintained through function `mark_page_dirty(dirty: boolean)`.

The page is initialized through function `init_page()` and this is called at first page loading and when *Revert* button is pressed.







## ADS-RT

instantiate the *Account Data Sheet* framework for a particular *Sales Project*

* result a **route** where that *ads is available
* located in file `ads_main.py`
* route: `/ads`
* view function `ads_builder()`
* query parameters: `sales_project_pk` string representing Sales Project to load ADS data




# Scoring component

This process construct and maintain a *score for each business domain* and a *score at Sales Project* level.
Scoring is based on points given for *each fact* (ie, information existence and / or its *quality*).

Maximum score per business domains is defined in document `/810_DSGN/810.03_System_Data.md` as it is tight to information defined for each business domain.


## Conventions

* Visual score components are located in `ads_start_page.html` at each business domain tab-widget level content.

* Visual score components contains 2 (two) badges "in line" with tab-widget and aligned right. The two badges are:
    * a badge containing the **current score**, identified by `id="score_crt_ads_<...bss_domain...>"`
    * a badge containing the **maximum possible score**, identified by `id="score_max_ads_<...bss_domain...>"`
    * pair of badges are for each business domain in part and the `<...bss_domain...>` is the name of business domain

* Data structure returned from data models is:
    ```
    "score" = {
                "crt_score": 111111,
                "max_score": 999999,
            }
    ```


## Process

* Score components are loaded after loading data for each business domain (ie, at the end of function `get_ads_...bss-domain...(sales_project_pk)`)

* The score (both current and maximum) is calculated ***distinct and specific*** for each business domain in corresponding *data model* file (ie, `ads_...business...domain..._data_models.py`). Calculations is of two types:
    * **equally weighted** where each ***current*** item from respective domain has the same weight, equivalent of `score = number of items`; ***maximum*** is given by "number of items"
    * **differently weighted** where each ***current*** item from respective domain has ith own points (in not equal values) and so has its contribution to score; ***maximum*** is given by `sum od max points of each item`; for these domains, if exists, is used also associated *LOV* code-file

## Score calculation by business domain

The following paragraphs describe how score is calculated for each business domain and source locations where score is "primary generated".

* General data
    * code-files: `ads_general_data_data_models`
    * calculation: equally weighted
* Evaluation
    * code-files: `ads_evaluation_data_models`, `ads_evaluation_lov_models`
    * calculation: differently weighted
* Organization map
    * code-files: `ads_org_map_data_models`
    * calculation: differently weighted
* Revenue
    * code-files: `ads_revenue_data_models`
    * calculation: equally weighted
* Relationship approach
    * code-files: `ads_relationships_data_models`, `ads_relationships_lov_models`
    * calculation: differently weighted
* Solution
    * code-files: `ads_solution_data_models`, `ads_solution_lov_models`
    * calculation: differently weighted
* Decision criteria
    * code-files: `ads_decision_criteria_data_models`, `ads_decision_criteria_lov_models`
    * calculation: differently weighted


### Organization map score calculation

Score calculation for this business domain will follow these rules:

* For each qualifier (ie, decision_make, need_to_sign, technical_evaluation, financial_evaluation, consultant) will be computed how many positions has been identified.

* There are some limits for the number of these positions, ***limits that state the usefulness*** and dictated by *best practices used by others in their current business*. As example consider that 5 positions of DM (decision making) has been identified - in practice this is something a little bit abnormally because probably one or two positions are REALLY decision making ones, so a maximum limit for DM will be set to 2 and what is over this quantity does not get any improvement in sales process, but it can even create confusion.

* The **maximum limits are set for qualifier** as following:
    * decision_make - 1
    * need_to_sign - 2
    * technical_evaluation - 3
    * financial_evaluation - 2
    * consultant - 3
    >NOTE: maximum points are defined in `/data_models/ads_org_map_lov_models.py` in order to be easier configurable from application interface (for details see ROADMAP RMAP.008 - System configuration functionality)

* (***orgmap-r1***) For each qualifier will be calculated a number of points by dividing *NUMBER_OF_QUAL = number of identified number of positions found with that qualifier set* to *MAX_QUAL = maximum number of useful positions with that qualifier* and keeping result in established maximum limit, ie over that limit does not matter:
    ```
    min(1, NUMBER_OF_QUAL / MAX_QUAL)
    ```

* all points calculated at (***orgmap-r1***) will be add and divided by number of qualifiers and result will be rounded to integer:
    ```
    SCORE = sum((each qualifier points)
    ```

* the total business domain score is obtained by summing all max properties (ie, 11 for values shown here)


### Relationships approach score calculation

Score calculation in this section is based on *Organization Map* score elements. The idea is: **"to cover"** all positions identified in Organization Map.
The actual (current) score will be given by ***MINIMUM*** between MAXIMUM score and number of identified named positions.

>***Note***: py attention that if Organization Map is not completed as score (progress) the Relationship Approach will not reflect that. This business domain consider Organization Map AS IS. Changes in Organization Map will reflect in MAXIMUM score defined in Relationship Approach


### Solution score calculation

Score calculation in this section is based on scores defined in `/data_models/ads_solution_data_models.py` key **`strength`**, regardless of any solution "feature type" (ie, characteristic, advantage, benefit). Solution elements defined will be evaluated by their specified `strength` and summed accordingly.

The maximum points are calculated by ***multiplying maximum possible strength WITH number a solution defined elements***.

>***NOTE:*** No solution element defined will get a ACTUAL SCORE of **0 (zero)** and a MAXIMUM SCORE of **"n/a"** which will be treated for mathematical purposes as *0 (zero)*.


### Decision criteria score calculation

Score calculation in this section is based on scores defined in `/data_models/ads_decision_criteria_data_models.py` key **`our_status`**, regardless of any other (especially but not only 'client_importance' if there will be more defined) key. Decision criteria elements defined will be evaluated by their specified `our_status` and summed accordingly.

The maximum points are calculated by ***multiplying maximum possible `our_status` WITH number a decision criteria defined elements***.

>***NOTE:*** No decision criteria element defined will get a ACTUAL SCORE of **0 (zero)** and a MAXIMUM SCORE of **"n/a"** which will be treated for mathematical purposes as *0 (zero)*.


Other details relative to *SCORING* can be found in [data models specs README document](/data_models/README_data_models.md).




# ADS business domains client-side considerations

All ADS business domains data (information) is presented at client side using TABs as UI widgets to group information. Each business domain has a corresponding HTML file (`ads_...business_domain_name....html`) which is "incorporated" at execution into `ads_start_page.html` main page.

Regarding these TABs, its elements MUST be identified and recognized in order to populate and to save them. In this way, all specific UI controls for data entering are marked with `id="..."` composed with *prefix* `ads_...business_domain_name...` *followed* by attribute name. For example, supposing attribute `_pk` of ADS Evaluation business domain has the **id** as: `id="ads_evaluation__pk"` (*note the double underscore because it is present in attribute name too*) or for same domain, the `remarks` attribute, corresponding widget has id as: `id="ads_evaluation_remarks"`.


>***EXCEPTION***: The ADS General Data business domain makes an exception, its "id" of widgets being composed only by prefix `ads_...` and NOT CONTAINING the business domain name. This exception is present only in all versions ***less than*** `0.4.0`. Starting with `0.4.0` the same pattern  (ref *id*) apply for all business domains.

## Naming conventions used in code

In client-side code there are ***id*** attributes can be named as:

* **`ads_<business_domain>_<attribute_code-name>[_PK-code]`** used mainly for fields at first / MASTER / MAIN level of object / entity (in most cases single level)
* **`ads_<business_domain>_details_<attribute_code-name>[_PK-code]`** used for fields at second / DETAILS level of object (where exists - [see System Data](/810_DSGN/810.03_System_Data.md))
* **`ads_<business_domain>_details_new_<attribute_code-name>`** for new data entry forms (usual modal forms but not mandatory) - these are temporary codes regardless of PK being used only for new-intended data entry (always will be INSERT-ed)

Also these name will find in ***variables*** and ***object keys*** names.






# Global and general variables (client side)

## Global variables

These variables are defined partial as *static* (`let ads_all_data = empty_ads_all_data()`) and updated by / through *function* `empty_ads_all_data()` which initialize, defaults and returns the whole structure. Following example show the structure for 2 business domains (Genera Data and Evaluation).


```
_ads_all_data = {
    --- HERE is General Data business domain ---
    ads_general_data: {... ADS General Data business domain data here as pairs of db-attribute : db-value ...},
    ads_general_data_ids: [...],
    ads_general_data_ids_map: {...map between DB attributes as pairs db-attribute : HTML-id ...},
    ads_general_data_dirty: ...,

    --- HERE is Evaluation business domain ---
    ads_evaluation: {... ADS General Evaluation domain data here  as pairs of db-attribute : db-value ......},
    ads_evaluation_ids: [...],
    ads_evaluation_ids_map: {...map between DB attributes as pairs db-attribute : HTML-id ...},
    ads_evaluation_dirty: ...,

    --- here follow next business domains ---,
}
```











# Functions (client side)

These are mainly `javascript` functions and variables defined in `ads_main.html` scripts section (block `body_level_custom_scripts`):

## Initializers

* `empty_ads_all_data()` - empty (make `null`) the local variable used to keep all ADS business domains data
* `init_page()` - initialize main page on first load or at request (normally "Revert" button do that)

## Data getters

* `get_sales_project(sales_project_pk)` - get info ref requested Sales Project
* `get_ads_all_data(sales_project_pk)` - get all ADS business domains data (by calling dedicated / specialized functions by domain)
* `get_ads_general_data(sales_project_pk)` - get corresponding (async) business domain data
* `get_ads_evaluation(sales_project_pk)` - get corresponding (async) business domain data
* `get_ads_revenue(sales_project_pk)` - get corresponding (async) business domain data
* `get_ads_solution(sales_project_pk)` - get corresponding (async) business domain data
* `get_ads_org_map(sales_project_pk)` - get corresponding (async) business domain data
* `get_ads_decision_criteria(sales_project_pk)` - get corresponding (async) business domain data
* `get_ads_relationships(sales_project_pk)` - get corresponding (async) business domain data

## Data savers

* `save_ads_all_data(sales_project_pk)`- save all ADS business domains data
* `save_ads_general_data(sales_project_pk)` - save corresponding (async) business domain data
* `save_ads_evaluation(sales_project_pk)` - save corresponding (async) business domain data
* `save_ads_revenue(sales_project_pk)` - save corresponding (async) business domain data
* `save_ads_solution(sales_project_pk)` - save corresponding (async) business domain data
* `save_ads_org_map(sales_project_pk)` - save corresponding (async) business domain data
* `save_ads_decision_criteria(sales_project_pk)` - save corresponding (async) business domain data
* `save_ads_relationships(sales_project_pk)` - save corresponding (async) business domain data

## Helpers

* `revert_page()` - reload page with no save
* `mark_page_dirty(dirty)` - mark page "dirty" or "clean" (just set a flag, normally marking it dirty after nay change)
* *bind to `change` event* plus lambda function the detects any change on ADS input elements `$('input, textarea, .form-control').bind("change", function() {...`











--- ooo ---