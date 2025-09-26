{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Create necessary directories for PulseAudio compatibility
  systemd.tmpfiles.rules = [
    "d /run/user/%i/pulse 0755 %i %i -"
  ];
}
