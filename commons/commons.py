#
# copyright (C) 2022 RENware Software Systems
# ==========================================
#
# commons object to keep the top level
# components identifier
#
# aim is to get here what you need and avoid circular
# imports from app & its init structure. objects like app, db, etc...
#


from threading import RLock
try: # just try to see if exists
    _ = commons_lock
except:
    commons_lock = None
# then create it if not exists (supposing this is the first time)
if not commons_lock:
    commons_lock = RLock()

# the system core objects are ot pickable (even with dill) so they will be ignored
_list_of_unpickable_objects = ["db_sys"]





class Commons:
    # class variable to keep common items
    global cmn_items
    cmn_items = dict()

    #!--------------------------------------------- Classic structures
    @staticmethod
    def SetItem(item, value, do_not_update = False):
        # set a new item or update an existing one (thw stores: local as Python object and Redis as external hared resource)
        # exit if item is not string
        # if do_not_update and item exists then do nothing and returns None
        if do_not_update and GetItem(item):
            assert x == None
            return None
        with commons_lock:
            #--- store using classic method
            tmp = dict()
            tmp[item] = value
            cmn_items.update(tmp)
        return tmp

    @staticmethod
    def GetItem(item):
        # get an item value if exists, otherwise exit returning None
        tmp = None
        with commons_lock:
            tmp = cmn_items.get(item)
        return tmp

    @staticmethod
    def GetAll():
        #* return all structure
        return cmn_items




