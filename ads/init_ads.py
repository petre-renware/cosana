#
# copyright (C) 2023 RENware Software Systems
# ==========================================
# initialize ADS component
# author: Petre Iordanescu
#

import os, sys


def init_ads(app = None):
    if not app:
        #* get app from Commons
        from commons.commons import Commons
        app = Commons.GetItem("app_portal")
        if not app:
            print(f"*** FATAL ERROR in {__name__} - portal app is null. System exit")
            sys.exit(1)

    # import routes
    from ads import ads_main

    # tbd... other stuff
    ...


