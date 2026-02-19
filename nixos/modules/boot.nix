{ config, lib, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true; # using systemd-boot instead of grub
      efi.canTouchEfiVariables = true;
      timeout = 3;
    };

    # pretty boot screen
    plymouth.enable = true;

    kernelParams = [ "quiet" "splash" ]; # hide boot messages, show splash
  };
}
