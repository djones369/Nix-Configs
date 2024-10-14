# NixOS

## How to change from Stable to UnStable
sudo nix-channel --list

sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos

sudo nixos-rebuild --upgrade switch

sudo reboot
---
## Nix i3
