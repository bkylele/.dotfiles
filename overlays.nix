{ inputs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      neovim = inputs.neovim.packages.${prev.stdenv.hostPlatform.system}.default;
    })

    # (final: prev: {
    #   kitty = inputs.kitty.packages.${prev.stdenv.hostPlatform.system}.default;
    # })

    # (final: prev: {
    #   niri = inputs.niri.packages.${prev.stdenv.hostPlatform.system}.default;
    # })

    # (final: prev: {
    #   bash =
    #     if inputs.bash.packages ? ${prev.stdenv.hostPlatform.system}.default then
    #       inputs.bash.packages.${prev.stdenv.hostPlatform.system}.default
    #     else
    #       prev.bash;
    #   # bash = inputs.bash.packages.${prev.stdenv.hostPlatform.system}.default;
    # })

  ];
}
