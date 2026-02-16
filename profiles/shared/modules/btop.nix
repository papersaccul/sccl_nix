{ pkgs, lib, config, ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = lib.mkForce "nord";
      theme_background = false;
    };
  };

  # Force overwrite existing config
  xdg.configFile."btop/btop.conf".force = true;
}
