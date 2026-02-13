{ config, pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "rust"
    ];

    userSettings = {
      theme = "Base16 Nord";
    };
  };
}
