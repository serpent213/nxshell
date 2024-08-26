# Nix DevShell for [NuttX](https://nuttx.apache.org) on ESP32

based on https://github.com/mirrexagon/nixpkgs-esp-dev/

## Nix Build System

x86_64 and apple

## Example Usage

Starting from a clean slate, either NixOS or some other distro with
[Nix](https://nixos.org/download/) installed on top:

```sh
$ nix develop .#esp32s3 -c fish

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

**Not ready yet!**
