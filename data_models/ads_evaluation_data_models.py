#
# (c) 2023 RENware Software Systems
# cosana system
#
# ============================================
# ADS Evaluation
#
from data_models.salesproject_data_models import SalesProject
from data_models.base_keys_data_models import BaseInfoMixin
from commons.commons import Commons
import datetime
import pendulum
from libutil.utils import genpk, getusr
from sqlalchemy.orm import declarative_base, relationship, backref
import sqlalchemy as sa
from flask import jsonify
import sys
import os
import json
from data_models.ads_evaluation_lov_models import \
    lov_ads_evaluation, get_max_achievable_score, \
    get_lov_list_of_codes, get_lov_selector_item_score, \
    get_lov_selector_item_text, get_lov_group_label


# get db_sys from Commons or make it agnostic (usualy apply when called from threads or other processes)
#    - if NULL inherit class object from a SQLAlchemy BaseModel (chk if req?) and from raw one
#    - if ***NOT*** NULL inherit class object from `db.model` and raw one
# declare a general data model (agnostic to Flask)
_PureBaseModel = declarative_base()
db = Commons.GetItem("db_sys")
if not db:
    BaseModel = _PureBaseModel
else:
    BaseModel = db.Model


#
# ads_evaluation
#   note: - _pk and audit columns come from BaseInfoMixin
# TODO -  OPISS.004 - history table
# ============================================


