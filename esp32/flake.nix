{
  description = "ESP32 toolchain for NuttX";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    # inputs.esp-dev.url = "github:mirrexagon/nixpkgs-esp-dev?rev=112c9d10b9e171bacf68b91ee63606ab6f9a4529";
    esp-dev.url = "github:mirrexagon/nixpkgs-esp-dev";
    flake-utils.url = "github:numtide/flake-utils";
  };

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
          # Function to check if an input is a Python environment
          isPythonEnv = input: builtins.hasAttr "python" input && builtins.hasAttr "pkgs" input.python;

          pkgs = import nixpkgs {
            inherit system;

            overlays = [
              esp-dev.overlays.default

              (final: prev: rec {
                # esptool = pkgs.stdenv.mkDerivation {
                #   name = "dummy-package";
                #   version = "1.0";
                #   src = null;
                #   # phases = [];
                #   phases = ["installPhase"];
                #   installPhase = ''
                #     mkdir -p $out
                #   '';
                
              #   idf-without-esptool = pkgs.buildEnv {
              #     name = "esp-idf";
              #     paths = [ pkgs.esp-idf-esp32 ];
              #     # pathsToLink = [ "/bin" ];
              #     # postBuild = ''
              #     #   find . -name "*esptool*"
              #     #   rm -rvf components/esptool_py
              #     # '';
              #   };

              #   idf-without-esptool = prev.esp-idf-esp32.overrideAttrs(oldAttrs: {
              #     postInstall = ''
              #       find . | cat
              #     '';
              #   });
              })
            ];
          };

        in
        pkgs.mkShell {
          packages = with pkgs; [
            # attempts to download packages, we need to provide those beforehand
            # (callPackage ./toolchain.nix {})

            # esp-idf-esp32
            # idf-without-esptool
            # (pkgs.buildEnv {
            #   name = "esp-idf-custom";
            #   paths = [ pkgs.esp-idf-esp32 ];
            #   pathsToLink = [ "/" ];
            #   # postBuild = ''
            #   #   find . -name "*esptool*"
            #   #   rm -rvf components/esptool_py
            #   # '';
            (esp-idf-esp32.overrideAttrs (oldAttrs: {
              propagatedBuildInputs = 
                (builtins.filter
                  (input: !(isPythonEnv input ))
                  oldAttrs.propagatedBuildInputs
                );

              # We want to keep out the full ESP-IDF and bundled Python,
              # avoid setting environment variables
              setupHook = null;
              installPhase = ''
                mkdir -p $out
                cp -rv . $out/
              '';

              # postBuild = ''
              #   ${oldAttrs.postBuild or ""}
              #   rm -rvf components/esptool_py
              # '';
            }))
            # (esp-idf-esp32.override {
            #   esptool = pkgs.stdenv.mkDerivation {
            #     name = "dummy-package";
            #     version = "1.0";
            #     src = null;
            #     phases = [];
            #   };
            # })
            # })
            # (esp-idf-full.override {
              # rev = "v5.2";
              # sha256 = "sha256-+tAb32TXeMZzU7QiVlRYMKKUCkqGiOIMdL4vzUgGbzA=";
              # rev = "v5.1.3";
              # sha256 = "sha256-0QsIFOcSx1N15t5po3TyOaNvpzBUfKaFdsRODOBoXCI=";
              # rev = "v5.1.4";
              # sha256 = "sha256-WJIt0ixoD3lhLg5A/ILUhcGPd7oSlMn6e6xsgRGP2Kk=";
              # rev = "v5.3";
              # sha256 = "sha256-w+xyva4t21STVtfYZOXY2xw6sDc2XvJXBZSx+wd1N6Y=";
              # toolsToInclude = [
              #   "xtensa-esp-elf"
              #   "esp32ulp-elf"
              #   "openocd-esp32"
              #   "xtensa-esp-elf-gdb"
              # ];
            # })

            # NuttX
            esptool
            python3Packages.kconfiglib

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
