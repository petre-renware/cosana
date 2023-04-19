<small>*(c) 2022, 2023 RENware Software Systems*</small>

**cosana**    
***Comprehensive Sales Analysis & Review***

[PDF VERSION](/download{{ request.path }})

[TOC]

# CHANGELOG v0.10.0 ADS scoring

<small>With (F) are marked those entries that are **FEATURES** so should be highlighted on *Release Note* documents.</small>    
<small>With (B) are marked those entries that are **BUG FIXES** so should be highlighted on *Release Note* documents.</small>

## 0.10.0 - ADS scoring (roadmap RMAP.003)

### 070.pre_release (230320 22:00)

* 230320piu_c review and cleanup code
* 230320piu_b set "real" SCORE (in `/data_models/ads_bss...domain_data_models.py`, property - function `score(self)` set all things locally and updated maximum calculation where exists LOV data in corresponding code-file) for following business domains:
    * [x] --(already done in `230312piu_b`) General data - code-files: `ads_general_data_data_models`
    * [x] --(already done in `230318piu_d`) Evaluation - code-files: `ads_evaluation_data_models`, `ads_evaluation_lov_models`
    * [x] --(already done in `230315piu_c`) Organization map - code-files: `ads_org_map_data_models`
    * [x] --(already done in `230312piu_b`) Revenue - code-files: `ads_revenue_data_models`
    * [x] --(already done in `220317piu_b & 220317piu_c`) Relationship approach - code-files: `ads_relationships_data_models`, `ads_relationships_lov_models`
    * [x] --(already done in `230318piu_c`) Solution - code-files: `ads_solution_data_models`, `ads_solution_lov_models`
    * [x] Decision criteria - code-files: `ads_decision_criteria_data_models`, `ads_decision_criteria_lov_models`
* 230320piu_a defined 8Decision criteria* business domain specs in [ADS README specs](ads/README_ads.md)
* 230319piu_b `crud_data_admin` component. updated to HIDE columns like `ads_*` because they decreases visibility of relevant data; they still sre "instructed" to show an `*` where respective business domain contains information until displayed name will be solved / fixed when potentially could be used
* 230319piu_a `data_models\ads_evaluation_lov_models.py` calculate max achievable score from structure, closed all FIXME(s), updated data_models README specs
* 230318piu_d set "real" SCORE (in `/data_models/ads_bss...domain_data_models.py`, property - function `score(self)` set all things locally and updated maximum calculation where exists LOV data in corresponding code-file) for following business domains:
    * [x] --(already done in `230312piu_b`) General data - code-files: `ads_general_data_data_models`
    * [x] Evaluation - code-files: `ads_evaluation_data_models`, `ads_evaluation_lov_models`
    * [x] --(already done in `230315piu_c`) Organization map - code-files: `ads_org_map_data_models`
    * [x] --(already done in `230312piu_b`) Revenue - code-files: `ads_revenue_data_models`
    * [x] --(already done in `220317piu_b & 220317piu_c`) Relationship approach - code-files: `ads_relationships_data_models`, `ads_relationships_lov_models`
    * [x] --(already done in `230318piu_c`) Solution - code-files: `ads_solution_data_models`, `ads_solution_lov_models`
    * [ ] Decision criteria - code-files: `ads_decision_criteria_data_models`, `ads_decision_criteria_lov_models`


### 069.alpha (230318 05:00)

* 230318piu_c set "real" SCORE (in `/data_models/ads_bss...domain_data_models.py`, property - function `score(self)` set all things locally and updated maximum calculation where exists LOV data in corresponding code-file) for following business domains:
    * [x] --(already done in `230312piu_b`) General data - code-files: `ads_general_data_data_models`
    * [ ] Evaluation - code-files: `ads_evaluation_data_models`, `ads_evaluation_lov_models`
    * [x] --(already done in `230315piu_c`) Organization map - code-files: `ads_org_map_data_models`
    * [x] --(already done in `230312piu_b`) Revenue - code-files: `ads_revenue_data_models`
    * [x] --(already done in `220317piu_b & 220317piu_c`) Relationship approach - code-files: `ads_relationships_data_models`, `ads_relationships_lov_models`
    * [x] Solution - code-files: `ads_solution_data_models`, `ads_solution_lov_models`
    * [ ] Decision criteria - code-files: `ads_decision_criteria_data_models`, `ads_decision_criteria_lov_models`
