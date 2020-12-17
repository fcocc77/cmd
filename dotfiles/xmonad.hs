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
import XMonad.Hooks.EwmhDesktops -- fullscreenEventHook
import XMonad.Layout.NoBorders
import XMonad.Actions.SinkAll



my_workspaces = ["CODE", "WEB", "SOCIAL", "VFX", "FILES"]

-- paleta de colores de 'onedark'
black = "#282c34"
pink = "#e06c75"
green = "#98c379"
yellow = "#e5c07b"
blue = "#61afef"
magent = "#c678dd"
cyan = "#56b6c2"
grey = "#abb2bf"
--

-- smartSpacing y smartBorders solo pone espacios cuando hay mas de 1 ventana
my_layouts = smartBorders $ smartSpacing 10 $ layout_tall ||| layout_grid ||| layout_full
	where
		layout_tall = Tall 1 (3/100) (1/2)
		layout_grid = Grid
		layout_full = Full

alt_key = mod1Mask
win_key = mod4Mask

main = do
	xmonad =<< statusBar "xmobar" myPP toggleStrutsKey myConfig

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
		((win_key, xK_c), spawn "gnome-calculator"),

		((win_key .|. shiftMask, xK_f), sinkAll) -- Encaja nuevamente todas las ventanas flotantes

	]

myTitleColor = pink -- color of window title
myTitleLength = 80 -- truncate window title to this length

myPP = xmobarPP
	{ 
		ppTitle = xmobarColor myTitleColor "" . shorten myTitleLength,
		ppCurrent = xmobarColor yellow "",
		ppHidden = xmobarColor grey "" -- color de tab no visible
	}

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig
	{
		modMask = win_key, -- usar tecla windows en vez de alt
		terminal = "gnome-terminal", -- terminal predeterminado
		workspaces = my_workspaces,
		layoutHook = my_layouts,
		handleEventHook = fullscreenEventHook, -- permite que funcione el fullscreen
		keys = shortcut
	}
