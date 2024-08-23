{
  description = "ESP32 toolchain for NuttX";

  inputs.devshell.url = "github:numtide/devshell";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  inputs.flake-compat = {
    url = "github:edolstra/flake-compat";
    flake = false;
  };

  outputs =
    {
      self,
      flake-utils,
      devshell,
      nixpkgs,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (system: {
      devShells.default =
        let
          pkgs = import nixpkgs {
            inherit system;

            overlays = [ devshell.overlays.default ];
          };
        in
        pkgs.devshell.mkShell {
          imports = [ (pkgs.devshell.importTOML ./devshell.toml) ];
          packages = with pkgs; [
            # attempts to download packages, we need to provide those beforehand
            # (callPackage ./toolchain.nix {})

            # for interactive build
            autoconf
            automake
            binutils
            ncurses
            gnused
            gawk
            gnum4
            flex
            yacc
            texinfo
            help2man
            which
            libtool
            unzip
          ];
        };
    });
}
