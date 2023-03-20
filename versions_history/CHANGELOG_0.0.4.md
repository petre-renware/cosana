<small>*(c) 2022, 2023 RENware Software Systems*</small>

**cosana**    
***Comprehensive Sales Analysis & Review***

[PDF VERSION](/download{{ request.path }})

***

[TOC]

# CHANGELOG v0.0.4

<small>With (F) are marked those entries that are **FEATURES** so should be highlighted on *Release Note* documents.</small>    
<small>With (B) are marked those entries that are **BUG FIXES** so should be highlighted on *Release Note* documents.</small>

## 0.0.4

### 025.beta (230105 08:30)

* (F) 230105piu_c review, corrections, update documentation and release
* 230105piu_b `crud_table_template.html` drop deleted row from DataTable from UI
* 230105piu_a `crud admin ... data table` add row ID attribute as `_pk` for latter identification
* 230104piu_e restructured main / library / general CSS and JS components (`templates/base` level)
* 230104piu_d made *async** ajax call for delete action as now is tested
* 230104piu_c simplify SalesProject API and let it only for GET data - all other operations are moved to `crud_data_admin...` component

### 024.alpha (230104 06:00)

* 230204piu_b cleanup project and code
* (F) 230104piu_a `crud_data_admin...` implement effective DELETION, fixed 230103piu_f and insert in database some new test data
* 230103piu_f (**@ERR**) `crud_data_admin...` implement effective DELETION, crate do_delete() inner function - return error: Referrer Policy: strict-origin-when-cross-origin - CORS should be implemented (or call with POST and find other way to specify that want delete)
* 230103piu_e clean up code and documentation, drop obsolete and useless FIXME comments (mainly FIXME markers)
* 230103piu_d `crud_data_admin...` updated FORM-RT to *prepare* implement *"form"* keyword for form data manipulation in Flask-WTF practiece
* 230103piu_c `crud_data_admin...`  renamed TABLE-RT to TABLE-RT to clarify (and logically limit / restrict) its usage; small doc facelifts (not technical impact)
* 230103piu_b `crud_data_admin...` renamed AXAJ-RT to TABLE-RT
* 230103piu_a renamed / refactored `crud_data_admin_routes.py` to `crud_data_admin_main.py` and all references to it




--- ooo ---
