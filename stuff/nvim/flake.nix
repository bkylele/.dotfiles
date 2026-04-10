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
        packages.default = let 
            nvimConfig = pkgs.runCommand "nvim-config" {} ''
              mkdir -p $out/nvim
              cp -r ${./.}/* $out/nvim/
            '';
        in
        pkgs.symlinkJoin {
          name = "nvim-custom";
          paths = [
            (pkgs.writeShellScriptBin "nvim" ''
              export XDG_CONFIG_HOME="${nvimConfig}"
              exec ${pkgs.neovim}/bin/nvim "$@"
            '')
            pkgs.neovim
          ];
	  meta.mainProgram = "nvim";
        };
      }
    );
}
