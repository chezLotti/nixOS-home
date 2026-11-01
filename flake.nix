{
	description = "base flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.11";
    forticlient-nixos.url = "github:jplana/forticlient-nixos";
	};

	outputs = {self, nixpkgs, forticlient-nixos, ...}:
		let 
			lib = nixpkgs.lib;
			pkgs = nixpkgs.legacyPackages.${system};
			system = "x86_64-linux";
			systemSettings = {
				hostname = "imusingnixbtw";
				stateVersion = "25.11";
        locale = "de_DE.UTF-8";
        timezone = "Europe/Berlin";
			};

			home-manager = builtins.fetchTarball {
        url = "https://github.com/nix-community/home-manager/archive/release-${systemSettings.stateVersion}.tar.gz";
        sha256 = "13fmry1jd0na71fxhzms9qf3ybj6shgvnphq4p1akxxmv44gzq20";
      };
		in {
	
		nixosConfigurations = {
			imusingnixbtw = lib.nixosSystem {
				inherit system;
				modules = [
          forticlient-nixos.nixosModules.forticlient
          ({ ... }: {
            services.forticlient.enable = true;
            # Auto-unlock the keyring on login — use your display manager:
            #services.forticlient.gnomeKeyring.pamServices = [ "login" "sddm" ];
          })
          ./configuration.nix
        ];
				specialArgs = {
					inherit systemSettings;
					inherit home-manager;
				};
			};
		};
	};
}

