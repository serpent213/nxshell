# Nix DevShell for [NuttX](https://nuttx.apache.org) on ESP32

based on https://github.com/mirrexagon/nixpkgs-esp-dev/

This flake provides development shells for embedded RTOS projects using Nix.
It aims to simplify the setup of consistent build environments for
MCU development.

## Features

- Reproducible build environments across different machines
- Isolated package management to prevent dependency conflicts
- Easy switching between different toolchain versions
- Declarative configuration of the entire development environment

## Quick Start

1. Ensure Nix is installed on your system
2. Clone this repository
3. Enter the development shell:

## Nix Build System

x86_64 and apple

## Example Usage

Starting from a clean slate, either NixOS or some other distro with
[Nix](https://nixos.org/download/) installed on top:

Clone the flake, so you can add [Nix packages](https://search.nix.org) to your
environment later on.

Enable Nix flakes (if not done otherwise):

`$ mkdir -p ~/.config/nix && echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf`

This will instantiate a shell with all necessary tools for embedded
RTOS development:

`$ nix develop "github:serpent213/nxshell?dir=esp32#esp32s3"`

Configure and build NuttX:

```
$$ cd ~/nuttxspace/nuttx

$$ ./tools/configure.sh -l esp32s3-devkit:wifi
  Copy files
  Select CONFIG_HOST_LINUX=y
  Refreshing...
CP: arch/dummy/Kconfig to /home/self/nuttxspace/nuttx/arch/dummy/dummy_kconfig
CP: boards/dummy/Kconfig to /home/self/nuttxspace/nuttx/boards/dummy/dummy_kconfig
LN: platform/board to /home/self/nuttxspace/apps/platform/dummy
LN: include/arch to arch/xtensa/include
LN: include/arch/board to /home/self/nuttxspace/nuttx/boards/xtensa/esp32s3/esp32s3-devkit/include
LN: drivers/platform to /home/self/nuttxspace/nuttx/drivers/dummy
LN: include/arch/chip to /home/self/nuttxspace/nuttx/arch/xtensa/include/esp32s3
LN: arch/xtensa/src/chip to /home/self/nuttxspace/nuttx/arch/xtensa/src/esp32s3
LN: arch/xtensa/src/board to /home/self/nuttxspace/nuttx/boards/xtensa/esp32s3/esp32s3-devkit/../common
LN: arch/xtensa/src/board/board to /home/self/nuttxspace/nuttx/boards/xtensa/esp32s3/esp32s3-devkit/src
mkkconfig in /home/self/nuttxspace/apps
Loaded configuration '.config'
Configuration saved to '.config'

$$ make -j6
Create version.h
LN: platform/board to /home/self/nuttxspace/apps/platform/dummy
Cloning Espressif HAL for 3rd Party Platforms
Register: rand
Register: iperf
Register: renew
Register: nsh
Register: ping
Register: sh
Register: wapi
Espressif HAL for 3rd Party Platforms: 4da68b02f8d65613d80eadc269034acb84aca756
Espressif HAL for 3rd Party Platforms: initializing submodules...
Applying patches...
CPP:  /home/self/nuttxspace/nuttx/boards/xtensa/esp32s3/esp32s3-devkit/../common/scripts/esp32s3_peripherals.ld-> /home/self/nuttxspace/nuttx/boards/xtensa/esp32s3/esp32s3-devkit/../common/scripts/esp32s3_peripheraCPP:  /home/self/nuttxspace/nuttx/boards/xtensa/esp32s3/esp32s3-devkit/../common/scripts/esp32s3_rom_aliases.ld-> /home/self/nuttxspace/nuttx/boards/xtensa/esp32s3/esp32s3-devkit/../common/scripts/esp32s3_rom_aliasCPP:  /home/self/nuttxspace/nuttx/boards/xtensa/esp32s3/esp32s3-devkit/../common/scripts/simple_boot_sections.ld-> /home/self/nuttxspace/nuttx/boards/xtensa/esp32s3/esp32s3-devkit/../common/scripts/simple_boot_sectCPP:  /home/self/nuttxspace/nuttx/arch/xtensa/src/chip/esp-hal-3rdparty/components/esp_rom/esp32s3/ld/esp32s3.rom.api.ld-> /home/self/nuttxspace/nuttx/arch/xtensa/src/chip/esp-hal-3rdparty/components/esp_rom/esp32sCPP:  /home/self/nuttxspace/nuttx/arch/xtensa/src/chip/esp-hal-3rdparty/components/esp_rom/esp32s3/ld/esp32s3.rom.ld-> /home/self/nuttxspace/nuttx/arch/xtensa/src/chip/esp-hal-3rdparty/components/esp_rom/esp32s3/ldCPP:  /home/self/nuttxspace/nuttx/arch/xtensa/src/chip/esp-hal-3rdparty/components/esp_rom/esp32s3/ld/esp32s3.rom.libgcc.ld-> /home/self/nuttxspace/nuttx/arch/xtensa/src/chip/esp-hal-3rdparty/components/esp_rom/espCPP:  /home/self/nuttxspace/nuttx/arch/xtensa/src/chip/esp-hal-3rdparty/components/esp_rom/esp32s3/ld/esp32s3.rom.newlib.ld-> /home/self/nuttxspace/nuttx/arch/xtensa/src/chip/esp-hal-3rdparty/components/esp_rom/espCPP:  /home/self/nuttxspace/nuttx/arch/xtensa/src/chip/esp-hal-3rdparty/components/esp_rom/esp32s3/ld/esp32s3.rom.version.ld-> /home/self/nuttxspace/nuttx/arch/xtensa/src/chip/esp-hal-3rdparty/components/esp_rom/esCPP:  /home/self/nuttxspace/nuttx/arch/xtensa/src/chip/esp-hal-3rdparty/components/soc/esp32s3/ld/esp32s3.peripherals.ld-> /home/self/nuttxspace/nuttx/arch/xtensa/src/chip/esp-hal-3rdparty/components/soc/esp32s3/ldLD: nuttx
CP: nuttx.hex
MKIMAGE: ESP32-S3 binary
esptool.py -c esp32s3 elf2image --ram-only-header -fs 4MB -fm dio -ff 40m -o nuttx.bin nuttx
esptool.py v4.7.0
Creating esp32s3 image...
ROM segments hidden - only RAM segments are visible to the ROM loader!
Merged 1 ELF section
Successfully created esp32s3 image.
Generated: nuttx.bin
```

To create a clone of the flake to be modified according to your requirements:

```
$ mkdir new
$ git init
$ nix flake init -t github:serpent213/nxshell#esp32
```

## Future Vision

[This flake aims to replace traditional build systems like Make for MCU RTOS development.]
The goal is to provide a more reliable and reproducible build process, eliminating common
issues such as toolchain version mismatches or missing dependencies.

By leveraging Nix, we envision a future where building RTOS images is as simple as running
a single command, resulting in bit-for-bit reproducible builds across different development
environments.

Contributions and feedback are welcome to help realize this vision and improve embedded
development workflows.

## To Do

- [ ] Tests/checks
- [ ] GitHub test runners
- [ ] Introduce other architectures
    - [ ] ARM
    - [ ] Generic RISC-V
