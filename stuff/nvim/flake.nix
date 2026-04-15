{
  description = "My Neovim Configuration";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.systems.url = "github:nix-systems/default";
  inputs.flake-utils = {
    url = "github:numtide/flake-utils";
    inputs.systems.follows = "systems";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        nvimConfigPath = pkgs.runCommandLocal "nvim-config" { } ''
          mkdir -p $out/
          cp -r ${./.}/* $out/
        '';
      in
      {
        packages.default = pkgs.symlinkJoin {
          name = "neovim";
          paths = [ pkgs.neovim ];
          nativeBuildInputs = [ pkgs.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/nvim \
                --add-flags "--cmd 'set runtimepath^=${nvimConfigPath}/'" \
                --add-flags "-u ${nvimConfigPath}/init.lua"
          '';

          meta.mainProgram = "nvim";
        };
      }
    );
}
