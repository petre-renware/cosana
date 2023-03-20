#
# (c) 2022 RENware Software Systems
#
# returns a function callable by getting as input its
#     func_name - str, mandatory
#     module_name - str, optional, default same as func_name
#     package_name - str, optional, default same as func_name
#
# Author: Petre Iordanescu, petre.iordanescu@gmail.com
#




def get_function_by_name(func_name, module_name = None, package_name = None):
    """
    Description: returns a function callable by getting as input its
    Parameters:
        func_name - str, mandatory
        module_name - str, optional, default same as func_name
        package_name - str, optional, default same as func_name
    Returns: function as callable
    """
    # check and defaults parameters
    assert type(func_name) == type("a string"), "func_name should be string type"
    assert type(package_name) == type("a string"), "package_name should be string type"
    assert type(module_name) == type("a string"), "module_name should be string type"
    
    if not package_name:
        package_name = func_name
    if not module_name:
        module_name = func_name
    
    
    # get package and module
    from importlib import import_module
    module_full_name = f"{package_name}.{module_name}"
    module_code = None
    try:
        module_code = import_module(module_full_name)
    except:
        module_code = None
    if not module_code:
        assert 1 == 0, "package or module {package_name}.{module_name} does not exists" 
        return None
    
    # get function
    func = getattr(module_code, func_name)
    if not func:
        assert 1 == 0, "function {func_name} does not exists in {package_name}.{module_name}" 
        return None
    
    
    return func