* 230318piu_b ADS Review UI updated default values for score (progress) for domains where no data entered exist yet to `current score = 0` and `max score = 'n/a'`
* 230318piu_a defined *Solution* scoring model and specifications in [ADS README specs](ads/README_ads.md)
* (F) 2203piu_17_c FIXED Relationship approach score calculation and closed OPISS.007 - ADS scoring for Relationships approach
* (B) 220317piu_b set "real" SCORE (in `/data_models/ads_bss...domain_data_models.py`, property - function `score(self)` set all things locally and updated maximum calculation where exists LOV data in corresponding code-file) for following business domains:
    * [x] --(already done in `230312piu_b`) General data - code-files: `ads_general_data_data_models`
    * [ ] Evaluation - code-files: `ads_evaluation_data_models`, `ads_evaluation_lov_models`
    * [x] --(already done in `230315piu_c`) Organization map - code-files: `ads_org_map_data_models`
    * [x] --(already done in `230312piu_b`) Revenue - code-files: `ads_revenue_data_models`
    * [x] Relationship approach - code-files: `ads_relationships_data_models`, `ads_relationships_lov_models` (with issues - see also *OPISS.007 - ADS scoring for Relationships approach*)
    * [ ] Solution - code-files: `ads_solution_data_models`, `ads_solution_lov_models`
    * [ ] Decision criteria - code-files: `ads_decision_criteria_data_models`, `ads_decision_criteria_lov_models`
* 230317piu_a defined *Relationship approach* scoring model and specifications in [ADS README specs](ads/README_ads.md)


### 068.alpha (230315 14:00)

* 230315piu_c set "real" SCORE (in `/data_models/ads_bss...domain_data_models.py`, property - function `score(self)` set all things locally and updated maximum calculation where exists LOV data in corresponding code-file) for following business domains:
    * [x] --(already done in `230312piu_b`) General data - code-files: `ads_general_data_data_models`
    * [ ] Evaluation - code-files: `ads_evaluation_data_models`, `ads_evaluation_lov_models`
    * [x] Organization map - code-files: `ads_org_map_data_models`
    * [x] --(already done in `230312piu_b`) Revenue - code-files: `ads_revenue_data_models`
    * [ ] Relationship approach - code-files: `ads_relationships_data_models`, `ads_relationships_lov_models`
    * [ ] Solution - code-files: `ads_solution_data_models`, `ads_solution_lov_models`
    * [ ] Decision criteria - code-files: `ads_decision_criteria_data_models`, `ads_decision_criteria_lov_models`
* 230315piu_b defined `data_models/ads_org_map_lov_models.py` to accommodate in some scoring elements (MAX limits for each qualifier)
* 230315piu_a defined an *EMPTY* function to load system configurable data models at run time: `/sys_core/load_system_configurable_elements.py` (basically load / reload LOV components) - intention is for RMAP.008 - System configuration functionality
* 230314piu_b updated [ads README specs](ads/README_ads.md) ref maximum limits and calculation algorithm *SCORE calculation for *Organization map* business domain; updated code with detailed max limits (in `data ads_org_map_data_models`)
* 230314piu_a updated [ads README specs](ads/README_ads.md) ref *SCORE calculation for *Organization map* business domain
* 230313piu_a updated [ads README specs](ads/README_ads.md) ref *SCORE calculation and primary locations* where is generated for all business domain
* 230312piu_b set "real" SCORE (in `/data_models/ads_bss...domain_data_models.py`, property - function `score(self)` set all things locally and updated maximum calculation where exists LOV data in corresponding code-file) for following business domains:
    * [x] General data - code-files: `ads_general_data_data_models`
    * [ ] Evaluation - code-files: `ads_evaluation_data_models`, `ads_evaluation_lov_models`
    * [ ] Organization map - code-files: `ads_org_map_data_models`
    * [x] Revenue - code-files: `ads_revenue_data_models`
    * [ ] Relationship approach - code-files: `ads_relationships_data_models`, `ads_relationships_lov_models`
    * [ ] Solution - code-files: `ads_solution_data_models`, `ads_solution_lov_models`
    * [ ] Decision criteria - code-files: `ads_decision_criteria_data_models`, `ads_decision_criteria_lov_models`
* 230312piu_a `ads_start_page.html` load score from database at the end of each domain loading functions `get_ads_...bss domain...(sales_project_pk)`
* 230311piu_b review all `ads_*` data models and update property `score(self)` to return 2 numbers: *current* score and *max possible score* update ads and data models README specs. New **score** structure will be as follows (here are default / not calculated values):
    ```
    "score" = {
        "crt_score": 111111,
        "max_score": 999999,
    }
    ```
* 230311piu_a prepare as draft the SCORE zones, layout and id(s) coding conventions in `ads_start_page.html`;updated `ads/README_ads.md` specs doc ref section dedicated to *Scoring* process
* 230310piu_d update code for "TODO" places to color differentiate them of "FIXME" ones (TODO set in orange), archived version 0.8.0






--- ooo ---
