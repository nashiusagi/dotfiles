local wezterm = require 'wezterm'
package.path = package.path..';'..os.getenv("HOME")..'/dotfiles/wezterm/?.lua'
local keybinds = require 'keybinds'
local utils = require 'utils'
local cheatsheet = require 'cheatsheet'
local act = wezterm.action

-- 設定読み込みのたびにチートシートを書き出す (ALT+? で表示)
cheatsheet.dump()

-- Claude Code応答通知の状態
local bell_tabs = {}

local function make_font()
    return wezterm.font_with_fallback({
        'MesloLGS NF',
        'Noto Sans Mono CJK JP',
        'Noto Color Emoji',
    })
end

wezterm.on('update-right-status', function(window, pane)
    local date = wezterm.strftime '%a %b %-d %H:%M '
    local bat = ''
    for _, b in ipairs(wezterm.battery_info()) do
        bat = '🔋' .. string.format('%.0f%%', b.state_of_charge * 100)
    end
    window:set_right_status(wezterm.format{
        { Text = bat .. '   ' .. date },
    })
end)

-- Claude Code Stop/Notificationフック経由で発火する
wezterm.on('bell', function(window, pane)
    local tab = pane:tab()
    if tab then
        bell_tabs[tostring(tab:tab_id())] = true
    end
end)

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local title = tab.active_pane.title
    local tab_id = tostring(tab.tab_id)

    if tab.is_active then
        -- アクティブタブに切り替えたらbell状態をクリア
        bell_tabs[tab_id] = nil
        return title
    end

    if bell_tabs[tab_id] then
        return {
            { Background = { Color = '#f5a623' } },
            { Foreground = { Color = '#1a1a1a' } },
            { Text = ' ● ' .. title .. ' ' },
        }
    end

    return title
end)

return {
    ----------------------------------------------------
    -- fundamental settings
    ----------------------------------------------------
    use_ime = true,
    set_environment_variables = {
        XMODIFIERS = '@im=ibus',
        GTK_IM_MODULE = 'ibus',
        QT_IM_MODULE = 'ibus',
    },
    hide_tab_bar_if_only_one_tab = false,
    exit_behavior = 'Close',
    enable_scroll_bar = true,
    scrollback_lines = 10000,

    ----------------------------------------------------
    -- keys
    ----------------------------------------------------
    keys = utils.merge_lists(keybinds.create_keybinds(), {
        {
            key = "t", mods = "ALT",
            action = wezterm.action_callback(function(win, pane)
                local overrides = win:get_config_overrides() or {}
                if overrides.window_background_opacity == 1.0 then
                    overrides.window_background_opacity = 0.85
                else
                    overrides.window_background_opacity = 1.0
                end
                win:set_config_overrides(overrides)
            end),
        },
    }),
    mouse_bindings = keybinds.mouse_bindings,

    ----------------------------------------------------
    -- pane
    ----------------------------------------------------
    colors = {
        split = '#00ffff',
    },
    inactive_pane_hsb = {
        saturation = 0.7,
        brightness = 0.8,
    },

    ----------------------------------------------------
    -- appearance
    ----------------------------------------------------
    window_background_opacity = 0.85,

    ----------------------------------------------------
    -- fonts
    ----------------------------------------------------
    font = make_font(),
    font_size = 13,
    line_height = 1.0,

    ----------------------------------------------------
    -- session
    ----------------------------------------------------
    unix_domains = {
        { name = "unix" },
    },
    default_gui_startup_args = { "connect", "unix" },
}
