{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # System utilities
    vim
    wget
    curl
    git
    htop
    tree
    nano
    hyfetch
    fastfetch

    # Archive tools
    p7zip
    unzip
    zip

    # Network
    firefox
    networkmanagerapplet
    ayugram-desktop
    discord
    # zapret

    # Coding
    #zed-editor
    #zed-editor-fhs
    lmstudio
    nixd
    lazygit
    rustc
    cargo
    gcc

    # Gaming
    steam
    protonplus
    obs-studio
    steam-run
    bottles

    # tools
    #kdePackages.kdenlive
    #krita
    #aseprite
    #blender
    gparted

    # Audio
    easyeffects
  ];
}
