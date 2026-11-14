# User-level configuration for arvingarciabtw.
{ ... }:
{
  imports = [
    ./niri.nix
    ./noctalia.nix
  ];

  home = {
    username = "arvingarciabtw";
    homeDirectory = "/home/arvingarciabtw";
    stateVersion = "26.05"; # Match system.stateVersion.
  };
}
