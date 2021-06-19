from wmctrl import workspace_move_left, workspace_move_right, move_focus
from sys import argv

action: str = argv[1]

if action == 'workspace_move_left':
    workspace_move_left()

elif action == 'workspace_move_right':
    workspace_move_right()

elif action == 'left_focus':
    move_focus('left')

elif action == 'right_focus':
    move_focus('right')

elif action == 'top_focus':
    move_focus('top')

elif action == 'bottom_focus':
    move_focus('bottom')
