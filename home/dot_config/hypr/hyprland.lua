-- =============================================================================
-- APPARATUS OS - Hyprland Lua Config
-- Converted from hyprlang for Hyprland 0.56.0+
-- Original: ~/.config/hypr/hyprland.conf
-- =============================================================================

-- ============
-- VARIABLES
-- ============

local terminal = "kitty"
local fileManager = "thunar"
local menu = "walker"
local mainMod = "SUPER"

-- ============
-- MONITORS
-- ============

local monitors = hl.get_monitors()
for _, mon in ipairs(monitors) do
    hl.monitor({ output = mon.name, mode = "preferred", position = "auto", scale = "auto" })
end

-- ============
-- AUTOSTART
-- ============

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("mako")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("hyprctl setcursor Adwaita 24")
    hl.exec_cmd("LIBGL_ALWAYS_SOFTWARE=1 kitty --class apparatus-setup -e /usr/libexec/apparatus/first-login.sh")
end)

-- ===============================
-- ENVIRONMENT VARIABLES
-- ===============================

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- ============
-- LOOK AND FEEL
-- ============

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 4,
        border_size = 2,
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
})

hl.config({
    decoration = {
        rounding = 10,
        active_opacity = 1.0,
        inactive_opacity = 0.95,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
})

hl.config({
    animations = {
        enabled = true,
        bezier = {"myBezier", 0.05, 0.9, 0.1, 1.05},
        animation = {
            "windows", 1, 7, "myBezier",
            "windowsOut", 1, 7, "default", "popin 80%",
            "border", 1, 10, "default",
            "borderangle", 1, 8, "default",
            "fade", 1, 7, "default",
            "workspaces", 1, 6, "default",
        },
    },
})

-- ============
-- LAYOUTS
-- ============

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    layout = {
        single_window_aspect_ratio = {4, 3},
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

-- ============
-- MISC
-- ============

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})

-- ============
-- INPUT
-- ============

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "left",
    action = "workspace",
    workspace = "r+1",
})

hl.gesture({
    fingers = 3,
    direction = "right",
    action = "workspace",
    workspace = "r-1",
})

-- ============
-- KEYBINDINGS
-- ============

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + T", hl.dsp.layout("toggle"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("kitty --class floating-help -e butler help"))

hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output --raw | satty -f -"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m window --raw | satty -f -"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprshot -m region --raw | satty -f -"))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse:down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse:up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ============
-- MEDIA KEYS
-- ============

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"))

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- ============
-- WINDOW RULES
-- ============

hl.window_rule({
    match = {
        class = "^(floating-help)$"
    },
    float = true,
    size = {600, 500},
    center = true
})

hl.window_rule({
    match = {
        class = "^(apparatus-setup)$"
    },
    float = true,
    size = {700, 500},
    center = true
})

hl.window_rule({
    match = {
        class = "^(pavucontrol)$"
    },
    float = true
})

hl.window_rule({
    match = {
        class = "^(nm-connection-editor)$"
    },
    float = true
})

hl.window_rule({
    match = {
        class = "^(blueman-manager)$"
    },
    float = true
})

hl.window_rule({
    match = {
        class = "^(com\\.gabm\\.satty)$"
    },
    float = true
})

hl.window_rule({
    match = {
        class = "^(thunar)$",
        title = "^(File Operation Progress)$"
    },
    float = true
})

hl.window_rule({
    match = {
        class = "^(org\\.gnome\\.Calculator)$"
    },
    float = true
})

-- Ignore maximize requests from apps
hl.window_rule({
    match = {
        class = ".*"
    },
    suppress_event = "maximize"
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false
    },
    no_focus = true
})

-- ============
-- SOURCE THEME
-- ============

-- require("~/.config/hypr/theme.conf")  -- Commented out, theme loaded separately
