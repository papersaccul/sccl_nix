{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Network
    ayugram-desktop

    # Development
    lmstudio
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
