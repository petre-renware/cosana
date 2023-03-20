#
# (c) 2023 RENware Software Systems
# cosana system
#
# ========================
# ADS Relationships
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
lov_ads_relationships = {
    "change_adaptability": {
        "label": "Change adaptability",
        "selector_data": [
            {
                "code": "Innovator",
                "text": "Innovator",
                "score": 20,
                "color": "green"
            },
            {
                "code": "Visionary",
                "text": "Visionary",
                "score": 15,
                "color": "yellow"
            },
            {
                "code": "Pragmatic",
                "text": "Pragmatic",
                "score": 10,
                "color": "orange"
            },
            {
                "code": "Conservative",
                "text": "Conservative",
                "score": 5,
                "color": "burgundy"
            },
            {
                "code": "Retrograde",
                "text": "Retrograde",
                "score": 0,
                "color": "red"
            }
        ]
    },

    "our_status_in_relation": {
        "label": "Our status in relation",
        "selector_data": [
            {
                "code": "Mentor",
                "text": "Mentor",
                "score": 20,
                "color": "green"
            },
            {
                "code": "Supporter",
                "text": "Supporter",
                "score": 15,
                "color": "yellow"
            },
            {
                "code": "Neutral",
                "text": "Neutral",
                "score": 10,
                "color": "orange"
            },
            {
                "code": "NON-Supporter",
                "text": "NON-Supporter",
                "score": 5,
                "color": "burgundy"
            },
            {
                "code": "Enemy",
                "text": "Enemy",
                "score": 0,
                "color": "red"
            },
        ]
    },

    "contact_status": {
        "label": "Contact status",
        "selector_data": [
            {
                "code": "Detailed-Knowledge",
                "text": "Detailed-Knowledge",
                "score": 15,
                "color": "green"
            },
            {
                "code": "Multiple-Contacts",
                "text": "Multiple-Contacts",
                "score": 10,
                "color": "yellow"
            },
            {
                "code": "Briefly-Contacted",
                "text": "Briefly-Contacted",
                "score": 5,
                "color": "orange"
            },
            {
                "code": "NOT-Contacted",
                "text": "NOT-Contacted",
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
    _tmp = lov_ads_relationships.get(selector)
    _selector_info = _tmp.get('selector_data') if _tmp else {}
    for _item in _selector_info:
        if _item['code'] == code:
            _desired_dict['text'] = _item.get('text')
            _desired_dict['score'] = _item.get('score')
            _desired_dict['color'] = _item.get('color')
    return _desired_dict






