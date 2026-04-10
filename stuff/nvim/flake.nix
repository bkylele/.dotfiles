{
  description = "A basic flake with a shell";
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
          name = "nvim-custom";
          paths = [
            (pkgs.writeShellScriptBin "nvim" ''
              exec ${pkgs.neovim}/bin/nvim -u ${./init.lua} "$@"
            '')
            pkgs.neovim
          ];
        };
      }
    );
}
