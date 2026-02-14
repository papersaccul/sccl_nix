{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Wayland essentials
    rofi
    xfce.thunar
    grim
    slurp
    wl-clipboard
    pavucontrol

    # CLI tools
    btop
    neofetch
    ripgrep
    fd
    bat
    eza
    fzf
    zoxide

    appimage-run

    # Media
    vlc
    mpv

    # Archive
    file-roller

    # PDF
    zathura
    evince

    # Theme
    nordic
    papirus-icon-theme
    rose-pine-hyprcursor

    # Fonts
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.symbols-only
  ];
}
