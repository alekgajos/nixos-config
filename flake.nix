{
    description = "Home Manager configuration";

    inputs = {

    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };

	cursor = {
		url = "github:omarcresp/cursor-flake/main";
		inputs.nixpkgs.follows = "nixpkgs";
	};

	quickshell = {
		url = "github:quickshell-mirror/quickshell";
		inputs.nixpkgs.follows = "nixpkgs";
	};

	niri = {
		url = "github:sodiboo/niri-flake";
		inputs.nixpkgs.follows = "nixpkgs";
	};

	dankMaterialShell = {
		url = "github:AvengeMedia/DankMaterialShell";
		inputs.nixpkgs.follows = "nixpkgs";
	};

    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zig-overlay = {
      url = "github:mitchellh/zig-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zig = {
      url = "github:silversquirl/zig-flake/compat";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zls = {
      url = "github:zigtools/zls";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
        url = "github:nix-community/neovim-nightly-overlay";
    };

    };                                      
    
    outputs = { nixpkgs, home-manager, ...} @ inputs:
        let
            lib = nixpkgs.lib;
            system = "x86_64-linux";
            pkgs = import nixpkgs {
                inherit system;
                overlays = [
                    inputs.zig-overlay.overlays.default
                ];
            };
        in {
            homeConfigurations = {
                default-profile = home-manager.lib.homeManagerConfiguration {
                    inherit pkgs;
                    modules = [
                        ./home.nix 
                        ];
		    extraSpecialArgs = { inherit inputs; };
                };
            };

# 
            devShells."${system}".default = let
                pkgs = import nixpkgs { inherit system; };
            in pkgs.mkShell {

                packages = with pkgs; [
                    zig.packages.${system}.nightly
                    zls.packages.${system}.zls
                ];
            };
#

        };
}

