{ config, pkgs, pkgs-unstable, ... }:

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
    #discord
    webcord
    # zapret

    # Coding
    #pkgs-unstable.zed-editor
    #pkgs-unstable.zed-editor-fhs
    lmstudio
    nixd
    lazygit
    gh
    rustc
    cargo
    gcc
    kiro


    # Gaming
    steam
    protonplus
    obs-studio
    steam-run
    bottles

    # tools
    kdePackages.kdenlive
    krita
    aseprite
    blender
    gparted
    audacity

    # Audio
    easyeffects

    # Office
    libreoffice-fresh
  ];
}
