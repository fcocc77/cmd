from wmctrl import workspace_move_left, workspace_move_right, move_active_window \
        ,get_height_panels, cycle_focus
from sys import argv
import os

action: str = argv[1]

width = 1920
height = 1080 - get_height_panels()

def to_top_right():

    size_x: int = int(width / 2)
    size_y: int = int(height / 2)

    move_active_window(width, 0, size_x, size_y)


def to_top_left():
    size_x: int = int(width / 2)
    size_y: int = int(height / 2)

    move_active_window(0, 0, size_x, size_y)

def to_bottom_right():
    size_x: int = int(width / 2)
    size_y: int = int(height / 2)

    move_active_window(width, size_y, size_x, size_y)

def to_bottom_left():
    size_x: int = int(width / 2)
    size_y: int = int(height / 2)

    move_active_window(0, size_y, size_x, size_y)

def left_focus():
    cycle_focus(True)

def right_focus():
    cycle_focus()

if action == 'workspace_move_left':
    workspace_move_left()

elif action == 'workspace_move_right':
    workspace_move_right()

elif action == 'to_top_right':
    to_top_right();

elif action == 'to_top_left':
    to_top_left();

elif action == 'to_bottom_right':
    to_bottom_right();

elif action == 'to_bottom_left':
    to_bottom_left();

elif action == 'left_focus':
    left_focus()

elif action == 'right_focus':
    right_focus()


