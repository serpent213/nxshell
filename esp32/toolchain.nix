{lib, stdenv, fetchFromGitHub, autoconf, automake, binutils, ncurses, flex,
  yacc, gnused, gawk, gnum4, texinfo, help2man, which, libtool, unzip}:


stdenv.mkDerivation rec {
  pname = "crosstool-ng";
  version = "12.2.0_20230208";

  src = fetchFromGitHub {
    owner = "espressif";
    repo = "crosstool-NG";
    rev = "esp-12.2.0_20230208";
    sha256 = "sha256-bszoRXoUhu0WACOVWLNzDLYJ6l3C8CJ7E6roXTtR3Lc";
  };

  nativeBuildInputs = [ autoconf automake binutils flex yacc gnused gawk gnum4 texinfo help2man which libtool unzip ];

  buildInputs = [ ncurses ];

  postFetch = ''
    git submodule update --init --recursive
  '';

  preConfigure = ''
    ./bootstrap
  '';

  configureFlags = [
    "--enable-local"
  ];

  postBuild = ''
    unset CC CXX
    ./ct-ng xtensa-esp32-elf
    ./ct-ng build
  '';

  installFlags = "DESTDIR=$out";

  meta = with lib; {
    description = "crosstool-NG for the xtensa-esp32-elf toolchain";
    homepage = "https://github.com/espressif/crosstool-NG";
    license = licenses.gpl2;
  };
}
