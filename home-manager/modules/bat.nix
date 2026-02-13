{ config, pkgs, ... }:

{

  stylix.targets.bat.enable = false;

  programs.bat = {
    enable = true;
    config = {
      theme = "Nord";
      pager = "less -FR";
    };
  };
}
