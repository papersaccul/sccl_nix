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

    iconTheme = {
          name = "Papirus-Dark";
          package = pkgs.papirus-icon-theme;
    };
  };

  xfconf.enable = lib.mkForce false;
}
