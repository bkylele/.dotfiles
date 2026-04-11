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

        bashrcPath = pkgs.runComamndLocal "bash-config" {} ''
            cp ${./.bashrc} $out/
        ''
      in
      {
        packages.default = pkgs.symlinkJoin {
          name = "bash";
          paths = [ pkgs.bash ];
          nativeBuildInputs = [ pkgs.makeWrapper ];
          postbuild = ''
            wrapProgram $out/bin/bash \
                --add-flags "--init-file ${bashrcPath}"
          '';
        };
      }
    );
}
