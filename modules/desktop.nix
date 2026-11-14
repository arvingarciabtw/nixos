# Niri desktop, greetd, Noctalia, fonts, and input settings.
{
  config,
  inputs,
  pkgs,
  ...
}:
let
  noctalia = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  imports = [ inputs.noctalia.nixosModules.default ];

  programs.niri.enable = true;
  programs.noctalia = {
    enable = true;
    package = noctalia;
  };

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${config.programs.niri.package}/bin/niri-session";
      user = "arvingarciabtw";
    };
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  fonts = {
    packages = with pkgs; [
      corefonts
      commit-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      ubuntu-classic
    ];

    fontconfig.defaultFonts = {
      monospace = [ "Commit Mono" ];
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
