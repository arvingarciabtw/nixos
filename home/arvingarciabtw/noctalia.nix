# Noctalia appearance and runtime-state seed.
{
  inputs,
  pkgs,
  lib,
  ...
}:
let
  noctalia = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  home.packages = [ noctalia ];

  xdg.configFile = {
    "noctalia/config.toml".source = ./files/noctalia/config.toml;
    "noctalia/palettes/MonokaiPro.json".source = ./files/noctalia/palettes/MonokaiPro.json;
  };

  xdg.dataFile."wallpapers/monokai-bg-solid.png".source = ./files/wallpapers/monokai-bg-solid.png;

  # Noctalia persists UI changes (theme, wallpaper, lockscreen layout) to this
  # state file, so seed it once instead of linking it read-only into the store.
  home.activation.seedNoctaliaState = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -e "$HOME/.local/state/noctalia/settings.toml" ]; then
      install -Dm600 ${./files/noctalia/settings-seed.toml} \
        "$HOME/.local/state/noctalia/settings.toml"
    fi
  '';
}
