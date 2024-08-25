{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
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
  inputsFrom = [ pkgs.ncurses ];
}
