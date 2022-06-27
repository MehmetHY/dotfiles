from libqtile.config import Group

class Workspace:
    def __init__(self, name, app = None):
        self.name = name
        self.app = app

workspaces = [
    Workspace("", "codium"),
    Workspace("פֿ", "joplin"),
    Workspace("", "okular"),
    Workspace("", "firefox"),
    Workspace("", None),
    Workspace("", "inkscape"),
    Workspace("", "blender"),
    Workspace("", "krusader"),
    Workspace("", "steam")
]

def get_workspaces():
    return [Group(w.name) for w in workspaces]