<small>*(c) 2022, 2023 RENware Software Systems*</small>

**cosana**    
***Comprehensive Sales Analysis & Review***

[PDF VERSION](/download{{ request.path }})

<small>

* Version: 0.11.0
* Last update: 230327
</small>

***

[TOC]

# CHANGELOG

<small>With (F) are marked those entries that are **FEATURES** so should be highlighted on *Release Note* documents.</small>    
<small>With (B) are marked those entries that are **BUG FIXES** so should be highlighted on *Release Note* documents.</small>


## 0.11.0 - ARE Account Review and Evaluation and Data history features

### 073.wip

* wip...
* ...reference... graphical data proposal is to use [`mathplot`](https://matplotlib.org/), for [dates axis see](https://www.tutorialspoint.com/how-to-show-date-and-time-on-the-x-axis-in-matplotlib), also [quick examples on w3schools](https://www.w3schools.com/python/matplotlib_getting_started.asp)

* tbd... set each HTML ARE page with 3 `img` tags and src as `url_for(...)` and design route to return file with `send_from_directory(..., file=...)`
* tbd... summary info at beginning of eah ARE domain: score current of maxim, last update of domain (max, regardless of details and structure of database info)

* tdb_230327(1)... convert last update date to local time (left a comment and a clickable badge in ads_general_data)

* 230327piu_c ARE `general_data` bss domain - *summary zone* preserved `_updated_at` field and send formatted date in `fmt_updated_at`, both as UTC time zone
* 230327piu_b ARE `general_data` bss domain - *summary zone* convert last updated date to a more readable humanized format
* 230327piu_a ARE `general_data` bss domain - get *summary zone* data: last updated date and score info
* 230326piu_c updated skeleton for `are_general_data.html` page with *charts data* placeholders; made actions plan as comments in `are_main.py`
* 230326piu_b made skeleton for `are_general_data.html` page with *summary data* and *charts data* - need to be populated
* 230326piu_a cleaned ADS start page for fixed "FIXME sections"


### 072.alpha (230326 05:30)

* 230325piu_d *skeleton* for route to return file with `send_from_directory(..., file=...)`:
    * location `are\are_main.py`
    * view function code-name: `are_chart`
    * route name: `/are_chart/<busines_domain>/<chart_type>` where chart type is one of those specified in [ads README specs](ads/README_ads.md)
    * update [ads README specs](ads/README_ads.md)
* 230325piu_c create empty templates for all `are_bss...dom.html`
* 230325piu_b `are_start_page` organize and base layout of ARE start page
* 230325piu_a archived 0.10.0 pre-release version
* 230324piu_c defined specs for ARE start page


### 071.alpha (230324 0730)

* 230324piu_b init component **ARE - Account Review and Evaluation**, published on *top menu bar* and in *Sales Projects administration page* (ARE button)
* 230324piu_a review and update [ROADMAP](/OPEN_ISSUES_ROADMAP.md)
* 230323piu_b Data history feature:
    * [x] 1. prepare project environment with required packages (SQLAlchemy Continuum) ==> `requirements.txt` and `810_DSGN/820.90_Toolstack_notes.md` updated
    * [x] 2. activate in system init chain (`sys_core/init_system.py`) history objects creation
    * [x] 3. use history in following objects: ads_general_data_data_models, ads_decision_criteria_data_models, ads_evaluation_data_models, ads_org_map_data_models, ads_relationships_data_models, ads_revenue_data_models, ads_solution_data_models; update & generate a fresh database
    * [x] 4. close OPISS.004, test and release feature
* (B) 230323piu_a fixed `ads_revenue.html` business domain UI to display `Updated by... at...` field (corrected `_updated_by` & `_updated_at` fields id)
* 230322piu_a `crud_data_admin_main` component: review and updated roadmap RMAP.001, RMAP.002, cleaned obsolete objectives code and comments
* 230321piu_b archived version 0.9.0
* 230321piu_a publish 01.10.0-070.re-release on test-development server
















# Older versions

## 0.10 releases

* [0.10.0 pre-release `ads` ADS scoring](/versions_history/CHANGELOG_0.10.0.md)

## 0.2 to 0.9 releases (only beta)

* [0.9.0 `ads` ADS Decision criteria business domain](/versions_history/CHANGELOG_0.9.0.md)
* [0.8.0 `ads` ADS Solution business domain](/versions_history/CHANGELOG_0.8.0.md)
* [0.7.0 `ads` ADS Relationships Approach business domain](/versions_history/CHANGELOG_0.7.0.md)
* [0.6.0 `ads` Revenue business domain](/versions_history/CHANGELOG_0.6.0.md)
* [0.5.1 `ads` Organization map business domain (bug fixes)](/versions_history/CHANGELOG_0.5.1.md)
* [0.5.0 `ads` Organization map business domain](/versions_history/CHANGELOG_0.5.0.md)
* [0.4.0 `ads` Evaluation business domain](/versions_history/CHANGELOG_0.4.0.md)
* [0.3.0 `ads` Evaluation business domain - DB level](/versions_history/CHANGELOG_0.3.0.md)
* [0.2.0 `ads` General data business domain](/versions_history/CHANGELOG_0.2.0.md)

## 0.0 to 0.1 releases (only beta)

* [0.1.1](/versions_history/CHANGELOG_0.1.1.md), [0.1.0](/versions_history/CHANGELOG_0.1.0.md), [0.0.5](/versions_history/CHANGELOG_0.0.5.md), [0.0.4](/versions_history/CHANGELOG_0.0.4.md), [0.0.3](/versions_history/CHANGELOG_0.0.3.md), [0.0.2](/versions_history/CHANGELOG_0.0.2.md), [0.0.1](/versions_history/CHANGELOG_0.0.1.md), [0.0.0](/versions_history/CHANGELOG_0.0.0.md)


## Notes

<small>

* Older versions are available in `/versions_history`
* versions suffixed by `(PRS)` in list are **pre-release** versions
* 
</small>





--- ooo ---
