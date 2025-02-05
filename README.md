# Marlin 2 for EasyThreeD K7 STM32 (ET4000+ Board)
This repository reflects my work on the EasyThreeD K7 3D printer.
The K7 printer has been sold with a number of mainboards. My printer has the 32-bit board 'ET4000+', which is shared by the Nano and Dora printers from the same manufacturer, and so these files only apply to that model.
- If you have a K7 with the ET-4000-V2 board, please see https://github.com/tux-friend/Easythreed-K7-ET-4000-V2
- Recently, a N32 processor board CF-M12 has appeared, which I have not seem firmware for https://github.com/schmttc/EasyThreeD-K7-STM32/issues/4
- This firmware is compatible with the AT32F403ARCT7 processor

The board's bootloader is proprietary by MKS, which reads a binary firmware file mksLite.bin from the SD card on boot. After a short time (<30s) the firmware is written to the board, and the files on the SD card renamed *.CUR.

# Branch: master
This is a clone of Marlin 2.1.2.1, configured for the EasyThreeD K7 ET4000+. All changes have been submitted to the main Marlin repository.

- For the original firmware source and binaries based on Marlin 1.1.1 supplied by the manufacturer, see https://github.com/schmttc/EasyThreeD-K7-STM32/tree/Original-Firmware-Marlin-1.1.1
- For additional files related to the printer, see https://github.com/schmttc/EasyThreeD-K7-STM32/tree/Additional-Files

## Overview
- Compile using PlatformIO, board "mks_robin_lite_maple" 
- Physical buttons and LED currently are functional as per the standard manufacturer's behaviour
- Start button LED
  - LED blinks slowly when printing/processing
  - When paused blinks LED quickly
  - LED is on when job is cancelled or completed
- Home button and filament feed/retract slider working
- Long press print button to raise print head 10mm while not printing
- Short press print button to print most recent file on SD card
- Serial baud rate is set to 115200, matching the original firmware

## Modified Files
- Configuration_adv.h - SD_DETECT set to LOW (bugfix)
- ini/stm32f1-maple.ini - Compile bugfix https://github.com/MarlinFirmware/Marlin/issues/25346
- src\feature\easythreed_ui.cpp - Button behaviours

The files below are included in Marlin mainline from 2.0.9.3, and are listed for reference.
- Configuration.h - configured for EasyThreeD K7
- Configuration_adv.h - configured for EasyThreeD K7
- src\pins\stm32f1\pins_MKS_ROBIN_LITE.h - Added pin definitions for EXP1 port reassigned from LCD to Buttons
- src\MarlinCore.cpp - Includes additional functions to handle complex button behaviour
- src\feature\easythreed_ui.cpp - Button behavour main code
- src\feature\easythreed_ui.h - C header file

## Additional Files
Compiled binary - mksLite.bin
- Hotbed is enabled. If you do not have a hotbed, make sure the temp is set to 0 in your slicer
- Backlash correction is enabled
- Input Shaping: Disabled, not yet tested

## Notes on Marlin 2 Config
- Make sure 'VALIDATE_HOMING_ENDSTOPS' is disabled, as we do not have X and Y stoppers to provide feedback, and the printer will halt.
- Multiple calls in quick succession to queue.inject_P() will fail. Use a single call, with multiple commands seprated by "\n"
- Setting acceleration of around 100 or higher may result in layer shifting when backlash compensation is enabled; therefore max acceleration is set to 50. This can be overridden with M201. (see https://github.com/schmttc/EasyThreeD-K7-STM32/issues/2 )
  - Some users are reporting minimal or no layer shift with version 2.1.2, so YMMV
  - Branch 'backlashfix' has a fix enabled that seems to be working, please try this if you experience backlash and let me know how it goes

## References to button code in original firmware
https://github.com/schmttc/EasyThreeD-K7-STM32/blob/Original-Firmware-Marlin-1.1.1/mksRobinLite_nano/Inc/main.h
EXP1 (LCD Expansion Port) pins defined for use by physical buttons. Search for line "//EXP1 FOR NANO" at bottom of file.

https://github.com/schmttc/EasyThreeD-K7-STM32/blob/Original-Firmware-Marlin-1.1.1/mksRobinLite_nano/Src/nano.cpp
Contains the custom MKS code defining button behaviour. Some of the macros used here are an older style, and no longer compatible with Marlin 2.

## License
Marlin Firmware: https://github.com/MarlinFirmware/Marlin

Marlin is published under the [GPL license](https://github.com/COPYING.md) because we believe in open development. The GPL comes with both rights and obligations. Whether you use Marlin firmware as the driver for your open or closed-source product, you must keep Marlin open, and you must provide your compatible Marlin source code to end users upon request. The most straightforward way to comply with the Marlin license is to make a fork of Marlin on Github, perform your modifications, and direct users to your modified fork.

While we can't prevent the use of this code in products (3D printers, CNC, etc.) that are closed source or crippled by a patent, we would prefer that you choose another firmware or, better yet, make your own.
