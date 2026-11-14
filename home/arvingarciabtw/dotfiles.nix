# Curated dotfiles shared by all machines.
#
# Static configs are linked from the store. Configs that applications rewrite
# are seeded once into the home directory instead, so they stay writable.
{
  lib,
  ...
}:
{
  xdg.configFile = {
    "ghostty/config".source = ./files/ghostty/config;

    "tmux/tmux.conf".source = ./files/tmux/tmux.conf;

    "tmuxinator/demo.yml".source = ./files/tmuxinator/demo.yml;
    "tmuxinator/general.yml".source = ./files/tmuxinator/general.yml;
    "tmuxinator/nvim-lazygit.yml".source = ./files/tmuxinator/nvim-lazygit.yml;

    "yazi/keymap.toml".source = ./files/yazi/keymap.toml;

    "fastfetch/config.jsonc".source = ./files/fastfetch/config.jsonc;
    "fastfetch/nixos_logo.txt".source = ./files/fastfetch/nixos_logo.txt;

    "fontconfig/conf.d/99-dotfiles.conf".source = ./files/fontconfig/fonts.conf;
  };

  home.file.".gitconfig".source = ./files/gitconfig;

  # Keep the existing shell PATH setup, but load database credentials from an
  # untracked local file so secrets never enter the Nix store.
  programs.bash = {
    enable = true;

    bashrcExtra = ''
      export PATH="$HOME/.opencode/bin:$PATH"

      export PNPM_HOME="$HOME/.local/share/pnpm"
      case ":$PATH:" in
        *":$PNPM_HOME/bin:"*) ;;
        *) export PATH="$PNPM_HOME/bin:$PATH" ;;
      esac

      export PATH="$PATH:$HOME/go/bin"

      [ -f "$HOME/.config/secrets/shell.env" ] && . "$HOME/.config/secrets/shell.env"
      [ -f "$HOME/.deno/env" ] && . "$HOME/.deno/env"
      [ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
      [ -f "$HOME/.config/vite-plus/env" ] && . "$HOME/.config/vite-plus/env"
    '';

    initExtra = ''
      PS1='\n\[\e[38;2;114;112;114m\]\w\[\e[0m\] \[\e[38;2;193;192;192m\]\$\[\e[0m\] '
    '';

    profileExtra = ''
      [ -f "$HOME/.deno/env" ] && . "$HOME/.deno/env"
      [ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
      [ -f "$HOME/.config/vite-plus/env" ] && . "$HOME/.config/vite-plus/env"
    '';
  };

  # btop saves its config on exit, ditto and nom rewrite state, and Neovim and
  # OpenCode update their own files. Seed those once and leave them writable.
  home.activation.seedDotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    seed_path() {
      local src="$1"
      local dst="$2"

      if [ ! -e "$dst" ]; then
        mkdir -p "$(dirname "$dst")"
        cp -r "$src" "$dst"
        chmod -R u+w "$dst"
      fi
    }

    seed_path ${./files/btop} "$HOME/.config/btop"
    seed_path ${./files/ditto} "$HOME/.config/ditto"
    seed_path ${./files/nom/config.yml} "$HOME/.config/nom/config.yml"
    seed_path ${./files/nvim} "$HOME/.config/nvim"
    seed_path ${./files/opencode} "$HOME/.config/opencode"
  '';
}
