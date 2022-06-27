from libqtile.config import Click, Drag, Key
from libqtile.lazy import lazy
from importlib import import_module
from configmanager.custom01 import uservars
from configmanager.custom01.workspace import workspaces
from configmanager.custom01 import callback

mod = uservars.modkey
terminal = uservars.terminal
shift = 'shift'
alt = 'mod1'
tab = 'Tab'
ctrl = 'control'
enter = 'Return'
space = 'space'

def get_mouse_bindings():
    return [
        Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
        Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
        Click([mod], "Button2", lazy.window.bring_to_front()),
    ]

def get_key_bindings():
    session_keys = [
        Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
        Key([mod, ctrl], "r", lazy.restart(), desc="Reload the config"),
        Key([mod, ctrl], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    ]

    window_keys = [
        Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
        Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
        Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
        Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
        Key([alt], tab, lazy.layout.next(), desc="Move window focus to other window"),
        Key([mod, shift], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
        Key([mod, shift], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
        Key([mod, shift], "j", lazy.layout.shuffle_down(), desc="Move window down"),
        Key([mod, shift], "k", lazy.layout.shuffle_up(), desc="Move window up"),
        Key([mod, ctrl], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
        Key([mod, ctrl], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
        Key([mod, ctrl], "j", lazy.layout.grow_down(), desc="Grow window down"),
        Key([mod, ctrl], "k", lazy.layout.grow_up(), desc="Grow window up"),
        Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
        Key(
            [mod, shift],
            enter,
            lazy.layout.toggle_split(),
            desc="Toggle between split and unsplit sides of stack",
        ),
        Key([mod], space, lazy.window.toggle_floating(), desc="toggle floating"),
        Key([mod], "f", lazy.window.toggle_fullscreen(), desc="toggle fullscreen"),
    ]

    workspace_keys = [
        Key([mod], tab, lazy.screen.toggle_group(), desc="switch to group history"),
    ]

    for i in range(9):
        name = workspaces[i].name
        key = str(i + 1)
        workspace_keys.extend(
            [ 
                Key([mod], key, lazy.group[name].toscreen(), desc="switch workspace"),
                Key([mod, shift], key, lazy.window.togroup(name, switch_group=True), desc="move to workspace"),
            ]
        )

    app_keys = [
        Key([mod], enter, lazy.spawn(terminal), desc="Launch terminal"),
        Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
        Key([mod], "a", callback.launch_default_app, desc="launch default"),
    ]

    popup_keys = [
        Key([mod], 'F1', lazy.group['scratchpad'].dropdown_toggle('dropdown-terminal')),
    ]

    return session_keys + window_keys + workspace_keys + app_keys + popup_keys
