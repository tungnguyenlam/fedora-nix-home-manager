{
  description = "Home Manager configuration for Fedora";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations.tungnguyen = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home.nix
      ];
    };

    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        python3
        python3Packages.virtualenv
        stdenv.cc.cc.lib
      ];

      shellHook = ''
        # Make C/C++ runtime libs visible for binary wheels.
        export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ]}:$LD_LIBRARY_PATH"
        echo "Python development shell loaded!"
        if [ ! -d .venv ]; then
          python -m venv .venv
        fi
        source .venv/bin/activate
      '';
    };
  };
}
