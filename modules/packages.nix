# System-wide packages, grouped by purpose.
{ inputs, pkgs, ... }:
let
  ditto = inputs.ditto.packages.${pkgs.stdenv.hostPlatform.system}.default;
  claude-code = inputs.claude-code.packages.${pkgs.stdenv.hostPlatform.system}.claude-code;
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
    google-chrome
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

    # XWayland
    xwayland-satellite

    # For Google Drive
    rclone

    git-crypt
    gnupg
    pinentry-curses

    fnm

    # AI
    claude-code
  ];

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = true;
  };

  # ditto reads /dev/input/event*, so it needs a capability wrapper.
  security.wrappers.ditto = {
    owner = "root";
    group = "root";
    capabilities = "cap_dac_read_search=ep";
    source = "${ditto}/bin/ditto";
  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Firefox
  programs.firefox = {
    enable = true;
    preferences = {
      "browser.link.open_newwindow.restriction" = 0;
    };
  };
}
