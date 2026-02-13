{ config, lib, pkgs, ... }:

{
  # PipeWire
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Disable PulseAudio
  services.pulseaudio.enable = false;  # Исправлено: hardware -> services
}
