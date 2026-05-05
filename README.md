## NixOS and Home Manager Config

Personal NixOS and Home Manager config.


## Get started

Clone the repository into `~/.config/home-manager/`.


### Home Manager

To build and activate Home Manager:
```bash
nh home switch . --ask
```


### NixOS

To build and activate NixOS (system):
```bash
sudo nh os switch .#tina --ask
```


### Both!

To build & switch both, one after the other, run the following:
```bash
nh os switch .#tina --ask && nh home switch . --ask
```
