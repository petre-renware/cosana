<small>*(c) 2022 RENware Software Systems*</small>

[PDF VERSION](/download{{ request.path }})

<small>

* Version: 0.0.0
* Last update: 221128
</small>

**Commons component**

***

[TOC]

# Preliminaries

## What you'll find here

This directory contains different parts used by `commons` package.

This directory has itself organization but mainly contains:

* **commons package** is located in file [`commons.py`](/commons/commons.py) which is used by all modules.

## What is Commons package

The **commons package** is a simple class that keep all components identifiers in order to:

* be used "latter" in different stages of application running
* avoid referencing these objects (identifiers) by importing ***app*** or application top level module

## Rationale. Why and what is good for

The MAJOR problem when importing frop **top app module** resides that it is coded in its initialization file (being relatively extreme important).

Because in top application module "all things are created", will cause in most cases ***circular imports*** and special attention should be payed for. And this with price of **distract attention and focus area from main objective of what should do**.In `Flask` based applications normally is used `Config.py` (or other accepted format) module to be able to store and retrive global data among all system modules.
Config module is built in `Flask app` itself so to access to it is you'll need to import `app` which exactly *AVOID* `Commons` package.

It is *independent* of Flask application, so can freely be used even the Flask application object does not need to be involved.
Typical usages are in application threads where is needed data from application components / modules, like for example Flask application or database instances.

In order to avoid that thing and stay focused on real problem, this module can be imported and will find there all top most components references are needed.

>NOTICE: use `Commons` as global area (namespace) ONLY for local host application.
Do not use it over more system hosts in distributed landscapes.
It is not safe to do that and right execution is not guaranteed even you can store serialized system objects. There are other objects designed for this purpose.

## Anatomy of commons package

The package consists technically of a class containing a dictionary with references.

Any reference can be "published" here and if exists can be retrieved latter. This sounds great but if reference (from various reasons) change then can lead to hard side effects. So it is recommend to use it *ONLY ON LOCAL HOST* purposes and NOT over / distributed references.

There are some things that would be known for a complete understanding of component behavior:

* the class from component is "its heart"; here is happening all things
* this class is designed for use (meaning all its "inside") as _CLASS objects_, so there is nothing special if it is instantiated except "garbage collector work" and poor performance
* because of its static nature, all its data exists just as unique copy; everybody will "see" in any moment the same content
* as immediate consequence the same principle apply when its properties are updated; the update is available immediately for everybody
* technically speaking the class act as an **MUTABLE** object

In order to avoid undesired consequences of mutable behavior IT IS RECOMMENDED to use COPIES of retrieved data AND NOT ALTER ORIGINAL data except when this is clearly desired and then make it in **SAFE MOMENTS** when anyone expect for this kind of behavior.

# Methods

The package is offering (by its class object) the following methods for common objects manipulation:

* SetItem
* GetItem
* GetAll

All of these will be explained in the following sections.

## SetItem

This method can be used to set a new item or to update an existing one.

Parameters:

* `item` - it represents the item that should be set or updated; string type, mandatory, no default [1]
* `value` - it represents the value that will be assigned to the item; any Python type, mandatory, no default [1]
* `do_not_update` - it represents a conditional update, if item exists a True value will raise a fatal error if an update try is done; boolean type, optional, default is False

Return:

* the value set as new or updated in form of Python object

## GetItem

This method can be used to retrieve an item value.

* `item` - it represents the item that should be set or updated; string type, mandatory, no default

Return:

* the item value in form of Python object
* if item does not exists thw returned value will be `None`

## GetAll

This method can be used to retrieve the whole dictionary (all items value).





# Notes and references

* [1] - conditions are mandatory and will raise a fatal error at execution if are not met
* [2] - our recommendation is to use this package carefully and in the purpose it was designed, even if a lot of other use cases can be imagined
* [3] - there is no special order of items as they are in a dictionary as KV pairs

--- ooo ---
