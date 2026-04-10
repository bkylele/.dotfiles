{ inputs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      neovim = inputs.neovim.packages.${prev.stdenv.hostPlatform.system}.default;
    })
  ];
}
