{ pkgs, lib, ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = lib.mkForce "nord";
      theme_background = false;
    };
  };
}
