{ config, pkgs, pkgs-unstable, ... }:

{
  programs.zed-editor = {
    enable = true;
    package = pkgs-unstable.zed-editor-fhs;
    extensions = [
      "nix"
      "toml"
      "rust"
    ];

    userSettings = {
      theme = "Base16 Nord";
      proxy = "http://127.0.0.1:7890"; # bad connect to digitalocean.com
    };
  };
}
