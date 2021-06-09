from wmctrl import *

ws, width, height = get_current_workspace();
windows = get_windows(ws)

window_width: int = int(width / len(windows))

pos_x: int = 0
for window in windows:

    move_window(window, pos_x, 0, window_width, 500)
    pos_x += window_width

