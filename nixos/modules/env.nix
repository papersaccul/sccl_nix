{ config, lib, pkgs, ... }:

{
  environment = {
    variables = {
      EDITOR = "vim"; # btw i use vim
      VISUAL = "vim"; # visual, ok.
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";  # Wayland electron
    };
  };
}
