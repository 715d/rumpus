# Rumpus Nix Integration

This directory contains Nix flake integration for the Rumpus terminal theme, providing declarative installation and configuration for Home Manager users.

## Quick Start

### 1. Add to your flake inputs

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    rumpus = {
      url = "github:715d/rumpus";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
```

**Note:** The `inputs.nixpkgs.follows = "nixpkgs"` line prevents duplicate nixpkgs in your dependency tree, reducing closure size and avoiding potential version conflicts.

### 2. Import the Home Manager module

```nix
{
  home-manager.users.yourname = { config, pkgs, ... }: {
    imports = [ inputs.rumpus.homeManagerModules.default ];

    rumpus = {
      enable = true;
      tools = {
        ghostty.enable = true;
        fish.enable = true;
        neovim.enable = true;
      };
    };
  };
}
```

### 3. Rebuild your configuration

```bash
home-manager switch --flake .
```

## Supported Tools

The Rumpus flake provides theme integration for the following tools:

| Tool | Auto-Enable | Manual Step Required |
|------|-------------|---------------------|
| **Ghostty** | ✅ File linked | Add `theme = rumpus` to config |
| **Zellij** | ✅ File linked | Add `theme "rumpus"` to config.kdl |
| **tmux** | ✅ File linked | Source in tmux.conf |
| **Fish** | ✅ **Fully automatic** | None - auto-enabled via conf.d |
| **Zsh** | ✅ Custom dir set | Set `programs.zsh.oh-my-zsh.theme = "rumpus"` |
| **Delta** | ✅ File linked | Add to gitconfig |
| **Bat** | ✅ File linked | Run `bat cache --build`, set `--theme="Rumpus"` |
| **Helix** | ✅ File linked | Set `theme = "rumpus"` in config.toml |
| **Zed** | ✅ File linked | Select theme in Zed UI |
| **Neovim** | ✅ File linked | Add `vim.cmd("colorscheme rumpus")` to config |

## Per-Tool Configuration

### Ghostty

```nix
rumpus.tools.ghostty.enable = true;
```

Then add to your `~/.config/ghostty/config`:
```
theme = rumpus
```

### Zellij

```nix
rumpus.tools.zellij.enable = true;
```

Then add to your `~/.config/zellij/config.kdl`:
```kdl
theme "rumpus"
```

### tmux

```nix
rumpus.tools.tmux.enable = true;
```

Then add to your `~/.tmux.conf`:
```tmux
source-file ~/.config/tmux/themes/rumpus.tmux.conf
```

### Fish Shell

```nix
rumpus.tools.fish.enable = true;
```

**No manual step required!** The theme is automatically enabled via `conf.d/`.

### Zsh Shell (Oh-My-Zsh)

```nix
rumpus.tools.zsh.enable = true;

programs.zsh = {
  enable = true;
  oh-my-zsh = {
    enable = true;
    theme = "rumpus";
  };
};
```

**Note:** Requires `programs.zsh.oh-my-zsh.enable = true`.

### Delta

```nix
rumpus.tools.delta.enable = true;
```

Then configure git to use Delta and Rumpus:
```bash
git config --global include.path ~/.config/delta/rumpus.gitconfig
git config --global delta.features rumpus
git config --global core.pager delta
```

Or in your Home Manager config:
```nix
programs.git = {
  enable = true;
  includes = [
    { path = "~/.config/delta/rumpus.gitconfig"; }
  ];
  extraConfig = {
    delta = {
      features = "rumpus";
      navigate = true;
    };
    core.pager = "delta";
  };
};
```

### Bat

```nix
rumpus.tools.bat.enable = true;
```

Then rebuild the Bat cache:
```bash
bat cache --build
```

And set the theme in `~/.config/bat/config`:
```
--theme="Rumpus"
```

Or via Home Manager:
```nix
programs.bat = {
  enable = true;
  config = {
    theme = "Rumpus";
  };
};
```

### Helix

```nix
rumpus.tools.helix.enable = true;
```

Then add to your `~/.config/helix/config.toml`:
```toml
theme = "rumpus"
```

Or via Home Manager:
```nix
programs.helix = {
  enable = true;
  settings = {
    theme = "rumpus";
  };
};
```

### Zed

```nix
rumpus.tools.zed.enable = true;
```

Then select "Rumpus" in Zed's theme selector (Cmd/Ctrl+Shift+P → "theme selector").

Or set in `~/.config/zed/settings.json`:
```json
{
  "theme": "Rumpus"
}
```

### Neovim

```nix
rumpus.tools.neovim.enable = true;
```

Then add to your Neovim config:

**init.lua:**
```lua
vim.cmd("colorscheme rumpus")
```

**init.vim:**
```vim
colorscheme rumpus
```

Or via Home Manager:
```nix
programs.neovim = {
  enable = true;
  extraLuaConfig = ''
    vim.cmd("colorscheme rumpus")
  '';
};
```

## Complete Example

Here's a full example Home Manager configuration:

```nix
{ inputs, ... }: {
  home-manager.users.yourname = { config, pkgs, ... }: {
    imports = [ inputs.rumpus.homeManagerModules.default ];

    # Enable Rumpus theme for all tools
    rumpus = {
      enable = true;
      tools = {
        ghostty.enable = true;
        zellij.enable = true;
        tmux.enable = true;
        fish.enable = true;
        zsh.enable = true;
        delta.enable = true;
        bat.enable = true;
        helix.enable = true;
        zed.enable = true;
        neovim.enable = true;
      };
    };

    # Tool-specific activation
    programs.zsh.oh-my-zsh.theme = "rumpus";
    programs.bat.config.theme = "Rumpus";
    programs.helix.settings.theme = "rumpus";
    programs.neovim.extraLuaConfig = ''
      vim.cmd("colorscheme rumpus")
    '';

    # Manual configs (examples)
    xdg.configFile."ghostty/config".text = ''
      theme = rumpus
      # ... other settings
    '';
  };
}
```

## Using the Package Standalone

If you don't want to use the Home Manager module, you can use the package directly:

```nix
{
  home.packages = [ inputs.rumpus.packages.${pkgs.system}.default ];
}
```

Then manually link the theme files you need:
```nix
{
  xdg.configFile."ghostty/themes/rumpus".source =
    "${inputs.rumpus.packages.${pkgs.system}.default}/ghostty/rumpus";
}
```

## Troubleshooting

### Theme not showing up

1. **Verify the file was linked:**
   ```bash
   ls -la ~/.config/ghostty/themes/rumpus
   ```

2. **Check for typos in your config** - theme names are case-sensitive.

3. **For Bat**, rebuild the cache:
   ```bash
   bat cache --build
   bat --list-themes | grep Rumpus
   ```

### Zsh warning about oh-my-zsh

If you see: "rumpus.tools.zsh.enable requires programs.zsh.oh-my-zsh.enable = true"

Solution:
```nix
programs.zsh = {
  enable = true;
  oh-my-zsh.enable = true;
};
```

### Neovim colorscheme not found

Make sure you've added the activation line to your Neovim config:
```lua
vim.cmd("colorscheme rumpus")
```

The module only installs the colorscheme file; it doesn't automatically activate it.

## Development

### Testing the flake

```bash
# Check flake validity
nix flake check

# Build the package
nix build

# Test in a temporary shell
nix develop
```

### Local development

To test local changes:

```nix
{
  inputs.rumpus.url = "path:/path/to/your/rumpus/repo";
}
```
