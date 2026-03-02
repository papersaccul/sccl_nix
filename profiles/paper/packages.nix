{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Network
    ayugram-desktop
    librewolf
    qbittorrent

    # Development
    lmstudio
    lazygit
    rustc
    cargo
    gcc
    obsidian

    # Gaming
    steam
    protonplus
    steam-run
    bottles
    modrinth-app

    # Creative Tools
    kdePackages.kdenlive
    krita
    aseprite
    blender
    audacity

    # Audio
    easyeffects

    # Office
    libreoffice-fresh

  ];
}
