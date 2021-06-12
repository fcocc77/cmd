from wmctrl import workspace_move_left, workspace_move_right
from sys import argv

action: str = argv[1]

if action == 'workspace_move_left':
    workspace_move_left()

if action == 'workspace_move_right':
    workspace_move_right()
