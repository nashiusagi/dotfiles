local wezterm = require 'wezterm'
package.path = package.path..';'..os.getenv("HOME")..'/dotfiles/wezterm/?.lua'
local keybinds = require 'keybinds'
local utils = require 'utils'
local act = wezterm.action
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

-- Claude Code応答通知の状態
local bell_tabs = {}

-- 15分ごとに自動保存
resurrect.state_manager.periodic_save()

-- 自動保存のたびにcurrent_stateも更新（gui-startupでの自動復元に必要）
wezterm.on("resurrect.state_manager.periodic_save.finished", function()
    resurrect.state_manager.write_current_state(wezterm.mux.get_active_workspace(), "workspace")
end)

-- PC再起動後の自動復元
wezterm.on("gui-startup", function(cmd)
    resurrect.state_manager.resurrect_on_gui_startup()
end)

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

    ----------------------------------------------------
    -- keys
    ----------------------------------------------------
    keys = utils.merge_lists(keybinds.create_keybinds(), {
        {
            key = "s", mods = "ALT",
            action = wezterm.action_callback(function(win, pane)
                local state = resurrect.workspace_state.get_workspace_state()
                resurrect.state_manager.save_state(state)
                resurrect.state_manager.write_current_state(wezterm.mux.get_active_workspace(), "workspace")
            end),
        },
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
        {
            key = "r", mods = "ALT",
            action = wezterm.action_callback(function(win, pane)
                resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
                    local state_type = string.match(id, "^([^/]+)")
                    id = string.match(id, "([^/]+)$")
                    id = string.gsub(id, "%.json$", "")
                    local state = resurrect.state_manager.load_state(id, state_type)
                    if state_type == "workspace" then
                        resurrect.workspace_state.restore_workspace(state, {
                            relative_mux_window_index = 0,
                            restore_text = true,
                        })
                    elseif state_type == "window" then
                        resurrect.window_state.restore_window(pane:window(), state)
                    elseif state_type == "tab" then
                        resurrect.tab_state.restore_tab(pane:tab(), state)
                    end
                end)
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
