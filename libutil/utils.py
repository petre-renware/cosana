#
# copyright (C) 2021, 2022 RENware Software Systems
# ==================
# various sembre system utility
# functions and classes
#
# Author: Petre Iordanescu, petre.iordanescu@gmail.com
#


import uuid, json, sys, os



# useful as callables in default column definition (basically in ORM data models)

def genpk():
    """ Generates a unique identifier format uuid4 and converts it to string
    """
    t = uuid.uuid4()
    t = str(t)
    return t


def getusr():
    """ Get current user
    """
    _crt_user = "anonymus" #!#FIXME this should be updated when implement login and users mixin
    return _crt_user

