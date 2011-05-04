--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--
 
import XMonad
import System.IO
import System.Exit

import XMonad.ManageHook
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import XMonad.Layout.ShowWName
-- import XMonad.Layout.LayoutHints

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers
--import XMonad.Actions.GridSelect
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Config.Gnome
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
import XMonad.Config.Desktop (desktopLayoutModifiers)

import XMonad.Util.NamedScratchpad

import qualified XMonad.StackSet as W
import qualified Data.Map        as M
 
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "gnome-terminal"
 
-- Width of the window border in pixels.
--
myBorderWidth   = 1
 
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod4Mask
 
-- The mask for the numlock key. Numlock status is "masked" from the
-- current modifier status, so the keybindings will work with numlock on or
-- off. You may need to change this on some systems.
--
-- You can find the numlock modifier by running "xmodmap" and looking for a
-- modifier with Num_Lock bound to it:
--
-- > $ xmodmap | grep Num
-- > mod2        Num_Lock (0x4d)
--
-- Set numlockMask = 0 if you don't have a numlock key, or want to treat
-- numlock status separately.
--
myNumlockMask   = 0
 
-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = --
myWorkspaces    = ["web", "mail", "im", "code"] ++ ["5", "6", "7", "8", "9"] ++ ["social"]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#BDBDBD"
myFocusedBorderColor = "#BDBDBD"
 
------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
 
    -- launch a terminal
    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)
 
    -- lunch kupfer
    -- , ((modm,               xK_p     ), spawn "kupfer")
    -- Gnome-Do is Mono bloated
    -- Kupfer it's very nice but suffer for some fucking
    -- memory problem
    -- Synapse seems to doing it right til now
    , ((modm,               xK_p     ), spawn "synapse")

    --, ((modm,               xK_p     ), spawn "gnome-do")

    -- lock screen
    , ((controlMask .|. mod1Mask,    xK_l     ), spawn "gnome-screensaver-command -l")
 
    -- launch gmrun
    -- , ((modm .|. shiftMask, xK_p     ), spawn "gnome-do")
 
    -- close focused window 
    , ((modm .|. shiftMask, xK_c     ), kill)
 
     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)
 
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
 
    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)
 
    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)
 
    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)
 
    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )
 
    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )
 
    -- Swap the focused window and the master window
    , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
 
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
 
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
 
    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)
 
    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Remove docks
    , ((modm              , xK_b     ), sendMessage $ ToggleStruts)
 
    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
 
    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
 
    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
 
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
 
    -- Restart xmonad
    , ((modm              , xK_q     ), restart "xmonad" True)

    -- Screenshot
    ,  ((controlMask, xK_Print), spawn "scrot -s")
       
    -- Screenshot   
    ,  ((0, xK_Print), spawn "scrot")

    -- Scratchpads

    , ((modm              , xK_g     ), namedScratchpadAction scratchpads "ipython")

    , ((modm              , xK_m     ), namedScratchpadAction scratchpads "htop")

    , ((modm              , xK_n     ), namedScratchpadAction scratchpads "iotop")

    -- Grid desktop tool
--    , ((modm              , xK_g     ), goToSelected defaultGSConfig)

--    , ((modm              , xK_s     ), spawnSelected defaultGSSpawnConfig ["pidgin", "firefox", "digikam", "muttc"])
    ]
    ++
 
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0])
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
 
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
 
 
------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
 
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w))
 
    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2), (\w -> focus w >> windows W.swapMaster))
 
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w))
 
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]
 
------------------------------------------------------------------------
-- Layouts:
 
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--

myTabConfig = defaultTheme { 
                    inactiveBorderColor = "#FF0000",
                    activeTextColor = "#00FF00"
              }

-- myLayout = avoidStruts $ smartBorders $ showWName $
--  tabbed shrinkText myTabConfig ||| tiled ||| Mirror tiled ||| Full
--  where
     -- default tiling algorithm partitions the screen into two panes
--     tiled   = Tall nmaster delta ratio
 
     -- The default number of windows in the master pane
--     nmaster = 1
 
     -- Default proportion of screen occupied by master pane
--     ratio   = 1/2
 
     -- Percent of screen to increment by when resizing panes
--     delta   = 3/100
 
-- myLayout = desktopLayoutModifiers $ smartBorders $ layoutHints ( simpleTabbed ) ||| layoutHints (Tall 1 0.03 0.5) ||| layoutHints ( Full )
myLayout = desktopLayoutModifiers $ smartBorders $ simpleTabbed ||| Tall 1 0.03 0.5 ||| Full

------------------------------------------------------------------------
-- Window rules:
 
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ manageHook gnomeConfig
      ,title      =? "kupfer"          --> doCenterFloat
      ,title      =? "Deskbar Applet"  --> doCenterFloat
      ,className  =? "gloobus-preview" --> doCenterFloat
      ,className  =? "Gloobus-preview" --> doCenterFloat
      ,className  =? "Do"              --> doIgnore
      ,className  =? "unity-2d-panel"  --> doIgnore
      ,className  =? "unity-2d-launcher"  --> doIgnore
      ,isFullscreen                    --> doFullFloat

--      className =? "MPlayer"        --> doFloat
--    , className =? "Gimp"           --> doFloat
--    , resource  =? "desktop_window" --> doIgnore
--    , resource  =? "kdesktop"       --> doIgnore 
--    , className =? "mumbles"        --> doIgnore 
--    , className =? "Mumbles"        --> doIgnore 
--    , className =? "/usr/lib/gnome-do/Do.exe"             --> doIgnore 
--    , className =? "Kupfer.py"      --> doCenterFloat
--    , className =? "chromium-browser" --> doShift "www"
--    , className =? "Firefox" --> doShift "www"
--    , className =? "Pidgin" --> doShift "im"
--    , className =? "gwibber" --> doShift "social"
    ]
 
-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
 
------------------------------------------------------------------------
-- Status bars and logging
 
-- Perform an arbitrary action on each internal state change or X event.
-- See the 'DynamicLog' extension for examples.
--
-- To emulate dwm's status bar
--
-- > logHook = dynamicLogDzen
--
 
------------------------------------------------------------------------
-- Startup hook
 
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = startupHook gnomeConfig >> setWMName "LG3D"
 
scratchpads = [ 
    NS "ipython" "gnome-terminal --title='sc-python'" (title =? "sc-python") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
  , NS "htop" "gnome-terminal -e htop --title='sc-htop'" (title =? "sc-htop") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
  , NS "iotop" "gnome-terminal -e iotop --title='sc-iotop'" (title =? "sc-iotop") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
              ]

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.
 
-- Run xmonad with the settings you specify. No need to modify this.
main = do
    xmonad $ gnomeConfig {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        numlockMask        = myNumlockMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
 
      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
 
      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = manageDocks <+> namedScratchpadManageHook scratchpads <+> myManageHook,
        startupHook        = myStartupHook
}