class ads_evaluation(BaseModel, BaseInfoMixin):
    __tablename__ = 'ads_evaluation'

    sales_project_fk = sa.Column(sa.String(36), sa.ForeignKey(
        'salesproject._pk', ondelete='CASCADE'), nullable=False, unique=True, index=True)
    remarks = sa.Column(sa.String(100),  nullable=True)

    #!----------------------------------------------------------------------------------------------
    #!--- GROUP: opportunity_realism (A criteria set) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`
    @property
    def opportunity_realism_score(self):
        _sum_of_group_selectors_score = self.final_applicability_score + \
            self.customer_business_score + \
            self.customer_financials_score + \
            self.access_to_funds_score + \
            self.decisive_event_score
        return _sum_of_group_selectors_score

    #!--- SELECTOR: _final_applicability
    # * database effective column
    _final_applicability = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def final_applicability_score(self):
        _tmp = get_lov_selector_item_score(
            'opportunity_realism', '_final_applicability', self._final_applicability)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _customer_business
    # * database effective column
    _customer_business = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def customer_business_score(self):
        _tmp = get_lov_selector_item_score(
            'opportunity_realism', '_customer_business', self._customer_business)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _customer_financials
    # * database effective column
    _customer_financials = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def customer_financials_score(self):
        _tmp = get_lov_selector_item_score(
            'opportunity_realism', '_customer_financials', self._customer_financials)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _access_to_funds
    # * database effective column
    _access_to_funds = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def access_to_funds_score(self):
        _tmp = get_lov_selector_item_score(
            'opportunity_realism', '_access_to_funds', self._access_to_funds)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _decisive_event
    # * database effective column
    _decisive_event = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def decisive_event_score(self):
        _tmp = get_lov_selector_item_score(
            'opportunity_realism', '_decisive_event', self._decisive_event)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!----------------------------------------------------------------------------------------------
    #!--- GROUP: compete_capability (B criteria set) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`

    @property
    def compete_capability_score(self):
        _sum_of_group_selectors_score = self.formal_decision_making_criteria_score + \
            self.solution_matching_score + \
            self.resources_required_to_sell_score + \
            self.current_relation_with_customer_score + \
            self.value_of_business_proposal_score
        return _sum_of_group_selectors_score

    #!--- SELECTOR: _formal_decision_making_criteria
    # * database effective column
    _formal_decision_making_criteria = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def formal_decision_making_criteria_score(self):
        _tmp = get_lov_selector_item_score(
            'compete_capability', '_formal_decision_making_criteria', self._formal_decision_making_criteria)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _solution_matching
    # * database effective column
    _solution_matching = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def solution_matching_score(self):
        _tmp = get_lov_selector_item_score(
            'compete_capability', '_solution_matching', self._solution_matching)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _resources_required_to_sell
    # * database effective column
    _resources_required_to_sell = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def resources_required_to_sell_score(self):
        _tmp = get_lov_selector_item_score(
            'compete_capability', '_resources_required_to_sell', self._resources_required_to_sell)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _current_relation_with_customer
    # * database effective column
    _current_relation_with_customer = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def current_relation_with_customer_score(self):
        _tmp = get_lov_selector_item_score(
            'compete_capability', '_current_relation_with_customer', self._current_relation_with_customer)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _value_of_business_proposal
    # * database effective column
    _value_of_business_proposal = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def value_of_business_proposal_score(self):
        _tmp = get_lov_selector_item_score(
            'compete_capability', '_value_of_business_proposal', self._value_of_business_proposal)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!----------------------------------------------------------------------------------------------
    #!--- GROUP: win_capability (C criteria set) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`

    @property
    def win_capability_score(self):
        _sum_of_group_selectors_score = self.internal_support_score + \
            self.credibility_score + \
            self.cultural_compatibility_score + \
            self.approach_decision_making_criteria_score + \
            self.political_aspects_score
        return _sum_of_group_selectors_score

    #!--- SELECTOR: _internal_support
    # * database effective column
    _internal_support = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def internal_support_score(self):
        _tmp = get_lov_selector_item_score(
            'win_capability', '_internal_support', self._internal_support)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _credibility
    # * database effective column
    _credibility = sa.Column(sa.String(10), nullable=True,
                             index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def credibility_score(self):
        _tmp = get_lov_selector_item_score(
            'win_capability', '_credibility', self._credibility)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _cultural_compatibility
    # * database effective column
    _cultural_compatibility = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def cultural_compatibility_score(self):
        _tmp = get_lov_selector_item_score(
            'win_capability', '_cultural_compatibility', self._cultural_compatibility)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _approach_decision_making_criteria
    # * database effective column
    _approach_decision_making_criteria = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def approach_decision_making_criteria_score(self):
        _tmp = get_lov_selector_item_score(
            'win_capability', '_approach_decision_making_criteria', self._approach_decision_making_criteria)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _political_aspects
    # * database effective column
    _political_aspects = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def political_aspects_score(self):
        _tmp = get_lov_selector_item_score(
            'win_capability', '_political_aspects', self._political_aspects)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!----------------------------------------------------------------------------------------------
    #!---  GROUP: win_worth (D criteria set) - ref analysis from `/100_ANA/ADS_account_data_sheet/fisa_account_2.jpg`

    @property
    def win_worth_score(self):
        _sum_of_group_selectors_score = self.short_term_revenue_score + \
            self.long_term_revenue_score + \
            self.profitability_score + \
            self.risk_score + \
            self.strategical_value_score
        return _sum_of_group_selectors_score

    #!--- SELECTOR: _short_term_revenue
    # * database effective column
    _short_term_revenue = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def short_term_revenue_score(self):
        _tmp = get_lov_selector_item_score(
            'win_worth', '_short_term_revenue', self._short_term_revenue)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _long_term_revenue
    # * database effective column
    _long_term_revenue = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def long_term_revenue_score(self):
        _tmp = get_lov_selector_item_score(
            'win_worth', '_long_term_revenue', self._long_term_revenue)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _risk
    # * database effective column
    _risk = sa.Column(sa.String(10), nullable=True,
                      index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def risk_score(self):
        _tmp = get_lov_selector_item_score(
            'win_worth', '_risk', self._risk)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _profitability
    # * database effective column
    _profitability = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def profitability_score(self):
        _tmp = get_lov_selector_item_score(
            'win_worth', '_profitability', self._profitability)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    #!--- SELECTOR: _strategical_value
    # * database effective column
    _strategical_value = sa.Column(
        sa.String(10), nullable=True, index=True, default='--- NOT SET ---')

    @property
    # getter for selection score
    def strategical_value_score(self):
        _tmp = get_lov_selector_item_score(
            'win_worth', '_strategical_value', self._strategical_value)
        # @DATA-ERR return 0 because do not know what value to return
        return _tmp if _tmp else 0

    @property
    # getter attribute for scoring (RMAP.003 - ADS scoring)
    def score(self):
        _MAX_SCORE = get_max_achievable_score()
        _crt_score = self.compete_capability_score + self.opportunity_realism_score + self.win_capability_score + self.win_worth_score
        _tmp = {
            "crt_score": _crt_score,
            "max_score": _MAX_SCORE,
        }
        return _tmp

    def as_dict(self):
        # first part of dictionary is with base columns
        _tmp_base = dict()
        _tmp_base = self.get_base_model_as__dict()
        # second part of dictionary is with specific columns
        _tmp_me = dict()
        _tmp_me = {
            # - other colmns attriutes
            "remarks": self.remarks,
            "score": self.score,
            # - SELECTORS
            "_final_applicability": self._final_applicability,
            "_customer_business": self._customer_business,
            "_customer_financials": self._customer_financials,
            "_access_to_funds": self._access_to_funds,
            "_decisive_event": self._decisive_event,
            "_formal_decision_making_criteria": self._formal_decision_making_criteria,
            "_solution_matching": self._solution_matching,
            "_resources_required_to_sell": self._resources_required_to_sell,
            "_current_relation_with_customer": self._current_relation_with_customer,
            "_value_of_business_proposal": self._value_of_business_proposal,
            "_internal_support": self._internal_support,
            "_credibility": self._credibility,
            "_cultural_compatibility": self._cultural_compatibility,
            "_approach_decision_making_criteria": self._approach_decision_making_criteria,
            "_political_aspects": self._political_aspects,
            "_short_term_revenue": self._short_term_revenue,
            "_long_term_revenue": self._long_term_revenue,
            "_risk": self._risk,
            "_profitability": self._profitability,
            "_strategical_value": self._strategical_value,
            # - GROUPS
            "opportunity_realism_score": self.opportunity_realism_score,
            "compete_capability_score": self.compete_capability_score,
            "win_capability_score": self.win_capability_score,
            "win_worth_score": self.win_worth_score,
        }
        # unified dictionary contain both
        _tmp = dict()
        _tmp = _tmp_base.copy()
        _tmp.update(_tmp_me.copy())
        return _tmp

    def check_health(self):
        pass
