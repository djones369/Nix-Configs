{ config, pkgs, lib, ... }:

# Home Manager configuration
# ------------------------------------------------------------
# Style guide:
# 1) Top-level identity & state
# 2) Imports (optional: split into modules later)
# 3) XDG & session environment
# 4) Shells & prompt
# 5) Programs / CLI tools
# 6) GUI apps
# 7) Services (HM-managed)
# 8) Files & dotfiles
# 9) Home packages
# ------------------------------------------------------------
{
  ########################################
  # 1) Identity & state
  ########################################
  home.username = "dave";
  home.homeDirectory = "/home/dave";
  # Pin to the HM version you first used; bump only when you accept option changes.
  home.stateVersion = "25.05";

  ########################################
  # 2) Optional module split (uncomment once you create files)
  ########################################
  # imports = [
  #   ./modules/shell.nix
  #   ./modules/dev.nix
  #   ./modules/apps.nix
  #   ./modules/services.nix
  # ];

  ########################################
  # 3) XDG & session
  ########################################
  xdg.enable = true;
  # Add directories to PATH ahead of others
  home.sessionPath = [ "$HOME/.local/bin" "$HOME/bin" ];

  # Common environment variables
  home.sessionVariables = {
    EDITOR = "nano"; # change to "nvim" or "vim" if you prefer
    PAGER = "less";
    # LESS = "-R"; # keep colors
    # BROWSER = "firefox";
    # TERMINAL = "foot";
    # LANG = "en_US.UTF-8"; # typically set system-wide; uncomment if you need per-user override
  };

  ########################################
  # 4) Shells & prompt
  ########################################
  programs.bash = {
    enable = true;
    # Initialize prompt and extras here instead of editing ~/.bashrc
    # promptInit = ''
      # Bright magenta username, path, and $/#, then reset
      # PS1='\[\e[95m\]\u\[\e[0m\] \[\e[95m\]in\[\e[0m\] \[\e[95m\]\w\[\e[0m\] \[\e[95m\]\\$\[\e[0m\] '
    # '';
    shellAliases = {
      btw = "echo I use NixOS btw";
      ll = "ls -alF";
      la = "ls -A";
      l = "ls -CF";
      grep = "grep --color=auto";
    };
    historyControl = [ "ignoredups" "ignorespace" ];
    enableCompletion = true;
  };

  # Optional: a modern prompt
  programs.starship = {
    enable = true; # set to true if you want starship
    settings = {
      add_newline = true;
      character = { success_symbol = "➜ "; error_symbol = "✗ "; };
    };
  };

  ########################################
  # 5) Programs (CLI)
  ########################################
  programs.git = {
    enable = true;
    userName = "djones369";
    userEmail = "djones369@gmail.com"; # <- change to your real address
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  programs.ssh = {
    enable = true;
    # matchBlocks."github.com" = { user = "git"; }; # example
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fzf.enable = true;
  programs.htop.enable = true;

  ########################################
  # 6) GUI applications
  ########################################
  # HM can also manage desktop files & mime; enable xdg above
  programs.firefox.enable = false; # set true if you want HM to manage Firefox
  # programs.vscode.enable = true;  # enable if you prefer the OSS build; for MS build use pkgs.vscode

  ########################################
  # 7) User services
  ########################################
  # services.gpg-agent.enable = true;
  # services.gpg-agent.defaultCacheTtl = 1800;
  # services.gpg-agent.enableSshSupport = true;

  ########################################
  # 8) Files managed by HM
  ########################################
  # home.file.".config/myapp/config.toml".text = ''
  #   # Your app configuration here
  # '';

  ########################################
  # 9) Packages
  ########################################
  home.packages = with pkgs; [
  ##### System Tools #####
    htop
    fastfetch
    wget
    unzip
    zip
    pciutils
    nmap
    distrobox
    appimage-run
    xdotool
    menulibre
    rofi
    flameshot
    

  ##### Security, Networking & Web Browsers#####
    gnupg
    cifs-utils
    samba
    tor
    tor-browser
    google-chrome
    brave

  ##### Audio & Multimedia #####
    vlc
    mpv
    yt-dlp
    carla
    pwvucontrol
    pipecontrol
    wireplumber
    pavucontrol
    ncpamixer
    easyeffects
    ffmpeg-full

  ##### Graphics & Design #####
    gimp3-with-plugins
    imagemagick

  ##### Editors, Terminals & Notes #####
    vim
    vimPlugins.LazyVim
    geany
    vscode
    zed-editor
    obsidian
    ghostty
    mate.mate-terminal
    alacritty
    kitty

  ##### Development Tools #####
    git
    gh
    gitui
    gnumake
    cmake
    gcc
    # clang
    go
    ispell
    nil          # Nix language server
    shellcheck
    starship
    boxbuddy
    github-desktop

  ##### Static Site & Docs #####
    pandoc
    texlive.combined.scheme-small
    aspell
    marp-cli
    hexo-cli
    hugo
    jekyll
    ghost-cli

  ##### Virtualization #####
    virt-manager
    virt-viewer
    spice-gtk
    usbredir
    qemu
    qemu_kvm
    libvirt
    swtpm
    spice-protocol
    spice-gtk
    polkit_gnome

  ##### Password Manager #####
    bitwarden-desktop

  ##### Fonts #####
    nerd-fonts.symbols-only

  ##### Emacs & Doom Emacs #####
    emacs
    ripgrep
    emacsPackages.doom
    emacsPackages.doom-themes
    sqlite


  ];

  # Optional: let Home Manager manage Neovim (you can still keep it in home.packages)
  programs.neovim.enable = true;


}
