{ inputs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      neovim = inputs.neovim.packages.${prev.stdenv.hostPlatform.system}.default;
    })

    (final: prev: {
      niri = inputs.niri.packages.${prev.stdenv.hostPlatform.system}.default;
    })

  ];
}
