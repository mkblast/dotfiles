
###################################################
##################### My qTile ####################
###################################################

# Importing python/qtile libraries:

import os
import re
import socket
import subprocess
import os.path
from libqtile.config import Key, Screen, Group, Match, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.widget import Spacer, base
from typing import List  # noqa: F401

# Set Default modkey:
mod = "mod4"


def init_keys():
    keys = [

        # Change Focus:
        Key([mod], "h", lazy.layout.left()),
        Key([mod], "l", lazy.layout.right()),
        Key([mod], "j", lazy.layout.down()),
        Key([mod], "k", lazy.layout.up()),
        # Swap places:
        Key([mod, "shift"], "h", lazy.layout.swap_left()),
        Key([mod, "shift"], "l", lazy.layout.swap_right()),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
        Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
        Key([mod], "w", lazy.to_screen(0)),
        Key([mod], "y", lazy.to_screen(1)),
        Key([mod, "shift"], "w", lazy.window.to_screen(0)),
        Key([mod, "shift"], "y", lazy.window.to_screen(1)),
    
    
        # Resize keys:
        Key([mod], "i", lazy.layout.grow()),
        Key([mod], "m", lazy.layout.shrink()),
        Key([mod], "n", lazy.layout.normalize()),
        Key([mod], "o", lazy.layout.maximize()),
        # Move the master pane Left/Right:
        Key([mod, "shift"], "space", lazy.layout.flip()),
        # Toggel fullscreen on/off:
        Key([mod], "f", lazy.window.toggle_fullscreen()),
    
        # Change Layout:
        Key([mod], "Tab", lazy.next_layout()),
        # Close focused window:
        Key([mod], "q", lazy.window.kill()),
    
        # Restart qtile in place:
        Key([mod, "control"], "r", lazy.restart()),
        # Kill qtile
        Key([mod, "control"], "q", lazy.shutdown()),
    
        # Open a run prompt:
        # Key([mod], "r", lazy.spawncmd()),
    
        # Applications/Scripts Shortcuts:
        Key([mod], "Return", lazy.spawn("alacritty")),
        Key([mod, "shift"], "f", lazy.spawn("firefox")),
        Key([mod, "shift"], "b", lazy.spawn("pcmanfm")),
        Key([mod], "d", lazy.spawn("rofi -show drun ")),
    
        # Backlight control:
        Key([mod], "Down", lazy.spawn("light -U 5")),
        Key([mod], "Up", lazy.spawn("light -A 5")),
    
        # Volume control:
        Key([mod], "Left", lazy.spawn("amixer -c 0 -q set Master 2dB-")),
        Key([mod], "Right", lazy.spawn("amixer -c 0 -q set Master 2dB+")),
    
        # Change keyboard layout:
        Key([mod], "space", lazy.widget["keyboardlayout"].next_keyboard())

        ]
    return keys


keys = init_keys()

groups = [
    Group(
        "ampersand",
        label=""
    ),
    Group(
        "eacute",
        matches=[Match(wm_class=["firefox"])],
        label=""
    ),
    Group(
        "quotedbl",
        matches=[Match(wm_class=["Emacs"])],
        label=""
    ),
    Group(
        "apostrophe",
        matches=[Match(wm_class=["libreoffice"])],
        label=""
    ),
    Group(
        "parenleft",
        matches=[Match(wm_class=["Thunderbird"])],
        label=""
    ),
    Group(
      "section",
        matches=[Match(wm_class=["code-oss"])],
        label=""
    ),
    Group(
        "egrave",
        label=""
    ),
    ]


for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = move focused window to group
        Key([mod, "control"], i.name, lazy.window.togroup(i.name)),

        # mod1 + control +letter of  group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name) , lazy.group[i.name].toscreen()),
    ])

layouts = [
    layout.MonadTall(
        border_focus = "ebcb8b",
        border_normal = "5e81ac",
        border_width = 2,
        margin = 5,
    ),
    layout.MonadWide(
        border_focus = "ebcb8b",
        border_normal = "5e81ac",
        border_width = 2,
        margin = 5,
    ),
]

widget_defaults = dict(
    font='Ubuntu',
    fontsize=12,
    padding=4,
    background="2e3440",
    foreground="5e81ac",
)
extension_defaults = widget_defaults.copy()

def get_bar():
    return bar.Bar([
       widget.GroupBox(
           active = "ebcb8b",
           inactive = "88c0d0",
           this_current_screen_border = "bf616a",
           highlight_method = "line",
           highlight_color=["2e3440", "2e3440"],
           center_aligned=True,
       ),
       widget.TextBox(
           text='|',
           foreground="bf6a6a"
       ),
       # widget.Prompt(
       #     prompt='Run:',
       # ),
       # widget.TaskList(
       #    foreground = "2e3440",
       #    border = "5e81ac",
       #    fontsize = 11,
       #    unfocused_border = "b48ead",
       #    highlight_method = "block",
       #    max_title_width=100,
       #    title_width_method="uniform",
       #    icon_size = 13,
       #     rounded=False,
       # ), 

       widget.Spacer(bar.STRETCH),
             widget.TextBox(
           text='|',
           foreground="8fbcbb",
       ),

       widget.CurrentLayout(
            foreground='a3be8c',
       ),

       widget.TextBox(
           text='|',
           foreground="8fbcbb",
       ),

       widget.TextBox(
           text='',
           foreground="8fbcbb",
       ),
       widget.KeyboardLayout(
           foreground="8fbcbb",
           configured_keyboards=["fr", "ara"],
           display_map={
               'fr': 'FR',
               'ara': 'AR'
               },
       ),
       widget.TextBox(
           text='|',
           foreground="5e81ac",
       ),
       # widget.TextBox(
       #     text='',
       #     foreground="5e81ac",
       # ),
       # widget.Battery(
       #     format = '{percent:2.0%}'
       # ),
       # widget.TextBox(
       #     text='|',
       #     foreground="ebcb8b",
       # ),
       # widget.TextBox(
       #     text='',
       #     foreground="ebcb8b",
       # ),

       widget.TextBox(
           text='Vol:',
           foreground="ebcb8b",
       ),
       widget.Volume(
           foreground="ebcb8b",
       ),
       # widget.TextBox(
       #     text='|',
       #     foreground="88c0d0",
       # ),
       # widget.TextBox(
       #     text='',
       #     foreground="88c0d0",
       # ),

       # widget.Backlight(
       #     foreground="88c0d0",
       #     backlight_name="intel_backlight",
       # ),
       widget.TextBox(
           text='|',
           foreground="a3be8c",
       ),

       widget.Clock(
           format='%Y-%m-%d %a %I:%M %p',
           foreground = "a3be8c",
       ),
       widget.TextBox(
           text='|',
           foreground="bf6a6a",
       ),
       # widget.TextBox(
       #     text='',
       #     foreground="bf6a6a",
       # ),
       # widget.Wlan(
       #     foreground="bf6a6a",
       #     interface="wlp3s0",
       #     format="{essid}",
       # ),
       widget.Systray(
       ),

       widget.TextBox(
           text='',
           foreground="ebcb8b",
       ),

    ], 26, background="2e3440")


screens = [
    Screen(top=get_bar()),
    Screen(),
]
            
# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
# Use xprop to get the informations
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'Open File'},
    {'wname': 'Authentication'},
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
], fullscreen_border_width = 0, border_focus = "ebcb8b", border_normal = "5e81ac")


auto_fullscreen = True
focus_on_window_activation = "smart"


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])


wmname = "LG3D"
