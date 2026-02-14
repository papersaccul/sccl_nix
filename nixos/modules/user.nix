{ config, pkgs, ... }:

{
  users.users.paper = {
    isNormalUser = true;
    description = "Paper";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    shell = pkgs.fish;
    initialPassword = "change";
  };

  programs.fish.enable = true;

  security.sudo.wheelNeedsPassword = false;
}
