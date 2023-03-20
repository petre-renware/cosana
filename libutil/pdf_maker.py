#
#
# copyright (C) 2021 RENware Software Systems
# ==========================
# PDF maker / creator. Knows the following modes: (a) from string, (b) from file and (c) from URL
# (b) & (c) variants allows for combining multiple sources in the same PDF (in oredr of sources list)
#
## Author: Petre Iordanescu, petre.iordanescu@gmail.com
#

import json, os, sys

from commons.commons import Commons
app = Commons.GetItem("app_portal")
if not app:
    print(f"system: FATAL ERROR. app does not exists or not yet initialized. Application stop.")
    sys.exit(0)
from weasyprint import HTML, CSS



def format_pdf():
    """ return a CSS to format PDF
    """
    #! #TODO - get these from configuration; in fact RIGHT option is to let client to do localization... being a characteristic of it (browser locales)
    #! #TODO - can be a param that specify a CSS file or string
    the_css = CSS(string="@page { size: A4; margin: 0.75in}") # return a default css
    ret = [the_css]
    return ret



def pdf_maker_from_string(html_stream: str, out_file: str):
    """
    Description: make a file from input string
    Parameters:
        - html_stream - str, is the HTML string that needs to be converted to PDF; accepted string can be unicode or utf-8
        - outfile - str, is the name of the file to be creted (recommended fully qualifyied as working directory could differ)
    Return: created file name
    """

    #** prepare out_file - strip spaces and append .pdf extension
    loco_out_file = out_file.strip()

    #** prepare options for PDF file by using CSS
    css_data = format_pdf()
    
    #** creates pdf file
    HTML(string = html_stream).write_pdf(loco_out_file, stylesheets = css_data)
    
    #** returns the file name created (also meaning True)
    return loco_out_file



def pdf_maker_from_file(in_file: list, out_file: str):
    """
    Description: make a file from one or more input files
    Parameters:
        - in_file - str or list of str, the HTML file(s) that should be transformed in PDF
        - outfile - str, is the name of the file to be creted (recommended fully qualifyied as working directory could differ)
    Return: created file name
    """
    #** prepare out_file - strip spaces and append .pdf extension
    loco_out_file = out_file.strip()

    #** prepare options for PDF file by using CSS
    css_data = format_pdf()
    
    #** creates pdf file
    HTML(in_file).write_pdf(loco_out_file, stylesheets = css_data)

    #** returns the file name created (also meaning True)
    return loco_out_file



def pdf_maker_from_url(in_url: list, out_file: str):
    """
    Description: make a file from input string
    Parameters:
        - in_url - str or list of str, the HTML url(s) that should be transformed in PDF
        - outfile - str, is the name of the file to be creted (recommended fully qualifyied as working directory could differ)
    Return: created file name
    """

    #! #TODO - code function as this exmaple
    '''
    #** prepare out_file - strip spaces and append .pdf extension
    loco_out_file = out_file.strip()

    #** prepare options for PDF file by using CSS
    css_data = format_pdf()
    
    #** creates pdf file
    HTML(in_url).write_pdf(loco_out_file, stylesheets = css_data)

    #** returns the file name created (also meaning True)
    return loco_out_file
    '''
    pass

