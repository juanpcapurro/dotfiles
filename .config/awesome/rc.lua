-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
require("awful.remote")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local scratch = require("scratch")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

local vicious = require("vicious")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    print(awesome.startup_errors)
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_xdg_config_home() .. "awesome/zenburn/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "urxvt -e tmux"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
}
-- }}}

-- {{{ Wibar

local battery_bar = wibox.widget.progressbar({direction="east"})
local battery_text = wibox.widget{widget = wibox.widget.textbox, align="center"}

-- Create wibox with batwidget
local batbox = wibox.widget {
    {
        {
            {
                max_value = 1, widget =  battery_bar,
                border_width = 1, border_color = "#000000",
                color = { type = "linear",
                    from = { 0, 0 },
                    to = { 0, 60 },
                stops = { { 0, "#83c23b" }, { 1, "#FF5656" } } },
            },
            layout=wibox.container.rotate,
            direction="south"
        },
        battery_text,
        layout=wibox.layout.stack
    },
    layout=wibox.container.margin, forced_width=60,
    top=2, bottom=2, left=3, right=3
}

-- Register battery widget
vicious.register( battery_bar, vicious.widgets.bat, "$2", 61, "BAT0")
vicious.register( battery_text, vicious.widgets.bat, "<span foreground=\"black\" weight=\"bold\">$1$3</span>", 61, "BAT0")

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if not c == client.focus then
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

local displays = {
    left= "eDP-1",
    aux= "eDP-1",
    right= "eDP-1",
}

local configureDisplays = function()
    if screen:instances() == 3 then
        displays.left= "DP-1-1"
        displays.aux= "eDP-1"
        displays.right= "DP-1-3"
    elseif screen:instances() == 2 then
        displays.left= "HDMI-1"
        displays.aux= "eDP-1"
        displays.right= "HDMI-1"
    else
        displays.left= "eDP-1"
        displays.aux= "eDP-1"
        displays.right= "eDP-1"
    end
end

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)
    configureDisplays()

    -- Each screen has its own tag table.
    awful.tag({ "1: WEB", "2: TERM", "3: PLAY", "4: APP", "5", "6: IM", "7: VIM", "8", "9: WEB" }, s, awful.layout.layouts[1])

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "bottom", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            batbox,
            wibox.widget.systray(),
        },
    }
end)
-- }}}

-- {{{ Key bindings
--
local reapply_rules = function()
    awesome.restart()
    for _, c in ipairs(client.get()) do
        awful.rules.apply(c)
    end
end
globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey,           }, ".",
        function ()
            if awful.client.focused then
                awful.client.focused:emit_signal("unfocus")
            end
            awful.screen.focus_bydirection("right")
        end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey,           }, ",", function () awful.screen.focus_bydirection("left") end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    -- Standard program
    awful.key({ modkey, "Shift"   }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "r", reapply_rules,
              {description = "reapply rules", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey,           }, "n",     function () scratch.toggle("urxvt -name urxvt-logbook -e nvim ~/logbook", {instance= "urxvt-logbook"})    end,
              {description = "toggle logbook scratchpad", group = "layout"}),
    -- display managin'
    awful.key({ modkey, "Control" },            "x",
        function ()
            awful.spawn.easy_async_with_shell("display_standalone ; sleep 0.5", reapply_rules)
        end,
              {description = "undock", group = "display management"}),
    awful.key({ modkey },   "x",
        function ()
            awful.spawn.easy_async_with_shell("display_home_dock ; sleep 0.5", reapply_rules)
            awful.spawn("remapkeyboard")
        end,
    -- Prompt
              {description = "dock", group = "display management"}),
    awful.key({ modkey },            "p",     function () awful.spawn("dmenu_run -l 20") end,
              {description = "run good ol dmenu", group = "launcher"})
)

local move_to_screen = function (client, direction)
    local screen = client.screen
    local i = client.first_tag.index
    local next_screen = client.screen:get_next_in_direction(direction)
    client:move_to_screen(next_screen)
    local tag = client.screen.tags[i]
    client:move_to_tag(tag)
    awful.screen.focus(screen)
end

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey,           }, "q",      function (c) c:kill()                          end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Shift"   }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey,           }, "Return", function (c) c:swap(awful.client.getmaster())  end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey, "Shift"   }, ",", function (c) move_to_screen(c, "left") end,
            {description = "move to screen  --", group = "client"}),
    awful.key({ modkey, "Shift"   }, ".",  function (c) move_to_screen(c, "right") end,
            {description = "move to screen  ++", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },
    { rule = { instance = "urxvt-logbook" }, properties = {
        floating = true,
        x = 1080, -- not enough lua-fu nor awesome-fu to not hardcode this simple rule
        y = 525,
        width = 800,
        height = 500,
        placement = awful.placement.centered
    }},
    { rule = { class = "Firefox-esr" }, properties = { tag = "4: APP", screen = displays.left} },
    { rule_any = { name = {"Telegram"}, class = {"qTox"} }, properties = { tag = "6: IM", screen = displays.right } },
    { rule = { class = "nvim-qt" }, properties = { tag = "7: VIM", screen = displays.right} },
    { rule = { class = "qutebrowser" }, properties = { tag = "9: WEB", screen = displays.left } },
    { rule = { instance="urxvt" }, properties = { tag = "2: TERM", screen = displays.left} },
    { rule = { instance = "urxvt-cmus" }, properties = { tag = "3: PLAY", screen = displays.aux} },
    { rule = { instance = "urxvt-irssi" }, properties = { tag = "6: IM", screen = displays.aux} },
    { rule_any = { class = { "mpv", "vlc" } }, properties = { tag = "3: PLAY" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
