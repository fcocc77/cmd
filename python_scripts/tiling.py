from wmctrl import *

padding: int = 0
pannels_height = 100

ws, width, height = get_current_workspace();
#  height -= pannels_height

windows = get_windows(ws)
count: int = len(windows)

window_width: int = int(width / count)
#  window_height: int = int(height / count)


pos_y: int = int(padding / 2)

if count == 2:
    window_width: int = int(width / count)
    window_width -= padding

    pos_x: int = int(padding / 2)

    for window in windows:

        move_window(window, pos_x, 0, window_width, height)
        pos_x += window_width + padding

elif count == 3:

    window_width: int = int(width / 2)
    window_height: int = int(height / 2)

    window_width -= padding
    window_height -= padding

    pos_x: int = int(padding / 2)


    move_window(windows[0], pos_x, 0, window_width, window_height)

    pos_x += window_width + padding
    move_window(windows[1], pos_x, 0, window_width, window_height)

    pos_y = window_height + pannels_height

    move_window(windows[2], 0, pos_y, width, window_height)
