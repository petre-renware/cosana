#
# cosana
# ====================
# (C) 2022 RENware Software Systems
#
# the config.py contains system basic configuration data in Python format as class
#
#

import os
basedir = os.path.abspath(os.path.dirname(__file__))

class Config(object):
    APP_ROOT_DIR = basedir

    # sys_data (sys_db) component database / object
    SQLALCHEMY_DATABASE_URI = 'sqlite:///' + os.path.join(basedir, 'data/sys_db.db')
    SQLALCHEMY_TRACK_MODIFICATIONS = False

    SECRET_KEY = "1612f8bf-3a78-4813-bdef-61e99126994f-1612f8bf-3a78-4813-bdef-61e99126994f"

