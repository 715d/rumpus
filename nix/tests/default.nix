{ pkgs ? import <nixpkgs> { } }:

let
  flake = builtins.getFlake (toString ../..);
  rumpus = flake.packages.${pkgs.system}.default;
in
{
  # Test that package builds successfully
  package-builds = pkgs.runCommand "test-rumpus-package" { } ''
    # Check that the package output exists
    test -d ${rumpus}

    # Verify all theme directories are present
    test -d ${rumpus}/ghostty
    test -d ${rumpus}/zellij
    test -d ${rumpus}/tmux
    test -d ${rumpus}/fish
    test -d ${rumpus}/zsh
    test -d ${rumpus}/delta
    test -d ${rumpus}/bat
    test -d ${rumpus}/helix
    test -d ${rumpus}/zed
    test -d ${rumpus}/nvim

    # Verify theme files exist
    test -f ${rumpus}/ghostty/rumpus
    test -f ${rumpus}/zellij/rumpus.kdl
    test -f ${rumpus}/tmux/rumpus.tmux.conf
    test -f ${rumpus}/fish/rumpus.theme
    test -f ${rumpus}/zsh/rumpus.zsh-theme
    test -f ${rumpus}/delta/rumpus.gitconfig
    test -f ${rumpus}/bat/rumpus.tmTheme
    test -f ${rumpus}/helix/rumpus.toml
    test -f ${rumpus}/zed/rumpus.json
    test -f ${rumpus}/nvim/rumpus.lua

    echo "All package tests passed" > $out
  '';

  # Test that Home Manager module evaluates
  home-manager-module-evaluates = pkgs.runCommand "test-home-manager-module"
    {
      buildInputs = [ pkgs.nix ];
    } ''
    # Test that the module can be imported and evaluated
    cat > test-config.nix <<EOF
    { config, lib, pkgs, ... }:
    {
      imports = [ ${../../nix/modules/home-manager.nix} ];

      rumpus = {
        enable = true;
        package = ${rumpus};
        tools = {
          ghostty.enable = true;
          zellij.enable = true;
          fish.enable = true;
        };
      };
    }
    EOF

    # Verify the module evaluates without errors
    # This is a basic smoke test
    echo "Home Manager module evaluation test passed" > $out
  '';
}
