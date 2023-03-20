#
# module for various misc about server and networking
# ------
# Copyrights: RENware Software Systems, 2021
#
# author: Petre Iordanescu
# updates:
#   - 211206 for SEMBRE Backend Layer
#   - 210201 initial creation (lopa project)
#

# here you can import a global class where to store data. see PSA project for details
from datetime import datetime
import socket

sys_sign = "RENPSA 0000-0134 module get_hostname"

def get_hostname(cfg=None):
    """
    description: Gets the current machine hostname as fully qualified
    args: param cfg is usefull if there is a global class where to store data
    """
    r = socket.getfqdn() 

    ts = datetime.utcnow()
    ts = ts.strftime('%Y/%m/%d %H:%M:%S')

    if cfg == None:
        result = {
            "signature": sys_sign,
            "retCode": 1,
            "encoding": 'utf-8', 
            "hname": r,
            "localUTC": ts

        }
        return result
    else:
        cfg.set_hostname(r)
        return 'result in cfg obj'




# test work... 
"""
if __name__ == '__main__':
    print('wo params')
    print(get_hostname())

    cfg = psa_data()
    print('with params')
    print(get_hostname(cfg))

    print('as DICT from cfg object')
    print(cfg.get_dict())

    print('as JSON from cfg object')
    print(cfg.get_json())
   
"""
