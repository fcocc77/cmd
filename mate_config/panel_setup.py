import os, re

layout: str = ''
position: int = 0
desktop_locations = [ '/var/lib/snapd/desktop/applications', '/usr/share/applications' ]

def add_menu_bar(panel_id: str):

    global position

    values = {
        'panel_id': panel_id,
        'position': position
    }

    menu_bar: str = '[Object menu-bar-{position}]\n'\
            'object-type=menu-bar\n'\
            'locked=true\n'\
            'toplevel-id={panel_id}\n'\
            'position={position}\n\n'.format(**values)

    global layout
    layout += menu_bar
    position += 1

def add_separator(panel_id: str, right_stick: bool = False):

    global position

    _right_stick = 'false'
    if right_stick:
        _right_stick = 'true'

    values = {
        'panel_id': panel_id,
        'position': position,
        'right_stick': _right_stick
    }

    separator: str = '[Object separator-{position}]\n'\
            'object-type=separator\n'\
            'toplevel-id={panel_id}\n'\
            'locked=true\n'\
            'panel-right-stick={right_stick}\n'\
            'position={position}\n\n'.format(**values)

    global layout
    layout += separator
    position += 1


def add_launcher(app_name: str, panel_id: str):

    global position

    location: str = ''
    for app_dir in desktop_locations:
        location = app_dir + '/' + app_name + '.desktop'
        if os.path.isfile(location):
            break

    values = {
        'location': location,
        'name': app_name.replace('.', '-').replace('_', '-').lower(),
        'panel_id': panel_id,
        'position': position
    }

    launcher: str = '[Object {name}]\n'\
            'object-type=launcher\n'\
            'launcher-location={location}\n'\
            'toplevel-id={panel_id}\n'\
            'locked=true\n'\
            'position={position}\n\n'.format(**values)

    global layout
    layout += launcher
    position += 1

def add_applet(applet_id: str, panel_id: str, right_stick: bool = False):
    global position

    _right_stick = 'false'
    if right_stick:
        _right_stick = 'true'

    name = applet_id.split(':')[-1]

    values = {
        'panel_id': panel_id,
        'applet_id': applet_id,
        'position': position,
        'right_stick': _right_stick,
        'name' : re.sub(r'(?<!^)(?=[A-Z])', '-', name).lower()
    }

    launcher: str = '[Object {name}]\n'\
            'object-type=applet\n'\
            'applet-iid={applet_id}\n'\
            'toplevel-id={panel_id}\n'\
            'panel-right-stick={right_stick}\n'\
            'locked=true\n'\
            'position={position}\n\n'.format(**values)

    global layout
    layout += launcher
    position += 1


def add_panel(panel_id: str, orientation: str, size: int = 24):

    values = {
        'size': size,
        'panel_id': panel_id,
        'orientation': orientation
    }

    panel: str = '[Toplevel {panel_id}]\n'\
            'orientation={orientation}\n'\
            'size={size}\n\n'.format(**values)

    global layout
    layout += panel


add_panel('top', 'top', 27)
add_panel('bottom', 'bottom')

add_menu_bar('top')

add_separator('top')

add_launcher('caja-browser', 'top')
add_launcher('mate-terminal', 'top')
add_launcher('google-chrome', 'top')
add_launcher('pluma', 'top')
add_launcher('mate-calc', 'top')

add_separator('top')

add_launcher('gparted', 'top')
add_launcher('spotify_spotify', 'top')
add_launcher('whatsdesk_whatsdesk', 'top')

add_separator('top')

add_launcher('inkscape', 'top')
add_launcher('com.blackmagicdesign.resolve', 'top')
add_launcher('NukeX', 'top')
add_launcher('blender_blender', 'top')


add_applet('NotificationAreaAppletFactory::NotificationArea', 'top', True)
add_applet('GvcAppletFactory::GvcApplet', 'top', True)
add_applet('WnckletFactory::WorkspaceSwitcherApplet', 'top', True)

add_applet('MultiLoadAppletFactory::MultiLoadApplet', 'top', True)
add_applet('CPUFreqAppletFactory::CPUFreqApplet', 'top', True)

add_separator('top', True)

add_applet('CommandAppletFactory::CommandApplet', 'top', True)

add_separator('top', True)

add_applet('ClockAppletFactory::ClockApplet', 'top', True)

add_applet('BriskMenuFactory::BriskMenu', 'bottom')
add_applet('WnckletFactory::WindowListApplet', 'bottom')
add_applet('WnckletFactory::ShowDesktopApplet', 'bottom', True)

f = open('mate_config/panels.layout', "w")
f.write(layout)
f.close()



















