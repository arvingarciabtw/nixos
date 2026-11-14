# User account shared across hosts.
{ ... }:
{
  users.users.arvingarciabtw = {
    isNormalUser = true;
    description = "arvingarciabtw";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };
}
