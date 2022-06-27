from libqtile.lazy import lazy
from configmanager.custom01.workspace import workspaces
from configmanager.custom01.uservars import terminal

@lazy.function
def launch_default_app(qtile):
    name = qtile.current_group.name

    for workspace in workspaces:
        if workspace.name == name:
            if workspace.app == None:
                qtile.cmd_spawn(terminal)
            else:
                qtile.cmd_spawn(workspace.app)

