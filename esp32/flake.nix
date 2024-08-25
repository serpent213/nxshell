{
  description = "ESP32 toolchain for NuttX";

  inputs.devshell.url = "github:numtide/devshell";
  inputs.esp-dev.url = "github:mirrexagon/nixpkgs-esp-dev";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  # inputs.flake-compat = {
  #   url = "github:edolstra/flake-compat";
  #   flake = false;
  # };

  outputs =
    {
      self,
      devshell,
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
              devshell.overlays.default
              esp-dev.overlays.default
              # (import "${esp-dev}/overlay.nix")
            ];
          };
        in
        pkgs.devshell.mkShell {
          imports = [ (pkgs.devshell.importTOML ./devshell.toml) ];
          commands = [
            { package = pkgs.esp-idf-esp32; }
          ];
          packages = with pkgs; [
            # attempts to download packages, we need to provide those beforehand
            # (callPackage ./toolchain.nix {})

            # esp-idf-esp32
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
