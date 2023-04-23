<small>*(c) 2022, 2023 RENware Software Systems*</small>

**cosana**    
***Comprehensive Sales Analysis & Review***

[PDF VERSION](/download{{ request.path }})

<small>

* Version: 0.12.0
* Last update: 230423
</small>

***

[TOC]

# CHANGELOG

<small>With (F) are marked those entries that are **FEATURES** so should be highlighted on *Release Note* documents.</small>    
<small>With (B) are marked those entries that are **BUG FIXES** so should be highlighted on *Release Note* documents.</small>


## 0.12.0 - `are` details and charts

### 077.wip

* wip... --- [ ASAP ACTION PLAN: ]-------------------------------------------------------------

* tbd... consider RMAP.010 - Report with all ADS current data

* tbd... ARE generating charts route - get real data directly from history table `ads_general_data_version` (pls `see are_main.py` comment ref object name and check WHAT detail object is accessed or is enough main object as it could have all score history in `score` property by accessing corresponding historical records from details)

* tbd... all bss domains data models create a method to return *historical score* starting from current data back to `last_no_of_days` ar all. PROPOSALS:
    * `last_no_of_days` is optional parameter for `None` value returning all history;
    * to move all calculation in a separated method written in `ads...data_model` getting at least `sales_project_FK` as parameter
    * tracking implementation:
        * [ ] decision criteria
        * [ ] evaluation
        * [ ] general data
        * [ ] org_map
        * [ ] relationships
        * [ ] revenue
        * [ ] solution


* wip... 230423piu_a update all ORM data models - methods `score()` to calculate the % score EXACTLY as did in `are/are_main.py` - refactor `are_main.py` to use new calculation:
    * [x] 1. decision criteria
    * [x] 2. evaluation
    * [x] 3. general data
    * [x] 4. org_map
    * [x] 5. relationships
    * [ ] 6. revenue
    * [ ] 7. solution

* (B) 230419piu_d `salesproject_data_models.py` fixed `to_dict()` method to return right data for `ads_evaluation` key (was returning a duplicate of `ads_general_data`)
* 230419piu_c `are_start_page.html`, *Summary of Sales Project Scores* area, color progress bars to highlight those over 100% (in green)


### 076.alpha (230419 06:00)

* 230419piu_b archived v0.11.0 version
* 230419piu_a `are_start_page.html` make an overview section with all bss domains scores overview called *Summary of Sales Project Scores*
    * [x] (230418piu_a) a- made basic layout
    * [x] b- send in `are_main.py` necessary Jinja variables
    * [x] c- replicate % of progress calculation (`are_main.py`) and populate *Summary of Sales Project Scores* section
* 240417piu_b `are_start_page.html` show 'NO ADS INFO' when date is different than `'' empty string` for all business domains (general_data, decision_criteria, evaluation, org_map, relationships, revenue, solution)
* (B) 230417piu_a fix OPISS.008 - bug @ ARE main page loader, no ADS data in a business domain
    * [x] step 1 - make a solve plan in file `/are/are_main.py` (closed at/by 230411piu_a)
    * [x] step 2 - solve bug for first bss domain, as order in code, just for test
    * [x] step 3 - generalize for all bss domains
* 230410piu_a ARE start page redirect to Sales Project choose in case sent PK does not exists (location: `are_main.py`)
* 230409piu_a update chart generator function `are_chart(business_domain, chart_type)` (module `are/are_main.py`, route: `'/are_chart/<business_domain>/<chart_type>'`) to generate unique image files with auto removing after usage


### 075.alpha (230406 04:00)

* 230404piu_a all `before_flush` events at `ads_*` details level(s) does not trigger parent history for INSERT operation
    * [x] decision criteria
    * [x] evaluation - NOT APPLICABLE
    * [x] general data - NOT APPLICABLE
    * [x] org_map
    * [x] relationships
    * [x] revenue - NOT APPLICABLE
    * [x] solution
* 230403piu_a all `before_flush` events at `ads_*` details level(s) does not trigger parent history for DELETE operation
    * [x] decision criteria
    * [x] evaluation - NOT APPLICABLE
    * [x] general data - NOT APPLICABLE
    * [x] org_map
    * [x] relationships
    * [x] revenue - NOT APPLICABLE
    * [x] solution
* 230402piu_a `ads data models` for each detail tables update `_useless_to_keep_history` ***ONLY at `ads` parent level*** to force versioning component to generate history line and update audit fields - implementation tried by capturing `before_flush` events at each ORM class object level. Made for:
    * [x] decision criteria
    * [x] evaluation - NOT APPLICABLE
    * [x] general data - NOT APPLICABLE
    * [x] org_map
    * [x] relationships
    * [x] revenue - NOT APPLICABLE
    * [x] solution
* 230331piu_a `base_keys_data_models.py` add field `_useless_to_keep_history: bool, optional no default` just usable to set and keep history at ADS level tables - usage: at each detail change, set it as `set _useless_to_keep_history = not _useless_to_keep_history` to force versioning component to save history















# Older versions

## 0.10 to 0.11 releases

* [0.11.0 ***beta*** Data history features & ARE summary zone](/versions_history/CHANGELOG_0.11.0.md)
* [0.10.0 ***pre_release*** `ads` ADS scoring](/versions_history/CHANGELOG_0.10.0.md)

## 0.2 to 0.9 releases

* [0.9.0 ***beta*** `ads` ADS Decision criteria business domain](/versions_history/CHANGELOG_0.9.0.md)
* [0.8.0 ***beta*** `ads` ADS Solution business domain](/versions_history/CHANGELOG_0.8.0.md)
* [0.7.0 ***beta*** `ads` ADS Relationships Approach business domain](/versions_history/CHANGELOG_0.7.0.md)
* [0.6.0 ***beta*** `ads` Revenue business domain](/versions_history/CHANGELOG_0.6.0.md)
* [0.5.1 ***beta*** `ads` Organization map business domain (bug fixes)](/versions_history/CHANGELOG_0.5.1.md)
* [0.5.0 ***beta*** `ads` Organization map business domain](/versions_history/CHANGELOG_0.5.0.md)
* [0.4.0 ***beta*** `ads` Evaluation business domain](/versions_history/CHANGELOG_0.4.0.md)
* [0.3.0 ***beta*** `ads` Evaluation business domain - DB level](/versions_history/CHANGELOG_0.3.0.md)
* [0.2.0 ***beta*** `ads` General data business domain](/versions_history/CHANGELOG_0.2.0.md)

## 0.0 to 0.1 releases (only ***beta***)

* [0.1.1](/versions_history/CHANGELOG_0.1.1.md), [0.1.0](/versions_history/CHANGELOG_0.1.0.md), [0.0.5](/versions_history/CHANGELOG_0.0.5.md), [0.0.4](/versions_history/CHANGELOG_0.0.4.md), [0.0.3](/versions_history/CHANGELOG_0.0.3.md), [0.0.2](/versions_history/CHANGELOG_0.0.2.md), [0.0.1](/versions_history/CHANGELOG_0.0.1.md), [0.0.0](/versions_history/CHANGELOG_0.0.0.md)


## Notes

<small>

* Older versions are available in `/versions_history`
* versions suffixed by `(PRS)` in list are **pre_release** versions
* 
</small>





--- ooo ---
