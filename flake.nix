{
  description = "rbsilly";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    { }
    // flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      rec {
        devShells.default = pkgs.stdenv.mkDerivation {
          name = "rbsilly";
          buildInputs = with pkgs; [
            ruby_3_4
            rubyfmt
            rubyPackages_3_4.rails
            rubyPackages_3_4.rubocop
            libyaml
          ];
        };
      }
    );
}
