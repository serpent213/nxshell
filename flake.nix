{
  description = "Nix DevShell for NuttX on ESP32";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: {
      formatter = nixpkgs.legacyPackages.${system}.alejandra;
    })
    // {
      templates = {
        esp32 = {
          description = "NuttX toolchain for Espressif ESP32 SoC MCUs";
          path = ./esp32;
        };
      };
    };
}
