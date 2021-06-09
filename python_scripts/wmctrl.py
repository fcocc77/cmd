import os
import re
import subprocess

def window_is_fullscreen(window: str) ->bool:
    result = subprocess.run(['xprop', '-name', window, '_NET_WM_STATE'], stdout=subprocess.PIPE)
    result = str(result.stdout)

    if 'MAXIMIZED' in result:
        return True

    return False

def move_window(window: str, pos_x: int, pos_y: int, size_x: int, size_y: int):
    values = {
        'gravity': 0,
        'pos_x': pos_x,
        'pos_y': pos_y,
        'size_x': size_x,
        'size_y': size_y,
        'window': window
    }

    if window_is_fullscreen(window):
        remove_maximized = 'wmctrl -r "{window}" -b remove,maximized_vert,maximized_horz'.format(**values)
        os.system(remove_maximized)

    cmd = 'wmctrl -r "{window}" -e {gravity},{pos_x},{pos_y},{size_x},{size_y}'.format(**values)
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


def get_windows(workspace: int) -> list:
    result = subprocess.run(['wmctrl', '-lx'], stdout=subprocess.PIPE)

    windows: list = []

    for line in result.stdout.splitlines():
        line = line.decode()
        _line = re.split(r'\s+', line)

        ws: int = int(_line[1])
        if ws == -1:
            continue

        name: str = _line[2]
        host: str = _line[3]

        label: str = line.split(host)[-1].strip()


        if ws == workspace:
            windows.append(label)

    return windows



