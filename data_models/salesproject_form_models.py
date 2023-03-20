#
# (c) 2022 RENware Software Systems
# cosana system
#
# ============================================
# SalesProjects (list of sales projects)
#
import json, os, sys

from flask_wtf import FlaskForm
from wtforms import SubmitField, StringField, SelectField, TextAreaField, BooleanField
from wtforms import validators
from wtforms.validators import DataRequired





#
# SalesProjects WTF form
# ============================================
class SalesProjectForm(FlaskForm):
    pk = StringField('_pk', validators=[])
    code = StringField('Code', validators=[validators.input_required()])
    description  = StringField('Description', validators=[validators.optional()])
    notes = TextAreaField('Notes', validators=[validators.optional()])
    disabled = BooleanField('Disabled', validators=[validators.optional()])







