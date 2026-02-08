{
	description = "base flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.11";
	};

	outputs = {self, nixpkgs, ...}:
		let 
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			stateVersion = "25.11";
			pkgs = nixpkgs.legacyPackages.${system};

			username = "charlotte";
			hostname = "nixos";
			locale = "de_DE.UTF-8";
			timezone = "Europe/Berlin";

			home-manager = builtins.fetchTarball {
        url = "https://github.com/nix-community/home-manager/archive/release-${stateVersion}.tar.gz";
        sha256 = "1kqxy6r4ahnbazmpa4pncdp62najdikdaw8hvrv8nl6qxvbmf9fy";
      };
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
					inherit home-manager;
				};
			};
		};
	};
}
