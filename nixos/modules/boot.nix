{ config, lib, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 3;
    };

    # Plymouth
    plymouth.enable = true;

    kernelParams = [ "quiet" "splash" ];
  };
}
