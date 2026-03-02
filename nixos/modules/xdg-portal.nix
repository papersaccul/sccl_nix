{ config, pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      sway = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
      };
    };
  };

  # wlr portal compatibility
  systemd.user.services.xdg-desktop-portal-wlr = {
    environment = {
      WAYLAND_DISPLAY = "wayland-1";
      XDG_CURRENT_DESKTOP = "sway";
    };
  };

  # Enable PipeWire for screen sharing
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
  ];

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  # Environment variables for proper portal detection
  environment.sessionVariables = {
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
  };
}
