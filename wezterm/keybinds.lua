local M = {}
local wezterm  = require "wezterm"
local act = wezterm.action
local utils = require "utils"
local cheatsheet = require "cheatsheet"

---------------------------------------------------------------
--- keybinds
---------------------------------------------------------------
M.tmux_keybinds = {
    { key = "k", mods = "ALT", action = act({ SpawnTab = "CurrentPaneDomain" }) },
    { key = "j", mods = "ALT", action = act({ CloseCurrentTab = { confirm = true } }) },
    { key = "h", mods = "ALT", action = act({ ActivateTabRelative = -1 }) },
    { key = "l", mods = "ALT", action = act({ ActivateTabRelative = 1 }) },
    { key = "h", mods = "ALT|CTRL", action = act({ MoveTabRelative = -1 }) },
    { key = "l", mods = "ALT|CTRL", action = act({ MoveTabRelative = 1 }) },
    {
        key = "k",
        mods = "ALT|CTRL",
        action = act.Multiple({ act.CopyMode("ClearSelectionMode"), act.ActivateCopyMode, act.ClearSelection }),
    },
    { key = "j", mods = "ALT|CTRL", action = act({ PasteFrom = "PrimarySelection" }) },
    { key = "1", mods = "ALT", action = act({ ActivateTab = 0 }) },
    { key = "2", mods = "ALT", action = act({ ActivateTab = 1 }) },
    { key = "3", mods = "ALT", action = act({ ActivateTab = 2 }) },
    { key = "4", mods = "ALT", action = act({ ActivateTab = 3 }) },
    { key = "5", mods = "ALT", action = act({ ActivateTab = 4 }) },
    { key = "6", mods = "ALT", action = act({ ActivateTab = 5 }) },
    { key = "7", mods = "ALT", action = act({ ActivateTab = 6 }) },
    { key = "8", mods = "ALT", action = act({ ActivateTab = 7 }) },
    { key = "9", mods = "ALT", action = act({ ActivateTab = 8 }) },
    { key = "g", mods = "ALT", action = act.SpawnCommandInNewTab({ args = { "lazygit" } }) },
    -- ペイン分割
    { key = "\\", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "-",  mods = "ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    -- ペイン移動
    { key = "LeftArrow",  mods = "ALT", action = act.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },
    { key = "UpArrow",    mods = "ALT", action = act.ActivatePaneDirection("Up") },
    { key = "DownArrow",  mods = "ALT", action = act.ActivatePaneDirection("Down") },
    -- ペインサイズ変更
    { key = "LeftArrow",  mods = "ALT|CTRL", action = act.AdjustPaneSize({ "Left", 5 }) },
    { key = "RightArrow", mods = "ALT|CTRL", action = act.AdjustPaneSize({ "Right", 5 }) },
    { key = "UpArrow",    mods = "ALT|CTRL", action = act.AdjustPaneSize({ "Up", 5 }) },
    { key = "DownArrow",  mods = "ALT|CTRL", action = act.AdjustPaneSize({ "Down", 5 }) },
}

M.default_keybinds = {
    { key='C', mods='CTRL', action=act.CopyTo 'Clipboard' },
    { key='F9', mods='ALT', action=act.ShowTabNavigator },
    { key = "f", mods = "ALT", action = act.Search({ CaseInSensitiveString = "" }) },
    -- キーバインド一覧を新規タブに表示
    { key = "?", mods = "ALT|SHIFT", action = cheatsheet.action() },
    { key = "?", mods = "ALT", action = cheatsheet.action() },
}

function M.create_keybinds()
    return utils.merge_lists(M.default_keybinds, M.tmux_keybinds)
end

M.mouse_bindings = {
    {
        event = { Up = {streak = 1, button = "Left" } },
        mods = "NONE",
        action = act({ CompleteSelection = "PrimarySelection" }),
    },
    {
        event = { Up = {streak = 1, button = "Right" } },
        mods = "NONE",
        action = act({ CompleteSelection = "Clipboard" }),
    },
    {
        event = { Up = {streak = 1, button = "Left" } },
        mods = "CTRL",
        action = "OpenLinkAtMouseCursor",
    },
}

return M