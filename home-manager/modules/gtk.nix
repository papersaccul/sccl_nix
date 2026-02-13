{ config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  xfconf.enable = lib.mkForce false;

  home.packages = with pkgs; [
    nordic
    papirus-icon-theme
  ];
}
