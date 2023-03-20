#
# copyright (C) 2022 RENware Software Systems
# ==========================================
# main portal entries
# author: Petre Iordanescu
#


import os, sys
from uuid import uuid4
import json

from flask import render_template, redirect, url_for, send_from_directory, request, jsonify
import datetime

from commons.commons import Commons


#* get app from Commons
app = Commons.GetItem("app_portal")
if not app:
    print("*** FATAL ERROR - portal app is null. System exit")
    sys.exit(1)



#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/') #! DO NOT CHANGE ME. USED AS REF FOR BASE ROUTE
def home():
    return render_template("index.html")



# route for returning all Commons objects
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/show_commons')
def show_commons():
    import pprint
    import html
    _tmp = Commons.GetAll()
    _formatted_string = pprint.pformat(_tmp, indent = 4, width = 500)
    _formatted_string = "<pre>" + _formatted_string + "</pre>"
    _formatted_string = html.unescape(_formatted_string)
    return str(_formatted_string)



# route for whoami (Who am I)
#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/whoami')
def whoami():
    # get / set all things needed
    myhost = Commons.GetItem("HOSTNAME")
    usr_nam = f"anonymus (user n/a yet)"

    # make a dictionary and return result as JSON
    _whoami_info = dict(
        host_timestamp = str(datetime.datetime.now()),
        username = usr_nam,
        host_server = myhost
    )
    resp = jsonify(_whoami_info)
    return resp



#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/sitemap')
def sitemap():
    # [piu] HINT: use app.url_map
    def has_no_empty_params(rule):
        defaults = rule.defaults if rule.defaults is not None else ()
        arguments = rule.arguments if rule.arguments is not None else ()
        return len(defaults) >= len(arguments)

    links = []
    for rule in app.url_map.iter_rules():
        # Filter out rules we can't navigate to in a browser
        # and rules that require parameters
        if "GET" in rule.methods and has_no_empty_params(rule):
            url = url_for(rule.endpoint, **(rule.defaults or {}))
            links.append((url, rule.endpoint))
    # links is now a list of url, endpoint tuples
    return links



#TODO ROADMAP.RMAP.000 login-protect route
@app.route('/wip')
def wip():
    return render_template("under_construction.html")


