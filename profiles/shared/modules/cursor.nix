{ pkgs, ... }:
{
  home.packages = [
    pkgs.hyprcursor
    pkgs.dconf
  ];
}
