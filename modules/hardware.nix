# Hardware support shared by all hosts.
{ ... }:
{
  hardware.graphics.enable = true;

  hardware.bluetooth.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
}
