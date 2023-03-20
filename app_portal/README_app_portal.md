<small>*(c) 2022 RENware Software Systems*</small>

[PDF VERSION](/download{{ request.path }})

<small>

* Code name: `app_portal`
* Version: 0.0.5
* Last update: 230111
</small>

**Main Application Portal**

***

[TOC]

# Description

The `app_portal` component initializer contains:

* the main application portal as Flask object (and main **cosana** user interface)
* publish it in `commons` to be referred by other components

Also here is the code for index page / main routes [`/app_portal/main_routes.py`](/app_portal/main_routes.py).
These routes are not initialized in this module (too "early" for them as init order) but are initialized in `sys_core` near the end of *init chain*.

**Applicable standard**: Flask application container and have as non default:

* *templates* location is established for `/templates` directory (located directly under application root)
* *static* location is established for `/static` directory (located directly under application root)

This change was made for maximum generality of the two folders as they are reused by other system components.



# Creating Main Application Portal

Creation of `app_portal` is done in [`/app_portal/init_portal.py`](/app_portal/init_portal.py).

**Details and Specifications:**

* main application is created in function `create_portal()`.
This function must be *explicitly called* and wil return a Flask **app object** with created application.
* creation alter *default templates and static* locations as mentioned earlier. These locations are determined by finding out where from system is started (ie, path) then transformed to absolute system paths.
* also this function stores in `commons` the `app` created object as key `app_portal`.




# Main routes

The main routes are created at system initialization and are intended to be "*index / principal system URLs*" but can be used for any other routes just to have in mind that should try to avoid routes intended for other components because the system will become harder to maintain.

Creation of *main system routes* is done in [`/app_portal/main_routes.py`](/app_portal/main_routes.py). The list of main routes is:

* `/` a root route mainly useful to find out the *portal root as URL* by a know view function name (`home`); 
associated view function: `home()`; this view function renders `index.html` but can contain anything considered useful / relevant; 
this route and its associated view function with specified signature **MUST NOT BE DROPPED** as they can be referenced in other parts of code
* `/whoami` route that will return a JSON with *hostname* where running and the user logged in (if authentication is available otherwise notify this thing)
* `/show_commons` route used to inspect global (Commons) data
* `/sitemap` route used to show site map for static (ie, not variable / dynamic) routes
* `wip` route to display the `under_construction.html`



# Top navigation bar menu

Here is a layout of menu presented in application *top navbar*. Level 1 means exactly on bar, level 2 is a normal drop-down entry and level 3 is an entry from a drop down level 2.

There are shown only level 1, 2 & 3 entries, so it is not a good practice to use more levels which can "obfuscate" the end users.

* Home - is the index page, - component `app_portal.main_routes`
* Sales accounts - the system core component used to maintain, review and analysis of **Accounts DataSheet**
    * Sales projects
    * Accounts Data Sheet Review
* Master data - maintain master data (mainly Sales Projects and Companies)
* User - user's menu
    * Login
    * Sign out
    * Preferences
    * Who am I
* System - system specific administration (privileged level)
    * Inspect global data
    * Show heartbeat message
    * Site map
    * Master data import
    * Data health check
    * System settings
    * Users administration
* Help - help elements
    * User manuals
    * Work procedures
    * System administration
    * Technical documentation
    * COSANA methodology
    * About cosana
    * Contact


# Pages development kit

Directories `/templates` and `/static` contain files usable for page creation.
The aim is to create pages with a minimum "same look and feel" (or standard).
This is not a mandatory requirement but is a desired one for a commercial product.

## Kit content

The kit follow Flask organization using the two placeholders recommended and practiced:

* a *static* location for all files that are not intended to be dynamically changed
* a *templates* location for files that are dynamic changed and mostly used to be *sent to client as responses*

The kit content for both directories is detailed in next sections.

## Static directory

Here are required files for Bootstrap 3 framework.
They are downloaded from Bootstrap *CDN* as recommended by producer.

Reason for getting local UI framework files (instead of using CDN) is to be able to use application even the server loose public internet connection.

## Templates directory

Here the file usually intended to be *sent to client as responses*
There are 2 starter files:

* `index.html` for main index page, [see file here](/templates/index.html)
* `under_construction.html` used for pages whose content development is in progress or maintenance 
, [see file here](/templates/under_construction.html), 
it is intended to send a content to client as feedback that "something is happening" and server is alive

Directory also contains a set of basic files used as *default pages layout*.
This is not mandatory to be used but is recommended.
These files are grouped under `base` directory in templates:

* `_base_css.j2` - contains CSS complete references, by complete meaning inclusive their adds like own java scripts - [see file here](/templates/base/_base_css.j2)
* `_base_footer.j2` - contains HTML that will be used as page footer like - [see file here](/templates/base/_base_footer.j2)
* `_base_jscripts.j2` - contains a minimum java scripts that page has a basic features on browser (for example message alerts) [see file here](/templates/base/_base_jscripts.j2)
* `_base_navtop.j2` - top navbar that is supposed to render in all relevant pages (for example not in markdown rendered pages as will appear in PDF conversion) - [see file here](/templates/base/_base_navtop.j2)
* `_base01_jinja.html` - aggregate all previous files to act as a *page layout*; written in Jinja 2 language; this is the only one file that need to be used to render full pages in **cosana style** - [see file here](/templates/base/_base01_jinja.html)
* `bootstrap_table.j2` - is a template that should be included (`Jinja %include directive`) in pages where will be used [Bootstrap Table](https://bootstrap-table.com/)- [see file here](/templates/base/bootstrap_table.j2)

Usage of this layout can be accomplished by including in pages rendered the following line at page beginning:
`{% extends "base/_base01_jinja.html" %}`

**Top navigation bar remarks:**

* it is always rendered as *horizontal with fixed position*
* construction of top navbar is fully compliant and follow Bootstrap 3 specs
* leaf entries can be constructed manually or using `menu_lib.j2` helper
* non leaf entries should be manually constructed

**CSS included / used in page development kit:**

* Bootstrap 3
* a separated *css file* that is last rendered (to have priority over Bootstrap) 
and is designed to apply company own styles - file is [`/static/css/salis.css`](/static/css/salis.css)



# Special considerations

Always must be aware that this system is a client - server one (web application) so all executions takes place:

* when server application is started and initialize routine (`sys_core`) is executed
* on a thread at a timer request
* on a route when client make a request

In all other situations the server application **is not active** (it is in wait state), so no application relevant code is executed.
All application has an asynchronous behavior and should be aware that the **do not know WHEN things are happening** Iis not a sequence).

Another aspect is the **multi client (aka multi user)** behavior. In a route **do not know** how many clients was requested it and how many "*execute in parallel*.
Is important to avoid GLOBAL things or use them with CARE and "knowing what you're doing". This is a classical problem of synchronization in asynchronous systems.




--- ooo ---
