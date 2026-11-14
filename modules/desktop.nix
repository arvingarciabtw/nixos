# Niri desktop, greetd, fonts, and input settings.
{
  config,
  pkgs,
  ...
}:
{
  programs.niri.enable = true;

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
