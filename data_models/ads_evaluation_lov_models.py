#
# (c) 2023 RENware Software Systems
# cosana system
#
# ========================
# ADS Evaluation
#
import json
import os
import sys


#
# LOVs data structure(s)
# ========================
""" data structure description:
- overall model: dict_0(dict_1(tuple_2(tuple_3()))) ---note--- number after uderscore represents the logocal level of structure
- `tuple_3 is the final structure that is "operable" in UI and contains `(code, text, score)`, where:
    - `code` is the code of response item from selector
    - `text` is the UI visibe text of response item from selector
    - `score` is the score of chosen response item from selector
- levels description:
    - level 0 - is the hole LOV dedicated to ads_evaluation (exists for conformity and simplicity & clarity in Jinja template)
    - level 1 (dict item key) - evaluation group - these are visual groups on UI
    - level 2 (tuple item) - evaluation selectors - these are combo boxes on UI containing:
            name-of-selector = (code `CHAR(10)`, text `String`, score `SmallInt`)
- group names that will be displayed are hard coded (basically being identical with code-names without underscores and converted to title())
- WARNING: DO NOT MANUALLY DROP CODES - THEY ARE USED AS REFERENCE TO GET SCORES - JUST SET NEW ONES
"""
lov_ads_evaluation = dict(

    opportunity_realism=dict( # MAX SCORE = 7
        label="Evaluation of opportunity realism",
        _final_applicability=(  # *--- (A.1) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("A_001_001", "I do not know", 0),
            ("A_001_002", "Undefined or not clear", 0),
            ("A_001_003", "Defined and clear", 1)
        ),
        _customer_business=(  # *--- (A.2) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("A_002_001", "I do not know", 0),
            ("A_002_002", "Business is going BADLY", 1),
            ("A_002_003", "Business is going WELL", 2),
        ),
        _customer_financials=(  # *--- (A.3) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("A_003_001", "I do not know", 0),
            ("A_003_002", "Poor to bad", 1),
            ("A_003_003", "Good to very good", 2),
        ),
        _access_to_funds=(  # *--- (A.4) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("A_004_001", "No or I do not know", 0),
            ("A_004_002", "Yes", 1),
        ),
        _decisive_event=(  # *--- (A.5) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("A_005_001", "I do not know", 0),
            ("A_005_002", "Not or poor defined", 0),
            ("A_005_003", "Clear and good defined", 1),
        )
    ),

    compete_capability=dict( # MAX SCORE = 9
        label="Evaluation of capability to compete for sales project",
        _formal_decision_making_criteria=(  # *--- (B.6) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("B_006_001", "I do not know or NOT defined", 0),
            ("B_006_002", "Poor defined", 1),
            ("B_006_003", "Clear and good defined", 2),
        ),
        _solution_matching=(  # *--- (B.7) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("B_007_001", "I do not know", 0),
            ("B_007_002", "Poor matching", 1),
            ("B_007_003", "Good matching", 2),
        ),
        _resources_required_to_sell=(  # *--- (B.8) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("B_008_001", "I do not know", 0),
            ("B_008_002", "Many", 1),
            ("B_008_003", "Few", 2),
        ),
        _current_relation_with_customer=(  # *--- (B.9) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("B_009_001", "Bad to poor", 0),
            ("B_009_002", "Good to very good", 1)
        ),
        _value_of_business_proposal=(  # *--- (B.10) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("B_010_001", "I do not know", 0),
            ("B_010_002", "Weak", 1),
            ("B_010_003", "Strong", 2),
        )
    ),

    win_capability=dict( # MAX SCORE = 11
        label="Evaluation of capability to win sales project",
        _internal_support=(  # *--- (C.11) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("C_011_001", "I do not know", 0),
            ("C_011_002", "Weak", 1),
            ("C_011_003", "Strong", 2),
        ),
        _credibility=(  # *--- (C.12) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("C_012_001", "I do not know", 0),
            ("C_012_002", "Weak", 1),
            ("C_012_003", "Strong", 2),
        ),
        _cultural_compatibility=(  # *--- (C.13) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("C_013_001", "I do not know or NONE", 0),
            ("C_013_002", "Not fit or small fit", 1),
            ("C_013_003", "Good to strong fit", 2),
        ),
        _approach_decision_making_criteria=(  # *--- (C.14) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("C_014_001", "I do not know or TOO FAR AWAY of them", 0),
            ("C_014_002", "AWARE of them", 1),
            ("C_014_003", "Achievable", 2),
        ),
        _political_aspects=(  # *--- (C.15) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("C_015_001", "No incluence or I do not know", 0),
            ("C_015_002", "Enough influence", 1),
            ("C_015_003", "Not applicable", 3),
        )
    ),

    win_worth=dict(  # MAX SCORE = 10
        label="Evaluation of win worth",
        _short_term_revenue=(  # *--- (D.16) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("D_016_001", "Not yet calculated", 0),
            ("D_016_002", "Too small", 1),
            ("D_016_003", "Big enough", 2),
        ),
        _long_term_revenue=(  # *--- (D.17) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("D_017_001", "Not yet calculated", 0),
            ("D_017_002", "Too small", 1),
            ("D_017_003", "Big enough", 2),
        ),
        _profitability=(  # *--- (D.18) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("D_018_001", "Not yet calculated", 0),
            ("D_018_002", "Too small", 1),
            ("D_018_003", "Big enough", 2),
        ),
        _risk=(  # *--- (D.19) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("D_019_001", "Not yet calculated", 0),
            ("D_019_002", "Too small", 1),
            ("D_019_003", "Big enough", 2),
        ),
        _strategical_value=(  # *--- (D.20) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
            ("D_020_001", "No, the account is not s important", 0),
            ("D_020_002", "Yes, the account is important", 1),
            ("D_020_003", "Yes, the account is CRITICAL", 2)
        )
    ),

)


