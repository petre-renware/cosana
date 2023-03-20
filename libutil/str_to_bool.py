#
# copyright (C) 2021 RENware Software Systems
# ==================
# String to bool converter
#
# Author: Petre Iordanescu, petre.iordanescu@gmail.com
#

# here are some constants just to easy to change
TRUE_LIST = ("true", "yes", "y", "1", "on")
FALSE_LIST = ("false", "no", "n", "0", "off")


def str_to_bool(val):
    """
    Description: convert a string to boolean - useful for API parameters
    Cases:
        - Any string that is in (y, yes, 1, on) will become True
        - Any string that is in (n, no, false, 0, off) will become False
        - Missing or None will become False
        - bool paramas remains bools and returned as it is
        - integers with intrinsec / usual nature as bools (C cstyle for 1 and 0) are converted to corresponding bool
        - any other type will become False
        - ANT UNTREATED CASE RETURN False (avoid exceptions)
    Return: bool
    """
    #* first test all exceptions
    if (val is None) or (val == None):
        return False
    if type(val) == type(True):
        return val
    if type(val) == type(1):
        return bool(val)
    if type(val) != type(""):
        return False

    #* ok. now its time for work
    loco_val = val.strip().lower()
    if loco_val in TRUE_LIST:
        return True
    if loco_val in FALSE_LIST:
        return False
    return False

if __name__ == "__main__":
    # some tests
    print("tst None: ", str_to_bool(None))
    print("tst trUE: ", str_to_bool("trUE"))
    print("tst boolean False: ", str_to_bool(False))
    print("tst 1: ", str_to_bool(1))
    