#!/usr/bin/python3

#
# cosana
# ====================
# (C) 2022 RENware Sofware Systems
#
# this module initialize all the system (and components) according to 810-DSGN System Landscape document
# created by: Petre Iordanescu
#

import sys, os
from flask import Flask

from commons.commons import Commons



# initialize Flask main web application (app_portal component)
def create_portal():
    ''' initialize Flask main web application (app_portal component)
    '''
    portal_template_dir = os.path.abspath("templates/")
    portal_static_dir = os.path.abspath("static/")

    _app = Flask(__name__, template_folder = portal_template_dir, static_folder = portal_static_dir)

    # place app  in commons to access it latter
    Commons.SetItem("app_portal", _app)

    return _app





