{
	description = "base flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.11";
		#home-manager.url = "github:nix-community/home-manager/release-25.11";
		#home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = {self, nixpkgs, home-manager, ...}: 
		let 
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			stateVersion = "25.11";
			pkgs = nixpkgs.legacyPackages.${system};

			username = "charlotte";
			hostname = "nixos";
			locale = "de_DE.UTF-8";
			timezone = "Europe/Berlin";
		in {
	
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				inherit system;
				modules = [ ./configuration.nix ];
				specialArgs = {
					inherit username;
					inherit hostname;
					inherit locale;
					inherit timezone;
					inherit stateVersion;
				};
			};
		};
		#homeConfigurations = {
		#	charlotte = home-manager.lib.homeManagerConfiguration {
		#		inherit pkgs;
		#		modules = [ ./home.nix ];
		#		extraSpecialArgs = {
		#			inherit username;
		#			inherit stateVersion;
		#		};
		#	};
		#};
	};
}
