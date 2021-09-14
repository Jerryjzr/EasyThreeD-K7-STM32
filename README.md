# EasyThreeD K7 STM32 (ET4000+ Board)
This repository reflects my research on the EasyThreeD K7 3D printer.
The K7 printer has been sold with either an 8-bit or 32-bit board, with the latter appearing in more recent purchases. My printer has the 32-bit board 'ET4000+', which is shared by the Nano and Dora printers from the same manufacture, and so these files only apply to that model.

The board's bootloader is proprietary by MKS, which reads a binary firmware file mksLite.bin, and a configuration file lite_cfg.txt from the SD card on first boot. After a short time (<30s) the firmware is written to the board, and the files on the SD card renamed *.CUR.

## EasyThreeDSupplied
Files supplied by the manufacturer, EasyThreeD.
### Default firmware
Binary firmware and mks configuration file
### Hotbed firmware
Binary firmware and mks configuration file supplied with the optional mainboard controlled hotbed. The only difference I can see is in the configuration file hotbed option.
### mksRobinLite_nano
Original firmware source code. This is a MKS modified version of Marlin 1.1.1

## Marlin2
Files relating to Marlin 2 firmware, WIP.
- Compile using PlatformIO, board "mks_robin_lite_maple"
- Physical buttons and LED currently not functional, printer must be controlled via USB cable
- Serial baud rate is set to 115200, matching the original firmware
### EasyThreeD K7 configuration files for Marlin 2.0.9
Default Marlin 2.0.9 configuration files, modified to match those in the manufacturer's 1.1.1 firmware
- Configuration.h
- Configuration_adv.h

### Notes on Marlin 2 Config
- Make sure 'VALIDATE_HOMING_ENDSTOPS' is disabled, as we do not have X and Y stoppers to provide feedback, and the printer will halt.

## Marlin2Buttons
Files from the original source code, relating to the physical buttons. The intention is to configure Marlin's custom buttons in 'Configuration_adv.h' to provide this functionality.
###EasyThreeDSupplied\mksRobinLite_nano\inc\main.h
EXP1 (LCD Expansion Port) pins defined for use by physical buttons. Search for line "//EXP1 FOR NANO" at bottom of file.
###EasyThreeDSupplied\mksRobinLite_nano\Src\nano.cpp
Contains the custom MKS code defining button behaviour. Some of the macros used here are an older style, and no longer compatible with Marlin 2.



## License
Marlin is published under the [GPL license](https://github.com/COPYING.md) because we believe in open development. The GPL comes with both rights and obligations. Whether you use Marlin firmware as the driver for your open or closed-source product, you must keep Marlin open, and you must provide your compatible Marlin source code to end users upon request. The most straightforward way to comply with the Marlin license is to make a fork of Marlin on Github, perform your modifications, and direct users to your modified fork.

While we can't prevent the use of this code in products (3D printers, CNC, etc.) that are closed source or crippled by a patent, we would prefer that you choose another firmware or, better yet, make your own.
