import os
import re
import subprocess

def window_is_fullscreen(window_id: int) ->bool:
    result = subprocess.run(['xprop', '-id', str(window_id), '_NET_WM_STATE'], \
            stdout=subprocess.PIPE)

    result = str(result.stdout)

    if 'MAXIMIZED' in result:
        return True

    return False

def move_window(window_id: int, x: int, y: int, width: int, height: int):
    values = {
        'gravity': 0,
        'pos_x': x,
        'pos_y': y,
        'size_x': width,
        'size_y': height,
        'id': hex(window_id)
    }

    if window_is_fullscreen(window_id):
        remove_maximized = 'wmctrl -i -r "{id}" -b remove,maximized_vert,maximized_horz'.format(**values)
        os.system(remove_maximized)

    cmd = 'wmctrl -i -r "{id}" -e {gravity},{pos_x},{pos_y},{size_x},{size_y}'.format(**values)
    os.system(cmd)

def get_current_workspace():
    result = subprocess.run(['wmctrl', '-d'], stdout=subprocess.PIPE)

    current: str = ''
    for line in result.stdout.splitlines():
        if '*' in line.decode():
            current = line.decode()
            break

    _current = current.split(' ')
    index: int = int(_current[0])
    size: str = _current[4]
    width: int = int(size.split('x')[0])
    height: int = int(size.split('x')[1])

    return (index, width, height)

def workspace_move_left():

    current: int = get_current_workspace()[0]
    os.system('xdotool set_desktop ' + str(current - 1))

def workspace_move_right():

    current: int = get_current_workspace()[0]
    os.system('xdotool set_desktop ' + str(current + 1))


def get_windows(workspace: int) -> list:
    result = subprocess.run(['wmctrl', '-l'], stdout=subprocess.PIPE)

    windows: list = []

    for line in result.stdout.splitlines():
        line = line.decode()
        _line = re.split(r'\s+', line)

        window_id = int(_line[0], 16)
        ws: int = int(_line[1])

        if ws == workspace:
            windows.append(window_id)

    return windows

def get_window_size(window_id: int):

    output = subprocess.run(
            ['xwininfo', '-id', str(window_id)], stdout=subprocess.PIPE)

    result = output.stdout.decode()

    width = int(result.split('Width: ')[-1].split('\n')[0])
    height = int(result.split('Height: ')[-1].split('\n')[0])

    return(width, height)


def get_height_panels() -> int:
    #  obtiene la suma del tamaño en y de todos los panels

    height = 0
    for panel in get_windows(-1):
        size = get_window_size(panel)

        if (size[1] < 300):
            height += size[1]

    return height


def get_active_window() -> int:
    output = subprocess.run(
            ['xdotool', 'getactivewindow'], stdout=subprocess.PIPE)

    return int(output.stdout.decode())

def move_active_window(x: int, y: int, width: int, height: int):
    move_window(get_active_window(), x, y, width, height)

    get_height_panels()

def set_focus(window_id: int):
    os.system('wmctrl -i -a ' + hex(window_id))


def cycle_focus(reverse: bool = False):
    windows = get_windows(get_current_workspace()[0])
    active_window = get_active_window()

    current_index = windows.index(active_window)

    if reverse:
        index = current_index - 1
        if index < 0:
            index = len(windows) - 1
    else:
        index = current_index + 1
        if index >= len(windows):
            index = 0

    set_focus(windows[index])




