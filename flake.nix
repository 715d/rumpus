{
  description = "Rumpus - 1970s-inspired terminal color theme";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          default = pkgs.stdenv.mkDerivation {
            pname = "rumpus";
            version = "1.0.0";
            src = ./.;

            installPhase = ''
              runHook preInstall

              mkdir -p $out

              # Copy all theme directories
              cp -r ghostty $out/
              cp -r zellij $out/
              cp -r tmux $out/
              cp -r fish $out/
              cp -r zsh $out/
              cp -r delta $out/
              cp -r bat $out/
              cp -r helix $out/
              cp -r zed $out/
              cp -r nvim $out/

              runHook postInstall
            '';

            meta = with pkgs.lib; {
              description = "1970s-inspired terminal color theme for multiple tools";
              homepage = "https://github.com/715d/rumpus";
              license = licenses.mit;
              maintainers = [ ];
              platforms = platforms.unix;
            };
          };

          # Alias for convenience
          rumpus = self.packages.${system}.default;
        }
      );

      homeManagerModules = {
        default = { pkgs, lib, config, ... }: {
          imports = [ ./nix/modules/home-manager.nix ];
          config = lib.mkIf (config.rumpus.enable or false) {
            rumpus.package = lib.mkDefault self.packages.${pkgs.system}.default;
          };
        };
        rumpus = self.homeManagerModules.default;
      };

      # Development shells
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          default = pkgs.mkShell {
            buildInputs = [
              pkgs.nixpkgs-fmt
            ];

            shellHook = ''
              echo "🎨 Rumpus development environment"
              echo "Available commands:"
              echo "  nix build        - Build the package"
              echo "  nix flake check  - Run checks"
              echo "  nix fmt .        - Format Nix files"
            '';
          };
        }
      );

      # Formatter for `nix fmt`
      formatter = forAllSystems (system: nixpkgsFor.${system}.nixpkgs-fmt);
    };
}
