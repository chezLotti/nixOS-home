{
	description = "base flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.11";
	};

	outputs = {self, nixpkgs, ...}:
		let 
			lib = nixpkgs.lib;
			pkgs = nixpkgs.legacyPackages.${system};
			system = "x86_64-linux";
			systemSettings = {
				hostname = "nixos";
				stateVersion = "25.11";
        locale = "de_DE.UTF-8";
        timezone = "Europe/Berlin";
			};

			home-manager = builtins.fetchTarball {
        url = "https://github.com/nix-community/home-manager/archive/release-${systemSettings.stateVersion}.tar.gz";
        sha256 = "1kqxy6r4ahnbazmpa4pncdp62najdikdaw8hvrv8nl6qxvbmf9fy";
      };
		in {
	
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				inherit system;
				modules = [ ./configuration.nix ];
				specialArgs = {
					inherit systemSettings;
					inherit home-manager;
				};
			};
		};
	};
}
