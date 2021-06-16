from wmctrl import workspace_move_left, workspace_move_right, move_active_window, get_resolution, move_focus
from sys import argv

action: str = argv[1]

resolution = get_resolution()
width = resolution[0]
height = resolution[1]
padding = (8, 55)

def to_top_right():
    size_x: int = int(width / 2) - padding[0]
    size_y: int = int(height / 2) - padding[1]

    move_active_window(width, 0, size_x, size_y)


def to_top_left():
    size_x: int = int(width / 2) - padding[0]
    size_y: int = int(height / 2) - padding[1]

    move_active_window(0, 0, size_x, size_y)


def to_bottom_right():
    size_x: int = int(width / 2) - padding[0]
    size_y: int = int(height / 2) - padding[1]

    move_active_window(width, size_y + padding[1] + 1, size_x, size_y)


def to_bottom_left():
    size_x: int = int(width / 2) - padding[0]
    size_y: int = int(height / 2) - padding[1]

    move_active_window(0, size_y + padding[1] + 1, size_x, size_y)

def to_left():
    size_x: int = int(width / 2) - padding[0]
    size_y: int = height - padding[1]

    move_active_window(0, 0, size_x, size_y)

def to_right():
    size_x: int = int(width / 2) - padding[0]
    size_y: int = height - padding[1]

    move_active_window(width, 0, size_x, size_y)

def to_top():
    size_x: int = width - padding[0]
    size_y: int = int(height / 2) - padding[1]

    move_active_window(width, 0, size_x, size_y)

def to_bottom():
    size_x: int = width - padding[0]
    size_y: int = int(height / 2) - padding[1]

    move_active_window(0, size_y + padding[1] + 1, size_x, size_y)

if action == 'workspace_move_left':
    workspace_move_left()

elif action == 'workspace_move_right':
    workspace_move_right()

elif action == 'to_top_right':
    to_top_right()

elif action == 'to_top_left':
    to_top_left()

elif action == 'to_bottom_right':
    to_bottom_right()

elif action == 'to_bottom_left':
    to_bottom_left()

elif action == 'to_left':
    to_left()

elif action == 'to_right':
    to_right()

elif action == 'to_top':
    to_top()

elif action == 'to_bottom':
    to_bottom()

elif action == 'left_focus':
    move_focus('left')

elif action == 'right_focus':
    move_focus('right')

elif action == 'top_focus':
    move_focus('top')

elif action == 'bottom_focus':
    move_focus('bottom')
