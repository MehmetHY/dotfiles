class Empty():
    pass

def get_defualt_widget_theme():
    return dict(
        font="sans",
        fontsize=12,
        padding=2
    )

def get_groupbox_theme():
    t = Empty()

    t.font = "Hack NF"
    t.fontsize = 32

    return t

def get_clock_theme():
    t = Empty()

    t.format = "%d-%m-%Y %a %H:%M"
    t.fontsize = 16

    return t
