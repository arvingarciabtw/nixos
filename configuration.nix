# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, inputs, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.noctalia.nixosModules.default
    ];

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true; # NetworkManager, Bluetooth, UPower, power-profiles-daemon
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.firewall.allowedTCPPorts = [ 5173 ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Manila";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_PH.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fil_PH";
    LC_IDENTIFICATION = "fil_PH";
    LC_MEASUREMENT = "fil_PH";
    LC_MONETARY = "fil_PH";
    LC_NAME = "fil_PH";
    LC_NUMERIC = "fil_PH";
    LC_PAPER = "fil_PH";
    LC_TELEPHONE = "fil_PH";
    LC_TIME = "fil_PH";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."arvingarciabtw" = {
    isNormalUser = true;
    description = "arvingarciabtw";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    git
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    wget
    firefox
    vivaldi
    # Below are niri stuff that I need to get it to work for now
    ghostty
    fuzzel
    swaylock
    swaybg
    # Installs noctalia package?
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    bibata-cursors
    fastfetch
    yazi
    # LazyVim
    tree-sitter
    gcc
    curl
    fzf
    ripgrep
    fd
    # Package managers
    nodejs
    pnpm
    # Languages
    go
    zig
    # From my old stuff
    btop
    fastfetch
    nom
    tmux
    tmuxinator
    yazi
    stow
    inputs.ditto.packages.${pkgs.stdenv.hostPlatform.system}.default
    lazygit
    atac
    air
    mysql84
    unzip
    hyprpicker
    postgresql
    cloc
    gnumake
    mosh
    mtr
    playwright
    helix
    prettier
    appimage-run
    voxtype-vulkan
    vulkan-tools
    (python3.withPackages (ps: with ps; [ pip requests numpy ]))
    lazydocker
  ];

  # DOCKER
  virtualisation.docker.enable = true;

  hardware.graphics.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # i apparently need this for markdown-preview.nvim to work?
  programs.nix-ld.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # wiki.nixos.org/wiki/Niri/en
  programs.niri.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${config.programs.niri.package}/bin/niri-session";
        user = "arvingarciabtw";
      };
    };
  };

  systemd.user.services.niri.enableDefaultPath = false;

  # to make mysql work, supposedly

  services.mysql = {
    enable = true;
    package = pkgs.mysql84;
  };

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_18;
  };

  # NOCTALIA: reqs
  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  # services.tuned.enable = true;
  services.upower.enable = true;

  security.wrappers.ditto = {
    owner = "root";
    group = "root";
    capabilities = "cap_dac_read_search=ep";
    source = "${inputs.ditto.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/ditto";
  };

  # FONTS
  fonts = {
    packages = with pkgs; [
      corefonts
      commit-mono
      noto-fonts        # broad sans-serif/serif coverage + good Unicode fallback
      noto-fonts-cjk-sans  # CJK glyphs, in case any site/app needs them
      noto-fonts-color-emoji  # color emoji
      ubuntu-classic
    ];

    fontconfig = {
      enable = true;  # true by default, but explicit doesn't hurt
      defaultFonts = {
        monospace = [ "Commit Mono" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
