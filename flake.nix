{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim= {
      url = "github:nicroxio/nixos-neovim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager,  ... }@inputs: 
  let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {

    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
	modules = [
          ./hosts/laptop/configuration.nix
          home-manager.nixosModules.home-manager
          
        ];
      };
    };
  };
}
