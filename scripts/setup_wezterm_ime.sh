#!/bin/bash
# WezTerm (Flatpak) で日本語IMEを使えるようにする設定
# Flatpakのサンドボックスにibus用の環境変数を注入する

flatpak override --user --env=XMODIFIERS=@im=ibus org.wezfurlong.wezterm
flatpak override --user --env=GTK_IM_MODULE=ibus org.wezfurlong.wezterm
flatpak override --user --env=QT_IM_MODULE=ibus org.wezfurlong.wezterm

echo "WezTerm IME setup done. Restart WezTerm to apply."
