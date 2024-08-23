# Nix DevShell for [NuttX](https://nuttx.apache.org) on ESP32

based on https://github.com/numtide/devshell/
and https://github.com/espressif/crosstool-NG/

**Not ready yet!**

crosstool-NG build log (interactive):

```
[INFO ]  Performing some trivial sanity checks
[WARN ]  Number of open files 256 may not be sufficient to build the toolchain; increasing to 2048
[INFO ]  Build started 20240823.224528
[INFO ]  Building environment variables
[WARN ]  Directory '$HOME/src' does not exist.
[WARN ]  Will not save downloaded tarballs to local storage.
[EXTRA]  Preparing working directories
[EXTRA]  Installing user-supplied crosstool-NG configuration
[EXTRA]  =================================================================
[EXTRA]  Dumping internal crosstool-NG configuration
[EXTRA]    Building a toolchain for:
[EXTRA]      build  = aarch64-apple-darwin23.6.0
[EXTRA]      host   = aarch64-apple-darwin23.6.0
[EXTRA]      target = xtensa-esp32-elf
[EXTRA]  Dumping internal crosstool-NG configuration: done in 0.00s (at 00:01)
[INFO ]  =================================================================
[INFO ]  Retrieving needed toolchain components' tarballs
[EXTRA]    Retrieving 'zlib-1.2.13'
[EXTRA]    Retrieving 'zstd-1.5.5'
[EXTRA]    Retrieving 'gmp-6.2.1'
[EXTRA]    Retrieving 'mpfr-4.2.1'
[EXTRA]    Retrieving 'isl-0.26'
[EXTRA]    Retrieving 'mpc-1.2.1'
[EXTRA]    Retrieving 'binutils-git-b5cdb6b4'
[EXTRA]    Checking out 'binutils-git-b5cdb6b4' (git https://github.com/espressif/binutils-gdb.git, branch esp-2.39.0_20230208)
[EXTRA]    Retrieving 'gcc-git-a1f3ab46'
[EXTRA]    Checking out 'gcc-git-a1f3ab46' (git https://github.com/espressif/gcc.git, branch esp-12.2.0_20230208)
[EXTRA]    Retrieving 'newlib-git-ff0b7d93'
[EXTRA]    Checking out 'newlib-git-ff0b7d93' (git https://github.com/espressif/newlib-esp32.git, branch esp-4.1.0_20230208)
[INFO ]  Retrieving needed toolchain components' tarballs: done in 183.00s (at 03:04)
[INFO ]  =================================================================
[INFO ]  Extracting and patching toolchain components
[ERROR]    Overlay ./overlays/xtensa_esp32 not found
[ERROR]
[ERROR]  >>
[ERROR]  >>  Build failed in step 'Extracting and patching toolchain components'
[ERROR]  >>        called in step '(top-level)'
[ERROR]  >>
[ERROR]  >>  Error happened in: CT_Abort[scripts/functions@488]
[ERROR]  >>        called from: CT_DoExtractPatch[scripts/functions@2261]
[ERROR]  >>        called from: CT_PackageRun[scripts/functions@2090]
[ERROR]  >>        called from: CT_ExtractPatch[scripts/functions@2436]
[ERROR]  >>        called from: do_zlib_extract[scripts/build/companion_libs/050-zlib.sh@21]
[ERROR]  >>        called from: do_companion_libs_extract[scripts/build/companion_libs.sh@22]
[ERROR]  >>        called from: main[scripts/crosstool-NG.sh@668]
[ERROR]  >>
[ERROR]  >>  For more info on this error, look at the file: 'build.log'
[ERROR]  >>  There is a list of known issues, some with workarounds, in:
[ERROR]  >>      https://crosstool-ng.github.io/docs/known-issues/
[ERROR]  >>
[ERROR]  >> NOTE: Your configuration includes features marked EXPERIMENTAL.
[ERROR]  >> Before submitting a bug report, try to reproduce it without enabling
[ERROR]  >> any experimental features. Otherwise, you'll need to debug it
[ERROR]  >> and present an explanation why it is a bug in crosstool-NG - or
[ERROR]  >> preferably, a fix.
[ERROR]  >>
[ERROR]  >>  If you feel this is a bug in crosstool-NG, report it at:
[ERROR]  >>      https://github.com/crosstool-ng/crosstool-ng/issues/
[ERROR]  >>
[ERROR]  >>  Make sure your report includes all the information pertinent to this issue.
[ERROR]  >>  Read the bug reporting guidelines here:
[ERROR]  >>      http://crosstool-ng.github.io/support/
[ERROR]
[ERROR]  (elapsed: 3:03.00)
[03:04] / make: *** [ct-ng:261: build] Error 1
```
