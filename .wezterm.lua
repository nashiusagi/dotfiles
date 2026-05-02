local wezterm = require 'wezterm'
package.path = package.path..';'..os.getenv("HOME")..'/dotfiles/.wezterm/?.lua'
local keybinds = require 'keybinds'
local act=wezterm.action

local function make_font()
    return wezterm.font_with_fallback({
        'MesloLGS NF',
        'Noto Sans Mono CJK JP',
        'Noto Color Emoji',
    })
end

local function set_battery_info()
    wezterm.on('update-right-status',function(window,pane)
        local date=wezterm.strftime '%a %b %-d %H:%M '
        local bat=''
        for _,b in ipairs(wezterm.battery_info()) do
            bat = '🔋'..string.format('%.0f%%',b.state_of_charge*100)
        end

        window:set_right_status(wezterm.format{
            {Text=bat..'   '..date},
        })
    end)
end

-- Claude Code応答通知: bellが来たタブIDを記録する
local bell_tabs = {}

wezterm.on('bell', function(window, pane)
    local tab = pane:tab()
    if tab then
        bell_tabs[tab:tab_id()] = true
        window:active_tab():invalidate()
    end
end)

-- アクティブになったらマーカーをクリアする
wezterm.on('focus-changed', function(window, pane)
    local tab = window:active_tab()
    if tab then
        bell_tabs[tab:tab_id()] = nil
    end
end)

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local title = tab.active_pane.title
    if bell_tabs[tab.tab_id] then
        return '● ' .. title
    end
    return title
end)


return {
    ----------------------------------------------------
    -- fundamental settings
    ----------------------------------------------------
    -- IME support
    use_ime=true,
    set_environment_variables={
        XMODIFIERS='@im=ibus',
        GTK_IM_MODULE='ibus',
        QT_IM_MODULE='ibus',
    },
    -- tab bar
    hide_tab_bar_if_only_one_tab=false,
    -- do not hold on exit by default
    exit_behavior='Close',
    -- scroll bar
    enable_scroll_bar=true,
    set_battery_info(),

    ----------------------------------------------------
    -- keys
    ----------------------------------------------------
    keys = keybinds.create_keybinds(),
    
    mouse_bindings = keybinds.mouse_bindings,

    ----------------------------------------------------
    -- pane
    ----------------------------------------------------
    colors = {
        split = '#00ffff',
    },
    inactive_pane_hsb = {
        saturation = 0.5,
        brightness = 0.6,
    },

    ----------------------------------------------------
    -- fonts
    ----------------------------------------------------
    font = make_font(),
    font_size=13,
    line_height=1.0,
}
