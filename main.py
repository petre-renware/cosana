#!/usr/bin/python3

#
# cosana
# ====================
# (C) 2022 RENware Software Systems
#
# this module start the system
# the server is shelled by **WSGI_server** (see 810-DSGN System Landscape document)
# created by: Petre Iordanescu
#


import os, sys


# force execute init_system by importing
from sys_core.init_system import app_portal



if __name__ == '__main__':
    print("Starting the web application")
    app_portal.run(host = '0.0.0.0', port = 32000)
    # app.run(host = '0.0.0.0', port = APP_PORT)





