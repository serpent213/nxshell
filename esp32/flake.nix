{
  description = "ESP32 toolchain for NuttX";

  inputs.esp-dev.url = "github:mirrexagon/nixpkgs-esp-dev";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs =
    {
      self,
      esp-dev,
      flake-utils,
      nixpkgs,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (system: {
      devShells.default =
        let
          pkgs = import nixpkgs {
            inherit system;

            overlays = [
              esp-dev.overlays.default
            ];
          };
        in
        pkgs.mkShell {
          packages = with pkgs; [
            # attempts to download packages, we need to provide those beforehand
            # (callPackage ./toolchain.nix {})

            esp-idf-esp32
            # (esp-idf-esp32.override {
            #   rev = "cf7e743a9b2e5fd2520be4ad047c8584188d54da";
            #   sha256 = "sha256-tqWUTJlOWk4ayfQIxgiLkTrrTFU0ZXuh76xEZWKRZ/s=";
            # })

            # for interactive build
            # autoconf
            # automake
            # binutils
            # ncurses
            # gnused
            # gawk
            # gnum4
            # flex
            # yacc
            # texinfo
            # help2man
            # which
            # libtool
            # unzip
          ];
        };
    });
}
