#
# (c) 2023 RENware Software Systems
# cosana system
#
# ========================
# ADS Solution
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
    - color is a color associated with an indicator ref selected item
- WARNING: DO NOT MANUALLY DROP CODES - THEY ARE USED AS REFERENCE TO GET SCORES - JUST SET NEW ONES
"""
lov_ads_solution = {
    "strength": {
        "label": "Strength",
        "selector_data": [
            {
                "code": "Strong",
                "text": "Strong",
                "score": 10,
                "color": "green"
            },
            {
                "code": "Weak",
                "text": "Weak",
                "score": 0,
                "color": "red"
            },
        ]
    },

    "feature_type": {
        "label": "Type",
        "selector_data": [
            {
                "code": "Benefit",
                "text": "Benefit",
                "score": 20,
                "color": "green"
            },
            {
                "code": "Advantage",
                "text": "Advantage",
                "score": 10,
                "color": "orange"
            },
            {
                "code": "Characteristic",
                "text": "Characteristic",
                "score": 0,
                "color": "red"
            },
        ]
    },
}


#
# LOVs helpers
# ========================

def get_selector_info(selector, code):
    """ Return for a selector item text, score, color
    Parameters:
    ===========
        - selector - desired selector
        - code - desired item of selector
    Return:
    ===========
        - if data found return dictionary with {"text", "score", "color"} containing desired data
        - if data NOT found return dictionary with {"text", "score", "color"} containing null
    """
    _desired_dict = dict(
        text=None,
        score=None,
        color=None
    )
    # find selector
    _tmp = lov_ads_solution.get(selector)
    _selector_info = _tmp.get('selector_data') if _tmp else {}
    for _item in _selector_info:
        if _item['code'] == code:
            _desired_dict['text'] = _item.get('text')
            _desired_dict['score'] = _item.get('score')
            _desired_dict['color'] = _item.get('color')
    return _desired_dict


def get_selector_max_score(selector):
    """ Return maximum score of a selector
    """
    # find selector
    _tmp = lov_ads_solution.get(selector)
    _selector_info = _tmp.get('selector_data') if _tmp else {}
    if _selector_info:
        _selector_scores = [x['score'] for x in _selector_info]
        _selector_max_score = max(_selector_scores)
        return _selector_max_score







