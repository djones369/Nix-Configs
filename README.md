# NixOS

## How to change from Stable to UnStable
sudo nix-channel --list

sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos

sudo nixos-rebuild --upgrade switch

sudo reboot
## Change from Plasma 5 to Plasma 6

### Edit /etc/nixos/configuration.nix

If you have any unstable.packagename in your configuration, remove the unstable part.
- It gets in your way at build time.
-Also, rename all KDE packages (Kate, Koko, etc) that you might have installed.

### Set all KDE packages to the new prefix kdePackages., like that:
- kdePackages.kdenlive

### change services.xserver.desktopManager.plasma5.enable = true; by simply replacing the 5 with a 6.
- sudo nix-channel --update
- sudo nixos-rebuild switch

In case you become stuck at a black screen,
or the desktop does not up show otherwise, set this option:
- services.xserver.displayManager.sddm.wayland.enable = true;

sudo nixos-rebuild --upgrade switch

