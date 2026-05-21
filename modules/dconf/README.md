In case home-manager fails, use the following commands to export/import dconf keybinds.


**kbd-settings**
```sh
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > kbd-settings.txt
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < kbd-settings.txt
```

**kbd-shortcuts**
```sh
dconf dump /org/gnome/shell/keybindings/ > kbd-shortcuts.txt
dconf load /org/gnome/shell/keybindings/ < kbd-shortcuts.txt
```

**kbd-wm**
```sh
dconf dump /org/gnome/desktop/wm/keybindings/ > kbd-wm.txt
dconf load /org/gnome/desktop/wm/keybindings/ < kbd-wm.txt
```

**kbd-mutter**
```sh
dconf dump /org/gnome/mutter/keybindings/ > kbd-mutter
dconf load /org/gnome/mutter/keybindings/ < kbd-mutter
```


