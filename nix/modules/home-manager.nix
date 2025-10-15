{ config
, lib
, pkgs
, ...
}:

with lib;

let
  cfg = config.rumpus;
in
{
  options.rumpus = {
    enable = mkEnableOption "Rumpus 1970s-inspired terminal theme";

    package = mkOption {
      type = types.nullOr types.package;
      default = null;
      description = "The Rumpus package to use. Automatically set when using the flake's homeManagerModule.";
    };

    tools = {
      ghostty = {
        enable = mkEnableOption "Rumpus theme for Ghostty terminal";
      };

      zellij = {
        enable = mkEnableOption "Rumpus theme for Zellij multiplexer";
      };

      tmux = {
        enable = mkEnableOption "Rumpus theme for tmux multiplexer";
      };

      fish = {
        enable = mkEnableOption "Rumpus theme for Fish shell (auto-enabled via conf.d)";
      };

      zsh = {
        enable = mkEnableOption "Rumpus theme for Zsh (requires oh-my-zsh)";
      };

      delta = {
        enable = mkEnableOption "Rumpus theme for Delta git pager";
      };

      bat = {
        enable = mkEnableOption "Rumpus theme for Bat syntax highlighter";
      };

      helix = {
        enable = mkEnableOption "Rumpus theme for Helix editor";
      };

      zed = {
        enable = mkEnableOption "Rumpus theme for Zed editor";
      };

      neovim = {
        enable = mkEnableOption "Rumpus theme for Neovim (requires manual activation)";
      };
    };
  };

  config = mkIf cfg.enable {
    assertions = [
      {
        assertion = cfg.package != null;
        message = ''
          rumpus.package must be set. This should be automatic when using inputs.rumpus.homeManagerModules.default.
          If you're importing the module directly, set: rumpus.package = inputs.rumpus.packages.''${pkgs.system}.default;
        '';
      }
    ];

    # Make package available
    home.packages = [ cfg.package ];

    # Ghostty: Link theme file
    xdg.configFile."ghostty/themes/rumpus" = mkIf cfg.tools.ghostty.enable {
      source = "${cfg.package}/ghostty/rumpus";
    };

    # Zellij: Link theme file
    xdg.configFile."zellij/themes/rumpus.kdl" = mkIf cfg.tools.zellij.enable {
      source = "${cfg.package}/zellij/rumpus.kdl";
    };

    # tmux: Link theme file
    xdg.configFile."tmux/themes/rumpus.tmux.conf" = mkIf cfg.tools.tmux.enable {
      source = "${cfg.package}/tmux/rumpus.tmux.conf";
    };

    # Delta: Link theme file
    xdg.configFile."delta/rumpus.gitconfig" = mkIf cfg.tools.delta.enable {
      source = "${cfg.package}/delta/rumpus.gitconfig";
    };

    # Bat: Link theme file
    xdg.configFile."bat/themes/rumpus.tmTheme" = mkIf cfg.tools.bat.enable {
      source = "${cfg.package}/bat/rumpus.tmTheme";
    };

    # Helix: Link theme file
    xdg.configFile."helix/themes/rumpus.toml" = mkIf cfg.tools.helix.enable {
      source = "${cfg.package}/helix/rumpus.toml";
    };

    # Zed: Link theme file
    xdg.configFile."zed/themes/rumpus.json" = mkIf cfg.tools.zed.enable {
      source = "${cfg.package}/zed/rumpus.json";
    };

    # Fish: Link theme file
    xdg.configFile."fish/themes/rumpus.theme" = mkIf cfg.tools.fish.enable {
      source = "${cfg.package}/fish/rumpus.theme";
    };

    # Fish: Auto-enable via conf.d
    xdg.configFile."fish/conf.d/rumpus.fish" = mkIf cfg.tools.fish.enable {
      text = ''
        # Rumpus theme - managed by Home Manager
        fish_config theme choose rumpus
      '';
    };

    # Zsh: Provide oh-my-zsh custom directory with theme
    # Note: User must set programs.zsh.oh-my-zsh.theme = "rumpus";
    programs.zsh.oh-my-zsh = mkIf cfg.tools.zsh.enable {
      custom = "${cfg.package}/zsh";
    };

    # Neovim: Package is available, but user must manually activate
    # Add to Neovim config: vim.cmd("colorscheme rumpus")
    xdg.configFile."nvim/colors/rumpus.lua" = mkIf cfg.tools.neovim.enable {
      source = "${cfg.package}/nvim/rumpus.lua";
    };

    # Warnings for tools requiring manual configuration
    warnings = (
      optional (cfg.tools.zsh.enable && !(config.programs.zsh.oh-my-zsh.enable or false))
        "rumpus.tools.zsh.enable requires programs.zsh.oh-my-zsh.enable = true. Set programs.zsh.oh-my-zsh.theme = \"rumpus\";"
    );
  };
}
