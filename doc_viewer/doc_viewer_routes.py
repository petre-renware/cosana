#
# copyright (C) 2022 RENware Software Systems
# ==========================================
# documens viewer routes
#

import os, sys
from uuid import uuid4


from commons.commons import Commons
app_portal = Commons.GetItem("app_portal")
if not app_portal:
    print(f"cosana: FATAL ERROR. app_portal does not exists or not yet initialized. Application stop.")
    sys.exit(0)





from flask import render_template, redirect, url_for, send_from_directory, send_file, request
import json, datetime

from flask import make_response

from libutil.md2html import Md2HTML
from libutil.pdf_maker import pdf_maker_from_string




# Constants used in JSON viewer: List of file types accepted for view / render as HTML and text block wrapper
# ==========================================
_LOF_ACCEPTED_FOR_VIEW = [".md",  ".json",  ".jpeg", ".jpg",  "gif", ".png"]
_JSON_WRAPPER_FOR_MD = "```"



#** documentation view routes. There are following routes:
# - to view as HTML: one as simply path as is and another as ..file_admin_component_url/path_as_is
# - to view as PDF (standard feature in almost modern browsers)
# ==========================================
"""
PDFs download:
    * this option will is available as button on rendered doc
JSON viewer:
	* viewer accepts files with .json extension too. It surrounds them in a markdown code block (```)
GIF, PNG, JPG viewer:
    * this is in plan and will be available in new versions
JINJA data (variables)
    * jinja variables can be sent as route arguments using `jinja_data` parameter
      in jinja variables will be seen as jinja_data.jinja_data...your_variable_here_of_specified_type...
"""





#* route for markdown (not only - there is a list with accepted types) get and transform in html
#TODO ROADMAP.RMAP.000 login-protect route
@app_portal.route("/<path:docfile>")
def system_doc_viewer(docfile):

    # check for spaces in docfile
    if " " in docfile:
         return make_response("File name contains invalid characters", 404)

    # assure the file (and default will check the directory) exists
    if not os.path.isfile(docfile):
        return make_response("File does not exists", 404)

    # split for filename
    (fil, fext) = os.path.splitext(docfile)

    # assure the requested file is in LOF
    if (fext == None) or (fext is None) or (fext.lower() not in _LOF_ACCEPTED_FOR_VIEW):
        return make_response("Ffile is not allowed for view", 404)

    # picture files treatment, just return their content
    if fext.lower() in [".jpeg", ".jpg",  "gif", ".png"]:
        _mimetype = f"image/{fext.lower()[1:]}" # just eliminate first dot char
        (_path, _fname) = os.path.split(docfile)
        _path = os.path.abspath(_path)
        return send_from_directory(directory = _path, path = _fname)

    # JSON treatment
    if fext.lower() == ".json":
        with open(docfile, "r") as _md_file: # read existing file
            _old_file_content = _md_file.read()
        _new_file_content = _JSON_WRAPPER_FOR_MD + "\n" + _old_file_content + "\n" + _JSON_WRAPPER_FOR_MD
        _temp_file = os.path.join(app_portal.config["APP_ROOT_DIR"] + "/tmp", str(uuid4()) + ".md")
        with open(_temp_file, "w") as _jsonified_file: # overwrite existing file
            _jsonified_file.write(_new_file_content)
        _jsonified_file.close()
        docfile = _temp_file

    # convert md to html stream (already existing libutil md2html function)
    req_args = request.args
    if "jinja_data" in req_args:
        raw_jinja_data = request.args["jinja_data"]
        # un-jsonify it
        jinja_data =json.loads(raw_jinja_data)
        out_data = Md2HTML(infile=docfile, outfile=None, jinja_process=True, jinja_data = jinja_data)
    else:
        out_data = Md2HTML(infile=docfile, outfile=None, jinja_process=True)

    # return that content of file as string
    return str(out_data)





#* route for PDF download of markdown documentation get by / generated in previous routes (/syad/fileadmin/<path:docfile>) or (/<path:docfile>)
#TODO ROADMAP.RMAP.000 login-protect route
@app_portal.route("/download/<path:docfile>")
def system_doc_downloader(docfile):
    # 1. call html viewer function with request
    baseurl = url_for("home")
    torequrl = str(baseurl) + str(docfile)
    r = system_doc_viewer(str(docfile))

    # 2. if status of request is DIFF of 200, return received respone as is
    if (type(r) != type("a string")) and (r.status_code != 200):
        return make_response("Invalid file for download as PDF", 500)

    # 3. convert received result to PDF file; use /tmp dir and retain the full filename
    # 4. split directory
    loco_pdf_file = os.path.join(app_portal.config["APP_ROOT_DIR"] + "/tmp", str(uuid4()) + ".pdf")
    (loco_pdf_file_directory, loco_pdf_file_filename) = os.path.split(loco_pdf_file)
    pdf_maker_from_string(r, loco_pdf_file)

    # 5. return send_file (like in invoice dwnld route) but before drop it
    pdf_to_send = send_from_directory(directory = loco_pdf_file_directory, path = loco_pdf_file_filename)
    os.remove(loco_pdf_file)
    return pdf_to_send




