from libqtile import bar, widget
from configmanager.custom01.theme import get_groupbox_theme, get_clock_theme

def get():
    gt = get_groupbox_theme()
    ct = get_clock_theme()

    b = bar.Bar(
        [
            widget.GroupBox(font = gt.font, fontsize = gt.fontsize),
            widget.Prompt(),
            widget.WindowName(),
            widget.CurrentLayout(),
            widget.GenPollText(),
            widget.Systray(),
            widget.Clock(format = ct.format, fontsize = ct.fontsize),
        ],
        24
    )

    return b