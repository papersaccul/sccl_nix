{ config, lib, pkgs, ... }:

{
  environment = {
    variables = {
      EDITOR = "vim";
      VISUAL = "vim";
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";  # Wayland electron
    };
  };
}
