<small>*(c) 2022 RENware Software Systems*</small>

**cosana**    
***Comprehensive Sales Analysis & Review***

[PDF VERSION](/download{{ request.path }})

***

[TOC]

# CHANGELOG v0.0.0

<small>With (F) are marked those entries that are **FEATURES** so should be highlighted on *Release Note* documents.</small>    
<small>With (B) are marked those entries that are **BUG FIXES** so should be highlighted on *Release Note* documents.</small>

## 0.0.0

### 009.beta (221209 06:00)

* 221209piu_e created menus (top navbar) for:
    * master data administration (CRUD)
    * master data import
* 221209piu_d separated technical documentation from system administration documentation
* 221209piu_c
    * facelift for index and documentation
    * refactored location and loading order of template CSS styles
* 221209piu_b
    * created top menu entry for *Data healthcheck* for latter use
    * created component **health check** for future implementation (just location and README specs doc and listed in all tech docs)
* 221209piu_a made top navbar fixed on top
* 221208piu_f
    * *Master data* model review and establish relationships
    * created full database script

### 008.alpha (221208 08:00)

* 221208piu_e created *Company* and *Solution* in `data_models/master_data_model.py`
* 221208piu_d refactored data model BaseModel set updated_by audit column to 100 chars
* 221208piu_c created *SalesProjects* object in `data_models/master_data_model.py` as draft first version
* 221208piu_b reorganized top menu (facelift)
* 221208piu_a updated data_models specs in component README doc
* 221207piu_f installed `pendulum` library and updated system environment
* 221207piu_e add top navbar menu entry for *Sales Accounts > Accounts Review Board*

### 007.alpha (221207 07:00)

* 221207piu_d created 810_Design_index document and updated *adma index*
* 221207piu_c updated data models README specs doc
* 221207piu_b closed *810.03 System Data* as an acceptable version to start data models
* 221207piu_a updated *810.03 System Data* doc ref ADS content and decided that this system have *no Tenant*
* 221206piu_d work on Tenant prevent deletion - made some comments to help latter
* 221206piu_c introduced [Bootstrap Table extension](https://bootstrap-table.com/), updated all technical documents, make a route for various test `/test_something`

### 006.alpha (221206 02:30)

* 221206piu_b created data object **Tenant**
* 221206piu_a created `data_models/base_keys_data_models.py` as Mixin usable for mandatory system objects keys (`_pk` and `_tenant_id`); created first system database (SQLite physical)
* 221205piu_c installed `python-dotenv` package to be able to run Flask Migrate component as flask CLI (`flask db ...`)
* 111205piu_b updated main README ref SQL Alchemy database engine supported reference
* 221205piu_a updated strategy regarding system data approach; updated doc `810_DSGN/810.03_System_Data.md`
* 221204piu_c installed Flask Migrate as SQLAlchemy support in database migration on various DB systems (MariaDB, PostGRE); updated environment requirements
* 221204piu_a updated *adma index* ref data_models
* 221204piu_a created a sample `data_models` file for latter processing (got from other project as agnostic to flask db model)

### 005.alpha (221203 09:00)

* 221203piu_c created and initialized `db_sys`  component; updated all ref & technical documents
* 221203piu_b initialized db_scripts directory with its own README_db_scripts.md included (short explanations)
* 221203piu_a minor changes (cleanups) in *adma index document*
* 221202piu_e created *810.02 System Landscape* document as initial version (which will be maintained on an incremental development process); update adma index
* 221202piu_d updated 810.03 System Data with list of entities / business objects
* 221202piu_c updated requirements for SQLAlchemy and Flask SQLAlchemy

### 004.alpha (221202 09:30)

* 221202piu_b small facelift on index page to change sizing
* 221202piu_a created *130.04 Editions Licensing Pricing* and referenced in adma index
* 221201piu_j updated main README with user interface and integration features
* 221201piu_i started data design in *810.03 System Data*; updated *adma* index
* 221201piu_h updated index page dropped references to technical documentation
* 221201piu_g add administration and technical documentation on menu: Help -> stem administration
* 221201piu_f created directory `adma` and an index doc for technical documentation

### 003.alpha (221201 07:10)

* 221201piu_e created `config.py` for `APP_ROOT` at this moment and the other settings are as drafts
* 221201piu_d install `doc_viewer` component -- OK. runs but in Widows environment installation of `weasyprint` is really a big challenge
* 221201piu_c installed in project environment: `Brotli` (1.0.9) and `cffi`
* 221201piu_b updated base templates to include cosana and RENware logo pictures
* 221201piu_a uploaded RENware logo picture in `static/pictures`
* 221130piu_g created product logo and uploaded as `static/pictures/cosana.jpg`
* 221130piu_f uploaded (in `100_ANA`) existing (pictures of hard copy) Account Data Sheet oh "Complex Sales" training

### 002.alpha (221130 07:00)

* 221130piu_e populated top navbar with menu as described @this moment (draft) and text "wip..." inside
* 221130piu_d created top navbar with samples / tested and adjusted all required Bootstrap & jquery components
* 221130piu_c switched to local Bootstrap to avoid internet dependency
* 221130piu_b copied Bootstrap 4,6,2 locally (on `/static/bootstrap...` directory)
* 221130piu_a changed Bootstrap 4.6 instead of 5.x version which dows not suppor IE line of browsers (just Edge) and solution is intended to have backward compatibility un to Windows 7

### 001.alpha (221129 20:30)

* 221129piu_f made a simple `templates/base/...` set of templates usable in most pages
* 221129piu_e updated main README file
* 221129piu_d created main routes keep basic ones: /, /whoami & /wip
* 221129piu_c created environment for windows and first `requirements.txt`
* 221129piu_b created first Flask working and running environment: `init_portal.py -> app_portal`; initialized in `sys_core` and started in `main.py`
* 221129piu_a created `/templates` and `/static` directories as empty locations to right initialize Flask app
* 221128piu_f replicate app_portal component; updated component README
* 221128piu_e setup & tested `Commons` component
* 221128piu_d created  admin zone for "a happy :)" deployment (setup & euma components)
* 221128piu_c created first sys_core system initializer directory
* 221128piu_b created a project management area for specific purposes (roght now to start collect spent effort)
* 221128piu_a created a raw basic environment: libutil, setup and data components
* 221127piu_a established project main / fundamental basic objectives






--- ooo ---
