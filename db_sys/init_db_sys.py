#!/usr/bin/python3

#
# cosana
# ====================
# (C) 2022 RENware Software Systems
#
# this module initialize system database
# created by: Petre Iordanescu
#

import sys, os

from commons.commons import Commons


def create_sys_data(app):
    # create database object
    from sqlalchemy import MetaData
    from flask_sqlalchemy import SQLAlchemy

    convention = {
        "ix": 'ix_%(column_0_label)s',
        "uq": "uq_%(table_name)s_%(column_0_name)s",
        "ck": "ck_%(table_name)s_%(constraint_name)s",
        "fk": "fk_%(table_name)s_%(column_0_name)s_%(referred_table_name)s",
        "pk": "pk_%(table_name)s"
    }

    metadata = MetaData(naming_convention=convention)
    db_obj = SQLAlchemy(app, metadata=metadata)

    # place it in commons to access it latter
    Commons.SetItem("db_sys", db_obj)

    return db_obj

