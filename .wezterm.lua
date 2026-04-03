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
    -- fonts
    ----------------------------------------------------
    font = make_font(),
    font_size=13,
    line_height=1.0,
}
