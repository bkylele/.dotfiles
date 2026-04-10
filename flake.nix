{
  description = "System Configuration";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

      nixos-hardware.url = "github:NixOS/nixos-hardware/master";

      nix-index-database = {
          url = "github:nix-community/nix-index-database";
          inputs.nixpkgs.follows = "nixpkgs";
      };

      neovim.url = "path:stuff/nvim/";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
      ...
    }@inputs:
    {
      nixosConfigurations.buggy = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.microsoft-surface-pro-intel
          inputs.nix-index-database.nixosModules.default
          { programs.nix-index-database.comma.enable = true; }
        ];
      };
    };
}
