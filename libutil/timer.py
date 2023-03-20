#
# (c) 2021, 2022 RENware Software Systems
#
# clocks, counters & other timers library for services management
# version: v1.1.0 | 11-nov-2021
# author: Petre Iordanescu, RENware Software Systems
#         created: November 2021, first production release
#         updated: October 2022, simplified parameters, accept an app and db but are not mandatory
# ========================================================
#


import threading


#---[petre]--- ceas perpetuu cu stop
# ========================================================
class perpetualTimer():
    """ timer interval in seconds
    parameters:
        time_interval - mandatory, repeating time interval in seconds
        user_scheduled_function - mandatory, the function to be executed at periodic intervals
        app - optional, for use as application context in user scheduled function
        db  - optional, for use as database access in user scheduled function
    """

   _time_interval = None #---[petre]--- timer interval in seconds
   user_scheduled_function = None #---[etre]--- user function | event called a each time quantum | tick mark

   def __init__(self, time_interval, user_scheduled_function, app = None, db = None):
      self._time_interval = time_interval
      self._user_scheduled_function = user_scheduled_function
      self._app = app
      self._db = db
      self.thread = threading.Timer(self._time_interval, self._internal_handle_function, args = (self._app, self._db))

   def _internal_handle_function(self, papp, pdb):
      # call user scheduled function
      self._user_scheduled_function(papp, pdb)
      # schedule for next run
      self.thread = threading.Timer(self._time_interval, self._internal_handle_function, args = (self._app, self._db))
      self.thread.start()

   def start(self):
      self.thread.start()

   def stop(self):
      self.thread.cancel()

