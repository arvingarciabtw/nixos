# Local development services.
{ pkgs, ... }:
{
  virtualisation.docker.enable = true;

  services.mysql = {
    enable = true;
    package = pkgs.mysql84;
  };

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_18;
  };

  # Allows binaries from outside Nix to run on NixOS.
  programs.nix-ld.enable = true;
}
