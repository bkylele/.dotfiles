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
      in
      {
        packages.default = pkgs.symlinkJoin {
          name = "neovim";
          paths = [ pkgs.neovim ];
          nativeBuildInputs = [ pkgs.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/nvim \
                --set XDG_CONFIG_HOME "${
                  pkgs.runCommandLocal "nvim-config" { } ''
                    mkdir -p $out/nvim
                    cp -r ${./.}/* $out/nvim/
                  ''
                }"
          '';

          meta.mainProgram = "nvim";
        };
      }
    );
}
