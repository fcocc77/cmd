import XMonad

-- Layout
import XMonad.Layout.Spiral
import XMonad.Layout.Spacing
import Data.Ratio ((%))
import XMonad.Layout.Grid



my_workspaces = ["code", "web", "shell", "misc1", "irc", "im", "misc2"]


my_layouts = spacing 10 $ layout_tall ||| layout_full
	where
		layout_tall = Tall 1 (3/100) (1/2)
		layout_full = Grid 

main = do
	xmonad $ def
		{ modMask = mod4Mask -- usar tecla windows en vez de alt
		, terminal = "gnome-terminal" -- terminal predeterminado
		, workspaces = my_workspaces
		, layoutHook = my_layouts
		}

