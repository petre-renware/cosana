#
# (c) 2023 RENware Software Systems
# cosana system
#
# ========================
# ADS Organization Map
#
import json
import os
import sys


#
# LOVs data structure(s)
# ========================
""" data structures description:
- lov_scoring_org_map - defines DEFAULT values for scoring configurable elements
"""
lov_scoring_org_map = {
    '_MAX_OF_DECISION_MAKE': 1,
    '_MAX_OF_NEED_TO_SIGN': 2,
    '_MAX_OF_TECHNICAL_EVALUATION': 3,
    '_MAX_OF_FINANCIAL_EVALUATION': 2,
    '_MAX_OF_CONSULTANT': 3,
}


#
# LOVs helpers
# ========================
def get_score_total():
    """ Return score maximum points for Organization Map domain
    """
    _tmp = sum(lov_scoring_org_map.values())
    return _tmp





