## Installation
# sh <(curl -L https://nixos.org/nix/install) --daemon
#
## Apply it
# nix develop
{
  description = "Flake for vps";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          nodejs_22
          git
          curl
          htop
          docker
          nginx
        ];
      };
    });
}
