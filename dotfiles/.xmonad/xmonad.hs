import XMonad

-- Layout
import XMonad.Layout.Spacing (smartSpacing)
import XMonad.Layout.MultiColumns (multiCol)
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Grid
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoBorders (smartBorders)

-- Hooks
import XMonad.Hooks.DynamicLog (ppTitle, ppCurrent, ppHidden, ppHiddenNoWindows, statusBar, xmobarPP, xmobarColor, shorten)
import XMonad.Hooks.EwmhDesktops (fullscreenEventHook)
 -- Actions
import XMonad.Actions.CycleWS (nextWS, prevWS, toggleWS)
import XMonad.Actions.SinkAll (sinkAll)

-- Misc
import Data.Map (fromList)
import Data.Monoid (mappend)
import Graphics.X11.ExtraTypes.XF86 (xF86XK_AudioMute, xF86XK_AudioLowerVolume, xF86XK_AudioRaiseVolume,
									xF86XK_MonBrightnessDown, xF86XK_MonBrightnessUp,
									xF86XK_KbdBrightnessDown, xF86XK_KbdBrightnessUp)
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------



-- paleta de colores de 'onedark'
black  = "#282c34"
pink   = "#e06c75"
green  = "#98c379"
yellow = "#e5c07b"
blue   = "#61afef"
magent = "#c678dd"
cyan   = "#56b6c2"
grey   = "#abb2bf"
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------



-- Layout
my_workspaces = clickable $ ["CODE", "FILES", "VFX", "WEB", "SOCIAL", "ORG", "MISC"]
	-- con esto permitimos que cada tab sea clickable
	where clickable l = ["<action=`xdotool key super+" ++ show (n) ++ "`>" ++ ws ++ "</action>" | (i,ws) <- zip [1..9] l, let n = i ]
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------



-- smartSpacing y smartBorders solo pone espacios cuando hay mas de 1 ventana
my_layouts = smartBorders
	$ mkToggle (NOBORDERS ?? FULL ?? EOT) -- Isolar ventana
	$ smartSpacing 5
	$ layout_tall ||| layout_grid ||| layout_multi ||| layout_three_col ||| layout_mirror
	where
		layout_tall = Tall 1 (3/100) (1/2)
		layout_grid = Grid
		layout_multi = multiCol [1] 1 0.01 (-0.5)
		layout_three_col = ThreeCol 1 (3/100) (1/2)
		layout_mirror = Mirror (Tall 1 (3/100) (3/5))
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------



-- Atajos de teclado
alt_key = mod1Mask
win_key = mod4Mask
shortcut = keys defaultConfig `mappend` \c -> fromList
	[
		-- Volumen
		((0, xF86XK_AudioMute), spawn "amixer set Master toggle"),
		((0, xF86XK_AudioLowerVolume), spawn "amixer -q sset Master 4%-"),
		((0, xF86XK_AudioRaiseVolume), spawn "amixer -q sset Master 4%+"),


		-- Brillo de pantalla
		((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 10"),
		((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10"),


		-- Brillo de teclado
		((0, xF86XK_KbdBrightnessUp), spawn "echo vfx | sudo -S brightnessctl --device='asus::kbd_backlight' set 1+"),
		((0, xF86XK_KbdBrightnessDown), spawn "echo vfx | sudo -S brightnessctl --device='asus::kbd_backlight' set 1-"),


		-- Aplicaciones
		((win_key, xK_x), spawn "nautilus"),
		((win_key, xK_g), spawn "google-chrome"),
		((win_key, xK_t), spawn "gnome-terminal"),
		((win_key, xK_c), spawn "gnome-calculator"),
		((win_key, xK_o), spawn "sh ~/Documents/develop/my-config/scripts/appfinder.sh"),
		((win_key .|. shiftMask, xK_m), spawn "sh ~/Documents/develop/my-config/scripts/display_switch.sh"),
		((win_key .|. shiftMask, xK_f), sinkAll), -- Encaja nuevamente todas las ventanas flotantes

		((win_key, xK_f), sendMessage $ Toggle FULL), -- Isolar ventana

		-- Workstation Navegation
		((win_key .|. controlMask, xK_k), nextWS),
		((win_key .|. controlMask, xK_j), prevWS),
		((win_key, xK_z), toggleWS)
	]
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


-- XMobar
title_length = 80 -- largo maximo de titulo de aplicacion
myPP = xmobarPP
	{
		ppTitle = xmobarColor pink "" . shorten title_length,
		ppCurrent = xmobarColor yellow  "" ,
		ppHidden = xmobarColor grey "", -- color de tab no visible
		ppHiddenNoWindows = xmobarColor grey "" -- matiene siempre visible todos los tabs
	}

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


-- Composicion de cada aplicacion
myManageHook = composeAll
	[
 		className =?  "Gnome-calculator" --> doFloat,
 		className =?  "Xfce4-appfinder" --> doFloat
	]
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


-- Configuracion principal
myConfig = defaultConfig
	{
		modMask = win_key, -- usar tecla windows en vez de alt
		terminal = "gnome-terminal", -- terminal predeterminado
		workspaces = my_workspaces,
		normalBorderColor = black,
		-- focusedBorderColor = pink,
		layoutHook = my_layouts,
		handleEventHook = fullscreenEventHook, -- permite que funcione el fullscreen
		keys = shortcut,
		manageHook = myManageHook
	}
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


-- Main
main = do
	xmonad =<< statusBar "xmobar" myPP toggleStrutsKey myConfig
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
