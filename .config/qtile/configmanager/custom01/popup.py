from libqtile.config import Group, ScratchPad, DropDown
from configmanager.custom01.uservars import terminal

popups = [
        ScratchPad("scratchpad", [
            DropDown("dropdown-terminal", terminal, height = 0.2, width = 0.3, x = 0.0, y = 0.8)
        ])
]