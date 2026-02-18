{ pkgs, ... }:
{
  home.packages = [
    pkgs.hyprcursor
    pkgs.dconf
  ];

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    size = 24;
    package = pkgs.bibata-cursors;
    gtk.enable = true;
    x11.enable = true;
  };
}
