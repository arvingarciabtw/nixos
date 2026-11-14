# System-wide packages, grouped by purpose.
{ inputs, pkgs, ... }:
let
  ditto = inputs.ditto.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  environment.systemPackages = with pkgs; [
    # Core CLI tools
    git
    vim
    neovim
    helix
    wget
    curl
    unzip
    ripgrep
    fd
    fzf
    btop
    fastfetch
    tmux
    tmuxinator
    mosh
    mtr
    stow
    nom
    yazi
    atac
    lazygit
    lazydocker
    cloc
    gnumake
    gcc
    tree-sitter
    appimage-run
    playwright
    prettier
    air

    # Desktop
    firefox
    vivaldi
    ghostty
    fuzzel
    swaylock
    swaybg
    bibata-cursors
    hyprpicker
    voxtype-vulkan
    vulkan-tools

    # Languages
    nodejs
    pnpm
    go
    zig

    # Python
    (python3.withPackages (
      ps: with ps; [
        pip
        requests
        numpy
      ]
    ))
  ];

  # ditto reads /dev/input/event*, so it needs a capability wrapper.
  security.wrappers.ditto = {
    owner = "root";
    group = "root";
    capabilities = "cap_dac_read_search=ep";
    source = "${ditto}/bin/ditto";
  };
}
