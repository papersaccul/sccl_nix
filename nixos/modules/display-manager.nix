{ config, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd niri"; # tui, minimal af
        user = "greeter";
      };
    };
  };

  environment.systemPackages = [ pkgs.tuigreet ];
}
