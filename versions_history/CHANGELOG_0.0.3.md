<small>*(c) 2022, 2023 RENware Software Systems*</small>

**cosana**    
***Comprehensive Sales Analysis & Review***

[PDF VERSION](/download{{ request.path }})

***

[TOC]

# CHANGELOG v0.0.3

<small>With (F) are marked those entries that are **FEATURES** so should be highlighted on *Release Note* documents.</small>    
<small>With (B) are marked those entries that are **BUG FIXES** so should be highlighted on *Release Note* documents.</small>


## 0.0.3

### 023.beta (230102 06:00)

* 230102piu_c archived version 0.0.2
* 230102piu_b **@FIXED** creating a flashing component (inspired by https://www.youtube.com/watch?v=SPmLxRbe964) available globally (main base template)
* 230102piu_a *@99% FIXED* creating a flashing component (inspired by https://www.youtube.com/watch?v=SPmLxRbe964) available globally (main base template) `(msg: don't see anything - should check timing constants in CSS)`

### 022.alpha (230101 09:50)

* 230101piu_a *@ERR* creating a flashing component (completely in JS) placed on *base template HTML* `(msg: still need workaround but the ore is present)`
* 221230piu_c `100_ANA/120_CPTS_System_Concepts.md` updated ref common system business vocabulary
* 221230piu_b *continuing 221229piu_c* - implement effective DELETION (make an ACTION PLAN)
* 221230piu_a *continuing 221229piu_c* - refined SalesProject API by defining different view functions by request method (to be able to call locally without forwarding request)
* 221229piu_d *continuing 221229piu_c* ---- make some tests in JS `delete_data_row(data_row_pk)` and write to browser console - test OK, it brings requested data
* 221229piu_c `crud_data_admin...`component implement DELETE action effective code: step 1 made FORM-RT (`/crud_data_form/salesproject/<operation_or_pk>`) work for GET one PK
* 221229piu_b some styling in crud table main window to increase "visual clarity & intention" of action buttons (suggested by a UI designer)
* 221229piu_a created a cosana launch script (`start_cosana.sh`)
* 221228piu_f DELETE button changed to call a JS function (`delete_data_row(data_row_pk)`) and request a confirmation for deletion
* 221228piu_e @FIXED BUG ref data in CRUD table that not appear after some changes; still page does not render correct (title is "too high to be visible...")
* 221228piu_d CRUD DATA ADMIN, NEW | EDIT | DEL operations, prepared *FORM-RT* (route `/crud_data_form/salesproject` function `crud_data_form()`) to start data saving code
* 221228piu_c cleared code for route `/crud_data_form/salesproject` view function `crud_data_form()` as unusable and "without object" now (at this point)
* 221228piu_b clarified role of `/crud_data_feeder/salesproject` route and refactored to `/crud_table_data_feeder/salesproject`,  for server side data processing was updated OPEN_ISSUES_ROADMAP.md document ref ***RMAP.001***
* 221228piu_a changed *OPEN_ISSUES.md* to accommodate the project *ROADMAP* ==> new file `OPEN_ISSUES_ROADMAP.md`; some cleaning in project administrative docs
* 221227piu_f commented on HTML for Delete button sent to `DataTable` on `crud_data_admin_main.py` how to be changed
* 221227piu_e change HTML for Edit button sent to `DataTable` on `crud_data_admin_main.py` to be like working new button
* 221227piu_d new file in `crud...` component ref how create a "data-xxx" attribute to store object (dictionary) and how to traverse it (file `xxx_access_an_object_inJS.md`)

### 021.alpha (221227 08:00)

* 221227piu_c *PASSED* test3 - reorganized `crud_table_template.html` to put table first (before form) (**RESULT**: ALL PASS - for data is updated; put comments ref used methods)
* 221227piu_b *FAILED*: test2 - reorganize `/templates/base/_base_css.j2` to load required *jQuery 3.6.1* library before data table library (**RESULT**: still does not set data controls on modal form - *solve this issue then can go next to action plan*)
* 221227piu_a *PARTIAL PASS*: test1 - use for modal recommended CSS and JS libraries (**RESULT**: still does not set data controls on modal form - *solve this issue then can go next to action plan*)
* 221226piu_c comments in `___modal_with_form_elements_bootstrap.html` - seems to be absolutely OK - **pls check all HTML from base template down for possible errs...**
* 221225piu_b prepared `show.bs.modal` event to accept operations (NEW, EDIT) on `data-oper="..."` attribute and record PK on `data-recpk="..."` attribute
* 221226piu_a cleaned up code & prepare new strategy: "**action buttons will be usual buttons (as is New test button) and will be treated primarily in JS**"
* 221225piu_b NOT WORK. test #2 for *show modal data form* from `item_action` function; let some comments with what works and what doesn't
* 221225piu_a NOT WORK. test #1 for *show modal data form* from `item_action` function; let some comments with what works and what doesn't

### 020.alpha (221224 08:30)

* 221224piu_b FIXED. OK-PASS. test #2 for capturing *show* event for modal to initialize with data and *hidden* event to collect changes
* 221224piu_a NOT WORK. test #1 for capturing *show* event for modal to initialize with data and *hidden* event to collect changes
* 221223piu_g small changes in modal `crud_form_template.html` still trying to fix aspect
* 221223piu_f small changes in modal `crud_form_template.html` to improve aspects, cleared buttons - no significant improvement
* 221223piu_e started COSANA vocabulary & definitions in `/810_DSGN/810.00_Overview.md`
* 221223piu_d `crud_table_template.html` send `crud_form_template.html` as string to be rendered in main HTML
* 221223piu_c created a pyscript library for requests: `crud_data_admin/pyscript_request.py` (classic blocking and async versions)
* 221223piu_b TEST-NOT-ACCEPTED `crud_table_template.html` start tto make effective request for *action operations*, step: test & comments launch form data
* 221223piu_a updated `crud_form_template.html`: clean and keep it at dialog modal level as always will have a parent HTML document
* (@BUG) 221222piu_d move the crud "play" form in `crud_form_template.html` (right location)
    ***error - just partial work - need clarify strategy*** - for more details search for FIXME bug 221222piu_c

### 019.alpha (221222 08:00)

* 221222piu_c more comments on form template preparing it for move in effective HTML file
* 221222piu_b AJAX route parametrized with code-name `salesproject` as will be obtained from Commons and calculations
* 221222piu_a play / design modal form scratch and comment places where from template should be placed; also marked in `crud_data_admin_main.py` variables that are subject of generalization
* 221221piu_f `crud_data_admin`: initialized new file `crud_form_template.html` for EDIT / New entering data form
* 221221piu_e (**FAILED** init) installed and initialized `Flask Modal` (does not work because an error trying to `import Markup from jinja2` which is available in `markupsafe` and so was removed from actual version of Jinja2...) - commented out in system chain init and wait for a newer version **greater that 0.5.0**
* 221221piu_d defined form in `crud_table_template.html` using a dedicated `div` component (as is not visible always) to be manipulated independently
* 221221piu_c installed `Flask-Modals` component basically for getting user input in forms
* 221221piu_b *finalized* design Form for SalesProject (`data_models/salesproject_form_models.py`)
* 221221piu_a *initialize & skeleton setup* design Form for SalesProject (`data_models/salesproject_form_models.py`)
* 221220piu_g restyled all action buttons just letting `style="margin:5px;"` without Bootstrap class `p-1`
* 221220piu_f refactor `sales_project_` to `salesproject_` to align file names to new convention

### 018.alpha (221220 07:30)

* 221220piu_e system database: cleaning and updated full SQL script (`/db_scripts`)
* 221220piu_d installed Flask-WTF and updated system `requirements.txt`
* 221220piu_c GENERALIZATION-STEP: published CRUD admin for SalesProject in menu top navbar
* 221220piu_b GENERALIZATION-STEP: refactor SalesProject physical table name to be as ORM class name but in full lowercase (sales_project --> salesproject)
* 221220piu_a GENERALIZATION-STEP: `crud_data_admin_main.py` renamed main route to `/crud_admin/salesproject` as described in ***GENERALIZATION-STEP-01***

### 017.alpha (221219 18:00)

* 221219piu_i `crud_table_admin_routes.py` generated action buttons (edit, delete) by calling function `item_action(oper, row_pk=None)` with correct params
* 221219piu_h `crud_table_template.html` function `item_action(oper, row_pk=None)` generalized as skeleton for any allowed operation
* 221219piu_g `crud_table_template.html` styling / facelift to `pyscript` elements added
* 221219piu_f `crud_table_template.html` updated "Create new record" button to call a pyscript (test) function - **TEST PASS / OK**
* 221219piu_e `pyscript` set the `pyodide` runtime
* 221219piu_d play with `pyscript` - this could be a long issue...
* 221219piu_c `pyscript` libraries included in ***base CSS template library***
* 221219piu_b `crud_table_template.html` add example of 2 controls interacting with a pyscript code and left some test-play-code in `crud_table_template.html`
* 221219piu_a `crud_data_admin`, add `pyscript` libraries ==> intention: use python on action buttons script to make requests
* 221218piu_e cleanup solution comments, files, solved TODOs and fixed FIXMEs






--- ooo ---
