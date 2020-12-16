import XMonad

-- Layout
import XMonad.Layout.Spiral
import XMonad.Layout.Spacing
import Data.Ratio ((%))
import XMonad.Layout.Grid
import XMonad.Util.Run(spawnPipe)

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import XMonad.Actions.Volume
import Data.Map    (fromList)
import Data.Monoid (mappend)

import XMonad.Config.Gnome
import XMonad.Hooks.ManageHelpers -- isFullscreen

my_workspaces = ["1 - code", "2 - web", "shell", "misc1", "irc", "im", "misc2"]


my_layouts = spacing 10 $ layout_tall ||| layout_full
	where
		layout_tall = Tall 1 (3/100) (1/2)
		layout_full = Grid 

alt_key = mod1Mask
win_key = mod4Mask

main = do
	xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Atajos de teclado
shortcut = keys defaultConfig `mappend` \c -> fromList
	[
		-- Volumen
		((0, xK_F11), lowerVolume 4 >> return ()),
		((0, xK_F12), raiseVolume 4 >> return ()),

		-- Aplicaciones
		((win_key, xK_f), spawn "nautilus"),
		((win_key, xK_g), spawn "google-chrome"),
		((win_key, xK_t), spawn "gnome-terminal"),
		((win_key, xK_v), spawn "gnome-terminal -e \"vim\""),
		((win_key, xK_c), spawn "gnome-calculator")
	]

myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
-- myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main configuration, override the defaults to your liking.
myConfig = def
		{ modMask = win_key -- usar tecla windows en vez de alt
		, terminal = "gnome-terminal" -- terminal predeterminado
		, workspaces = my_workspaces
		, layoutHook = my_layouts
		, keys = shortcut
		}
