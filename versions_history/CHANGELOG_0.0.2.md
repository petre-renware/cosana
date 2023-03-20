<small>*(c) 2022, 2023 RENware Software Systems*</small>

**cosana**    
***Comprehensive Sales Analysis & Review***

[PDF VERSION](/download{{ request.path }})

<small>

***

[TOC]

# CHANGELOG v0.0.2

<small>With (F) are marked those entries that are **FEATURES** so should be highlighted on *Release Note* documents.</small>    
<small>With (B) are marked those entries that are **BUG FIXES** so should be highlighted on *Release Note* documents.</small>

## 0.0.2

### 016.beta (221218 10:30)

* 221218piu_d documented API routes (`data_models/...README...`) and update main README doc
* 221218piu_c `crud_data_admin` AJAX API get data definition from `/api/sales_project/columns_definition` (corresponding view function)
* 221218piu_b created alternate route `/api/sales_project/columns_definition` that gets only _pk ... data_ and commented variants for the other methods (POST, DELETE, PATCH)
* 221218piu_a created alternate route `/api/sales_project/columns_definition` that gets only column definition

### 015.alpha (221217 11:00)

* 221217piu_e update `data_models/ to get a new key (`columns_definition`) with list of columns and types. Here is a sample:
   ```
    { --------------------------------- dictionary starts here
        "columns_definition": [
            "_pk",
            "code",
            "_updated_by",
            "_updated_at",
            "_disabled",
            "description",
            "notes",
            "company_fk",
            "status"
        ],
        "data": [ {classic / old structure...},... ]
    ```
* 221217piu_d updated `crud_data_admin`, alter set of data to add *Actions* column (with a draft button to access main README)
* 221217piu_c updated `crud_data_admin`, created local route for AJAX CRUD DataTable purposes (see component README ref `TABLE-RT`)
* 221217piu_b updated `crud_data_admin` README specs set **short codes** for main components to be easily refereed in code (comments) or other places
* 221217piu_a updated `crud_data_admin` README specs with a components and process description
* 221216piu_e small fixes and clean updated files
* 221216piu_d moved `/templates/_crud_table_template.html` in `/crud_data_admin/` directory and render it with `render_string`



### 014.alpha (221216 06:35)

* 221216piu_c updated `crud_data_admin` README specs with an internal component mini architecture and "how and where" things are happening
* 221216piu_b updated 810_DSGN System Landscape with all updates up to here
* 221216piu_a cleanup solution
* 221215piu_h fixed 221215piu_g by updating DataTable `ajax` source URL
* 221215piu_g a first run of CRUD table with real data was made - there are problems with "Actions" and "Id" columns... maybe types should be rechecked
* 221215piu_f SalesProject ORM data model: updated `as_dict()` method to return `status()` which is property
* 221215piu_e updated **cosana** system environment with `requests` package
* 221215piu_d marked with comment "#!#FIXME consider login-protect route" all routes to remember at final to protect with login
* 221215piu_c created GET mini API for sales_projects
* 221215piu_b multiple changes ref system name and copyright... (because working on initial system creation components...)

### 013.alpha (221215 04:30)

* 221215piu_a moved all CRUD data table in established location
* 221214piu_d started to create "around **Data Tables Editor** as in [`/crud_data_admin/_examples_and_scratches.md`](/crud_data_admin/_examples_and_scratches.md)
    * 06 review all new JavaScripts code and customize it for "new job" - NO WAY - started to prepare for buttons in row that will send _pk and desired operation
    * 05 disabled temporary until solve problem of PHP to port it in Python
    * 04 start to specify the editable columns in `dataTable.Editor` **#FIXME PUR SI SIMPLU IN TABEL SUNT AFISATE EXCAT CELE CARE NUU SUNT VISIBLE**
    * 03 added the specific `dataTable.Editor` code as a draft that need o be customized
    * 02 added specific CSS in component HTML
    * 01 add new record button in component HTML
* 221214piu_c updated `crud_data_admin` completed `/crud_data_table/_examples...md` examples file with all required code (CSS, HTML, PHP)
* 221214piu_b updated `crud_data_admin` README specs and sys init sequence with hints and comments ref "what and how to do"
* 221214piu_a created a placeholder for new component `crud_data_admin`, initialized and loaded it with some examples (also initialized with a starter README and all required references: DSGN Landscape, DSGN Index, sys_core.init_system.py)
* 221213piu_f updated Bootstrap jQuery Data Table: test for button in table row (simply put text and it automatically render ilf detect HTML) - OK.RENDER.BUTTON

### 012.alpha (221213 05:30)

* 221213piu_e updated Bootstrap jQuery Data Table: in `get_data(only_keys)` for `only_keys == True` function check for **NULL or EMPTY** records and return a set of columns with some sample data but respecting type as it should be (will be used for stomatic column formatting)
* 221213piu_d updated Bootstrap jQuery Data Table: make table header & footer fixed on scroll and limited vertical area to 350px in order to allow for details without page scrolling from "first sight" to see something helpfull
* 221213piu_c updated Bootstrap jQuery Data Table: columns with lower(name) containing **[_pk, _id, _fk]** set to hidden (`visible` attribute)
* 221213piu_b updated Bootstrap jQuery Data Table: show full navigation controls (first, last, prev, next, numbers)
* 221213piu_a refactored `test-bootstrap-table.html` to `_crud_table_template.html` as preparing step to generalize solution




--- ooo ---
