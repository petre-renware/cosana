<small>*(c) 2022 RENware Software Systems*</small>

[PDF VERSION](/download{{ request.path }})

<small>

* Code name: `crud_data_admin`
* Version: 0.4.0
* Last update: 230128
</small>

**CRUD data administration component**

***

[TOC]

# Overview

This component is designed as a package with the following purposes:

* show data in a tabular form for reading and with features for data navigation (paginating, ajax async data loading)
* creating new data and edit existing data
* deleting with confirmation of records
* other specific buttons with actions customizable by developer

<small>Future versions: Component itself is designed as a general *CRUD administration framework* regardless of a particular data object. There few modifications needed to change "the main data object" subject of component, documented as docstring in `crud_data_admin_main.py`.</small>

>The CRUD data administration component makes use of `data_models` component for API data provider, forms definition and validation rules.





# Process and Components Description

## Files

The files used by component are (in a relative importance order):

* `crud_data_admin_main.py` - this file contains code to expose all component route and functionalities
* `init_crud_data_admin.py` - component initialization code (instead of automatic `__init__.py`)
* `crud_start_page.html` - main component user interface (table with data and corresponding actions)
* `crud_form_template.html` - contains HTML for new / edit form - it is incorporated / included in main HTML file - is kept separately for easier changes of form
* `__init__.py` - empty file for Python packaging purposes

>*Note*: all HTML files are rendered from this directory (as being component specific) and from Flask template directory (except base templates).



## Main components

These are:

* **DEF-RT**
* **TABLE-RT**
* **FORM-RT**
* **CRUD-UI**
* **FORM-UI**


### DEF-RT

instantiate the crud admin framework for a particular object

    * result a **route** where that *data object CRUD UI is available*
	* located in file `crud_data_admin_main.py`
	* route: `/crud_admin/salesproject`
	* view function `crud_admin_builder()`
	* query parameters: represents the status after some data editing (new / edit operations) and are optional - the route can be called without them (for example a fresh loading) or with them and UI will display an info box ref last new / edit operation executed; query parameters are: `visible`, `pk`, `code` - all are strings, *visible* should be YES to show info box or anything else not show


### TABLE-RT

route for *DataTable* data (and runtime configuration of columns, types, ...) feed (table data endpoint)

    * process: this route acts as a **proxy** between *general DATA API route*[^data_format] (from `data_models` component) and AJAX endpoint with main role to *alter original data by providing* ***"Actions" column(s)*** (ie, buttons for Edit, Delete, ... operations)[^altered_data_format]
    * located in file `crud_data_admin_main.py`
    * route: `/crud_table_data_feeder/salesproject`
    * view function `crud_data_feeder()`
    * **NOTE:** effective altering for "Actions" column(s) is done in `get_data()` helper function (see below)


### FORM-RT

route for FORM-UI handling (specific HTML forms handling)

    * process: logic to handle data for DataTable operations New & Edit - the logic is basically aligned to:
        *  (1) `Flask-WTF` *form object* structure and definitions and
        *  (2) for *NEW* and *EDIT* operations `Bootstrap modals` which embed the actual data form and assures data pre-loading (defaults and for EDIT) on event `'show.bs.modal'` and initiates save on event `'hidden.bs.modal'`
        *  (3) for DEL operation there is a separated function (`delete_data_row(data_row_pk)`) which initiates deletion process
    *  all calls to master system API (provided in `data_models` component) are done through an intermediary *pyscript* function(s) as a trap because its code is hidden at client level even browser developer tools are invoked (just a reference to a server located external file is visible)
    * located in file `crud_data_admin_main.py`
    * route: `/crud_data_form/salesproject/operation_or_pk`
    * view function `crud_data_form()`
    * **NOTE - special operations** used in route as operations (instead of a real PK):
        * **`form_op_new`** - for considering an insert into database
        * **`form_op_edit`** - for considering an update into database


### CRUD-UI

a HTML template that contains the CRUD administration UI amd will be sent to client to be rendered by browser; this HTML template is constructed with `Jinja` elements which are evaluated and rendered to HTML code at server side
    * located in file `crud_start_page.html` <small>*NOTE: file is located in component directory, instead of Flask standard templates location)*</small>


### FORM-UI

a HTML template that contains the form elements used for *new* and *edit* operations
    * located in file `crud_form_template.html` <small>*NOTE: file is located in component directory, instead of Flask standard templates location)*</small>
    * design considerations: HTML code is designed using `Bootstrap modals` which embed the actual data form



## Helper components

* **`get_data()`** function to **get data** from an external API (external to component) and to:
    * **(1)** alter it adding Actions column
    * **(2)** parse it for data columns definition
    * located in file `crud_data_admin_main.py`

* other various helper functions used in process client requests and building responses













# Initialization

This component initialization (pay attn and do not confuse with instantiate process) consists of:

- **test** routes and other test artifacts
- **api endpoints** - all for CRUD operations: *GET*, *POST*, *PATCH*, *DELETE*
    <small>*NOTE:* this component could be initialized in main system chain (sys_core); please check your system version</small>

Component initialization is located in [`init_crud_data_admin.py`](/crud_data_admin/init_crud_data_admin.py).








[^data_format]: data general format for `data` key is:
    ```
    {
        "data": [
            {
                "column_name": column_value,
                ...
            },
            { ... the other rows ...}
        ]
    }
    ```
[^altered_data_format]: after altering `data` key it looks like:
    ```
    {
        "data": [
            {
                ...original real data columns...
                "DT_RowId": containing row identifier (again _pk) which will be rendered as table row id attribute
                "actions": "HTML string with action buttons definition, for example <button>....</button>"
                ...
            },
            { ... the other rows ...}
        ]
    }
    ```