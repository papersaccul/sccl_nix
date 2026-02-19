{ config, lib, pkgs, ... }:

{
  # pipewire 4 audio n video
  security.rtkit.enable = true; # realtime audio frfr

  services.pipewire = {
    enable = true; # pipewire + alsa + pulse + jack
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # pulseaudio is dead
  services.pulseaudio.enable = false;
}
