{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # AMD GPU params
  boot.kernelParams = [ "amd_pstate=active" ];
}
