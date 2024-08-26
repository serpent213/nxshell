{
  description = "ESP32 toolchain for NuttX";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    esp-dev.url = "github:mirrexagon/nixpkgs-esp-dev";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    esp-dev,
    flake-utils,
    nixpkgs,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      # Function to check if an input is a Python environment
      isPythonEnv = input: builtins.hasAttr "python" input && builtins.hasAttr "pkgs" input.python;

      pkgs = import nixpkgs {
        inherit system;

        overlays = [esp-dev.overlays.default];
      };

      crossShell = parent:
        pkgs.mkShell {
          packages = with pkgs; [
            # Filter out the bundled Python package, it would collide
            # with our esptool installation and we don't need it.
            (parent.overrideAttrs (oldAttrs: {
              propagatedBuildInputs = (
                builtins.filter
                (input: !(isPythonEnv input))
                oldAttrs.propagatedBuildInputs
              );

              # Avoid setting environment variables
              setupHook = null;

              installPhase = ''
                mkdir -p $out
                # Actually, we take nothing from the esp-idf itself
                # cp -rv . $out/
              '';
            }))

            # NuttX
            esptool
            python3Packages.kconfiglib
          ];
        };
    in {
      devShells = with pkgs; {
        default = crossShell esp-idf-esp32;
        full = crossShell esp-idf-full;
        esp32 = crossShell esp-idf-esp32;
        esp32c3 = crossShell esp-idf-esp32c3;
        esp32s2 = crossShell esp-idf-esp32s2;
        esp32s3 = crossShell esp-idf-esp32s3;
        esp32c6 = crossShell esp-idf-esp32c6;
        esp32h2 = crossShell esp-idf-esp32h2;
      };
    });
}
