<small>*(c) 2022 RENware Software Systems*</small>

[PDF VERSION](/download{{ request.path }})

<small>

* Version: 0.9.0
* Last update: 230310
</small>

**System Core**

***

[TOC]

# Preliminaries

The **System Core** component initialize all application level / tier components




## Initialization order

The initialization order is critical for a *right and deterministic* application run. **It MUST be respected as presented in `init_system.py` code file.**




# System initialization module

This is the main module of this component and is located in [`init_system.py`](/sys_core/init_system.py).

**Details and Specifications** (#TODO - a final check ref names is required)

* to run the development server module is called in [`main.py`](/main.py)
* to run the production server module is called in [`start_server.sh`](/start_server.sh)







--- ooo ---