#
# LOVs helpers
# ========================

def get_lov_list_of_codes(item_group, evaluation_selector):
    """ Return tuple with all posaible codes for a selector
    Parameters:
    ===========
        - item_group: string - level 1, GROUP of avaluattion criteria
        - evaluation_selector: string - the evaluation SELECTOR for list of possible codes
    Return:
    ===========
        - tuple with all evaluation_selector possible codes
    """
    _items_list = lov_ads_evaluation[item_group].get(evaluation_selector)
    _ret_list = [item_tuple[0]
                 for item_tuple in _items_list]  # element[0] is code
    return tuple(_ret_list)


def get_lov_list_of_tuples(item_group, evaluation_selector):
    """ Return all tuples for a selector
    Parameters:
    ===========
        - item_group: string - level 1, GROUP of evaluation criteria
        - evaluation_selector: string - the evaluation SELECTOR for list of possible codes
    Return:
    ===========
        - tuple with all tuples for a selector
    """
    _items_list = lov_ads_evaluation[item_group].get(evaluation_selector)
    return tuple(_items_list)


def get_lov_selector_item_score(item_group, evaluation_selector, evaluation_code):
    """ Return score for a chosen value of a selector
    Parameters:
    ===========
        - item_group: string - level 1, GROUP of evaluation criteria
        - evaluation_selector: string - the evaluation SELECTOR for list of possible codes
        - evaluation_code: string - the evaluation code selected from UI selection list
    Return:
    ===========
        - score
    """
    _item_tuples_of_selectors = lov_ads_evaluation[item_group][
        evaluation_selector]  # here evaluation_item_code tuple
    _ret_score = None
    for _elem in _item_tuples_of_selectors:  # search for code of desired ietm
        if _elem[0] == evaluation_code:
            _ret_score = _elem[2]  # index [2] is score
            break
    return _ret_score


def get_lov_selector_item_text(item_group, evaluation_selector, evaluation_code):
    """ Return text for a chosen value of a selector
    Parameters:
    ===========
        - item_group: string - level 1, GROUP of evaluation criteria
        - evaluation_selector: string - the evaluation SELECTOR for list of possible codes
        - evaluation_code: string - the evaluation code selected from UI selection list
    Return:
    ===========
        - score
    """
    _item_tuples_of_selectors = lov_ads_evaluation[item_group][
        evaluation_selector]  # here evaluation_item_code tuple
    _ret_text = None
    for _elem in _item_tuples_of_selectors:  # search for code of desired ietm
        if _elem[0] == evaluation_code:
            _ret_text = _elem[1]  # index [1] is text
            break
    return _ret_text


def get_lov_group_label(item_group):
    """ Return group label
    Parameters:
    ===========
        - item_group: string - level 1, GROUP of evaluation criteria
    Return:
    ===========
        - label of specified group or 'ERR: Not known group ...name_of_group...'
    """
    _tmp = None
    try:
        # here result a list with all possible tuple of values
        _tmp = lov_ads_evaluation[item_group]['label']
    except:
        _tmp = None
    return _tmp if _tmp else 'ERR: Not known group ' + item_group


def get_max_achievable_score():
    """ Return total MAXIMUM achievable score for total STRUCTURE
    """
    _score_of_total_structure = 0
    _prev_max_of_selectors = 0
    for _group_items in lov_ads_evaluation:
        for _item_group_k, _item_group_v in lov_ads_evaluation[_group_items].items():
            # consider only tuples or other composed structures, but not strings
            _prev_max_of_selectors = 0
            if type(_item_group_v) == tuple:
                for _item_selector_values in _item_group_v:
                    # here __item_selctor_values is a tuple of SELECTOR as: (code, text, score)
                    _prev_max_of_selectors = max(_prev_max_of_selectors, _item_selector_values[2])
            _score_of_total_structure += _prev_max_of_selectors
    return _score_of_total_structure








