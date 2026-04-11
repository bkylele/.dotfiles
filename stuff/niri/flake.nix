{
  description = "My Niri Configuration";
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
          name = "niri";
          paths = [ pkgs.niri ];
          nativeBuildInputs = [ pkgs.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/niri-session \
                --set XDG_CONFIG_HOME "${
                  pkgs.runCommand "niri-config" { } ''
                    mkdir -p $out/niri
                    cp -r ${./.}/* $out/niri/
                  ''
                }"
          '';
          passthru.providedSessions = [ "niri" ];
        };
      }
    );
}
