from importlib import import_module

class Empty:
    pass

def generate(config_name):
    config_name = "configmanager." + config_name

    binding = import_module(config_name + ".binding")
    workspace = import_module(config_name + ".workspace")
    layout = import_module(config_name + ".layout")
    popup = import_module(config_name + ".popup")
    screen = import_module(config_name + ".screen")

    obj = Empty()
    
    obj.keys = binding.get_key_bindings()
    obj.mouse = binding.get_mouse_bindings()
    obj.groups = workspace.get_workspaces()
    obj.popups = popup.popups
    obj.layouts = layout.layouts
    obj.screens = screen.get_screens()

    return obj
