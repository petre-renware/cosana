#
# copyright (c) 2021 RENware Software Systems
# ====================
# Module to render a Markdown file as HTML
#
# Author: Petre Iordanescu, petre.iordanescu@gmail.com
#


import sys, os
from unittest import loader
from uuid import uuid4

from commons.commons import Commons
app = Commons.GetItem("app_portal")
if not app:
    print(f"system: FATAL ERROR. app does not exists or not yet initialized. Application stop.")
    sys.exit(0)


from markdown import markdown, markdownFromFile
from mdx_gfm import GithubFlavoredMarkdownExtension

import md_mermaid

from flask import render_template, render_template_string


_HEADER_MD = '''
        {% include 'base/_base_css.j2' %}
        
        <!-- mermaid libraries -->
        <script src="https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"></script>
        <script>mermaid.initialize({startOnLoad:true});</script>
'''



def Md2HTML(infile, outfile = None, jinja_process = False, **jinja_data):
    cvt_content = ""
    inf = infile
    of = outfile
    #//* html with error
    serr = "<p>SEMBRE Backend Layer. WARNING. module md2html.py, The file" + inf + " cannot be open. Pls report this to administrator.</p>"

    # 1 chk if file exists
    try:
        open(inf, "br")
    except:
        return(serr) #//* returns an err msg to be rendered in UI page

    # 2 open file and read all content
    # 3 convert that content to HTML
    # creates a temporary file where to put data
    loco_fname = os.path.join(app.config["APP_ROOT_DIR"] + "/tmp", str(uuid4()) + ".tmp")

    # generate there html output
    cvt_content = markdownFromFile(input=inf, output=loco_fname, extensions=[GithubFlavoredMarkdownExtension(), "md_mermaid", "toc", "admonition"])

    # open temporary file, read it and return content
    with open(loco_fname) as f:
        cvt_content = f.read()
    os.remove(loco_fname) # drop file as no more needed (nobody knows its name and aim)
    #*--- insert required libraries for mermaid
    add_on_to_html = _HEADER_MD
    cvt_content =  add_on_to_html + cvt_content

    #*--- assure Jinja processing only if specified that i parameter jinja_process
    if jinja_process:
        if jinja_data:
            cvt_content = render_template_string(cvt_content, jinja_data = jinja_data)
        else:
            cvt_content = render_template_string(cvt_content)

    #*-- if not called to write a file, just return content and exit
    if (outfile is None):
        return cvt_content

    #*--- 4. if requested, save file
    if not (outfile is None):
        #*--- 4.1 open of in w mode
        try:
            wf = open(of, "w")
        except:
           print(f"SEMBRE Backend Layer.  WARNING. module md2html.py. You have no write rights to output file: {of}. Operation canceled")
           return None
        #*--- 4.2 if everything OK (could be written)
        wf.write(cvt_content)
        wf.close()

        # 4.3 return a html ok string, probably not very useful just is not None and with length strict positive
        return "<p>Content converted from " + inf + " to " + of + "</p>"
    return cvt_content



if __name__ == "__main__":

    #//* convert the README file and put it in static directory
    Md2HTML("../README.md", "../static/README.html")

