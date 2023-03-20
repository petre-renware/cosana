#
# copyright (C) 2022 RENware Software Systems
# ==========================================
# initialize CRUD data component
# author: Petre Iordanescu
#

import os, sys


def init_crud_admin(app = None):
    if not app:
        #* get app from Commons
        from commons.commons import Commons
        app = Commons.GetItem("app_portal")
        if not app:
            print(f"*** FATAL ERROR in {__name__} - portal app is null. System exit")
            sys.exit(1)

    # import routes
    from crud_data_admin import crud_data_admin_main

    # tbd... other stuff
    ...


