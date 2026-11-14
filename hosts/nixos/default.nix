# Host-specific configuration for the "nixos" machine.
{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core.nix
    ../../modules/hardware.nix
    ../../modules/desktop.nix
    ../../modules/development.nix
    ../../modules/packages.nix
    ../../modules/users.nix
  ];

  networking.hostName = "nixos";
  system.stateVersion = "26.05";

  # UEFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
