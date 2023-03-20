<small>*(c) 2022 RENware Software Systems*</small>

[PDF VERSION](/download{{ request.path }})

<small>

* Version: 0.0.0
* Last update: 221201
</small>

**Documents Viewer**

***

[TOC]

# Overview

This component is designed to facilitate:

* displaying of **markdown** documents
* displaying of **json** documents
* converting and sending for download of **pdf** documents

Component can also act as a simple proxy for other files like **pictures**.

# Description

The `doc_viewer` component consists of two published routes:

* view function: `system_doc_viewer(docfile)`, route: `/` + path to document (the view function argument) - ***for view documents***
* view function: `system_doc_downloader(docfile)`, route: `/download/` + path to document (the view function argument) - ***for convert to PDF and send to client***

Reference to module code: [`doc_viewer/doc_viewer_routes.py`](/doc_viewer/doc_viewer_routes.py).

**Design aspects**

* allowed file types for viewing are stored in a dedicated list defined and initialized as most as possible at beginning of code
* *json* files are first transformed temporary to markdown by simply surrounding json string with markdown code block (three back tick marks); 
original files are not changed / altered
* picture files are just sending to client "as is"; from security reasons to avoid "any file sending", only some picture formats are allowed (possible to be hard-coded)

# Using jinja variables in markdown

It is possible to use *Jinja data* inside a markdown file. This data follows the [Jinja documentation](https://jinja.palletsprojects.com/en/3.1.x/templates/#variables) rules (using brackets) and can be addressed using `jinja_data` prefix (as a class).

***Example:***

* Let suppose you wish to send some data in variable `my_data`. To address it as Jinja data in markdown follow Jinja rules of how address variables and Jinja data will be **`jinja_data.my_data`**.
* Function of structure and complexity of `my_data` it can follow rules of lists or dictionaries as `jinja_data.my_data["my_some_dict_entry"]`.




--- ooo ---
