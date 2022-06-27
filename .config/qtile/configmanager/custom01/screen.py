from libqtile.config import Screen
from configmanager.custom01 import statusbar

def get_screens():
    return [
        Screen(
            bottom = statusbar.get()
        )
    ]