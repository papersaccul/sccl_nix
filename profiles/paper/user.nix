{ config, pkgs, ... }:

{
  users.users.paper = {
    isNormalUser = true;
    description = "Paper"; # tipo bumaga?
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    shell = pkgs.fish;
    initialPassword = "change"; # initial psswd, dont forget to change
  };

  programs.fish.enable = true;

  security.sudo.wheelNeedsPassword = false;
}
