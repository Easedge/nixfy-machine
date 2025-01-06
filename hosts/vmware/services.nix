{ config, ... }:
{
  services.openssh.enable = true;
  services.printing.enable = true;
  services.libinput.enable = true;
  services.colord.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
      userServices = true;
    };
  };

  services.cockpit = {
    enable = true;
    port = 9090;
    openFirewall = false;
    settings = {
      AllowUnencrypted = true;
    };
  };
}
