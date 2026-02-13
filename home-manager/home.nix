{ config, pkgs, inputs, ... }:

{
  imports = [
    ./home-packages.nix
    ./modules
  ];

  home = {
    username = "paper";
    homeDirectory = "/home/paper";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;

  # Stylix theme
  stylix.targets = {
    fish.enable = true;
    vim.enable = true;
    gtk.enable = true;
    rofi.enable = false;
  };
}
