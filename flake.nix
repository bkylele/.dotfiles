{
  description = "System Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim = {
      url = "path:stuff/nvim/";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # kitty = {
    #   url = "path:stuff/kitty/";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # niri = {
    #   url = "path:stuff/niri/";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # bash = {
    #   url = "path:stuff/bash/";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
      ...
    }@inputs:
    {

      packages.x86_64-linux = {
        neovim = inputs.neovim.packages.x86_64-linux.default;
      };

      nixosConfigurations.buggy = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [
          ./configuration.nix
          ./overlays.nix

          nixos-hardware.nixosModules.microsoft-surface-pro-intel
          inputs.nix-index-database.nixosModules.default
          { programs.nix-index-database.comma.enable = true; }
        ];
      };
    };
}
