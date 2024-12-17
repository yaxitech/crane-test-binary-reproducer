{
  description = "Demonstrates that crane uses the binary from `cargo test`";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    crane.url = "github:ipetkov/crane";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, crane, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        craneLib = crane.mkLib pkgs;

        common = {
          pname = "app";
          version = "0.0.1";
          src = craneLib.cleanCargoSource ./.;
        };
      in
      {
        packages = {
          with-crane = craneLib.buildPackage common;
          with-nixpkgs = pkgs.rustPlatform.buildRustPackage (common // {
            cargoLock.lockFile = ./Cargo.lock;
          });
        };
      }
    );
}
