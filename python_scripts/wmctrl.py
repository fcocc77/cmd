import os
import re
import subprocess


def window_is_fullscreen(window_id: int) -> bool:
    result = subprocess.run(['xprop', '-id', str(window_id), '_NET_WM_STATE'],
                            stdout=subprocess.PIPE)

    result = str(result.stdout)

    if 'MAXIMIZED' in result:
        return True

    return False


def set_rect(window_id: int, x: int, y: int, width: int, height: int):
    values = {
        'gravity': 0,
        'pos_x': x,
        'pos_y': y,
        'size_x': width,
        'size_y': height,
        'id': hex(window_id)
    }

    if window_is_fullscreen(window_id):
        remove_maximized = 'wmctrl -i -r "{id}" -b remove,maximized_vert,maximized_horz'.format(
            **values)
        os.system(remove_maximized)

    cmd = 'wmctrl -i -r "{id}" -e {gravity},{pos_x},{pos_y},{size_x},{size_y}'.format(
        **values)
    os.system(cmd)


def get_resolution():
    result = subprocess.run(['xwininfo', '-root'], stdout=subprocess.PIPE)
    output = result.stdout.decode()

    width = int(output.split('Width: ')[-1].split('\n')[0])
    height = int(output.split('Height: ')[-1].split('\n')[0])

    return(width, height)

def reset_size_and_center_pos():
    #  ajusta el tamaño al 50% de la pantalla y lo centra
    size = get_resolution()
    width = int(size[0] / 2)
    height = int(size[1] / 2)
    x = int(width / 2)
    y = int(height / 2)

    set_rect(get_active_window(), x, y, width, height)


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


def get_rect(window_id: int):
    output = subprocess.run(
        ['xwininfo', '-id', str(window_id)], stdout=subprocess.PIPE)

    result = output.stdout.decode()

    width = int(result.split('Width: ')[-1].split('\n')[0])
    height = int(result.split('Height: ')[-1].split('\n')[0])
    x = int(result.split('Absolute upper-left X: ')[-1].split('\n')[0])
    y = int(result.split('Absolute upper-left Y: ')[-1].split('\n')[0])

    return(x, y, width, height)


def get_size(window_id: int):
    rect = get_rect(window_id)
    return (rect[2], rect[3])


def get_pos(window_id: int):
    rect = get_rect(window_id)
    return (rect[0], rect[1])


def get_center_pos(window_id: int):
    rect = get_rect(window_id)

    x = rect[0] + (rect[2] / 2)
    y = rect[1] + (rect[3] / 2)

    return (x, y)


def get_height_panels() -> int:
    #  obtiene la suma del tamaño en y de todos los panels

    height = 0
    for panel in get_windows(-1):
        size = get_size(panel)

        if (size[1] < 300):
            height += size[1]

    return height


def get_active_window() -> int:
    output = subprocess.run(
        ['xdotool', 'getactivewindow'], stdout=subprocess.PIPE)

    return int(output.stdout.decode())


def move_active_window(x: int, y: int, width: int, height: int):
    set_rect(get_active_window(), x, y, width, height)

    get_height_panels()


def set_focus(window_id: int):

    active_window = get_active_window()
    if(active_window == window_id):
        return

    f = open('/tmp/lastfocus', 'w')
    f.write(str(active_window))
    f.close()

    os.system('wmctrl -i -a ' + hex(window_id))


def get_last_active() -> int:
    if not os.path.isfile('/tmp/lastfocus'):
        return -1

    f = open('/tmp/lastfocus', 'r')
    active = f.read()
    f.close()

    if active:
        return int(active)
    else:
        return -1


def get_vertical_windows(window_id: int):
    windows = get_windows(get_current_workspace()[0])

    rect = get_rect(window_id)
    win_x1 = rect[0]
    win_x2 = rect[0] + rect[2]

    vertical_windows = []
    for win in windows:
        rect = get_rect(win)
        x1 = rect[0]
        x2 = rect[0] + rect[2]
        y = rect[1]

        if x2 > win_x1 and x1 < win_x2:
            vertical_windows.append((y, win))

    sorted_list = []
    for win in sorted(vertical_windows):
        sorted_list.append(win[1])

    return sorted_list


def get_horizontal_windows(window_id: int):
    windows = get_windows(get_current_workspace()[0])

    rect = get_rect(window_id)
    win_y1 = rect[1]
    win_y2 = rect[1] + rect[3]

    horizontal_windows = []
    for win in windows:
        rect = get_rect(win)
        y1 = rect[1]
        y2 = rect[1] + rect[3]
        x = rect[0]

        if y2 > win_y1 and y1 < win_y2:
            horizontal_windows.append((x, win))

    sorted_list = []
    for win in sorted(horizontal_windows):
        sorted_list.append(win[1])

    return sorted_list


def move_focus(direction: str):

    active_window = get_active_window()
    last_active_window = get_last_active()

    if direction == 'top' or direction == 'bottom':
        windows_list = get_vertical_windows(active_window)
        move_next = direction == 'top'
    else:
        windows_list = get_horizontal_windows(active_window)
        move_next = direction == 'left'

    if not active_window in windows_list:
        index_current_workspace = get_current_workspace()[0]
        windows = get_windows(index_current_workspace)
        if len(windows):
            set_focus(windows[0])

        return

    current_index = windows_list.index(active_window)

    if move_next:
        index = current_index - 1
        if index < 0:
            index = 0

        last_active = last_active_window in windows_list[:current_index]
    else:
        index = current_index + 1
        if index >= len(windows_list):
            index = len(windows_list) - 1

        last_active = last_active_window in windows_list[current_index:]

    if last_active and last_active_window != active_window:
        set_focus(last_active_window)
    else:
        set_focus(windows_list[index])
