///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.30.1.114/W32 for ARM        07/Apr/2021  11:04:58
// Copyright 1999-2018 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\PLT\Desktop\mksRobinLite_nano\Middlewares\Third_Party\Marlin\digipot_mcp4451.cpp
//    Command line =  
//        -f C:\Users\PLT\AppData\Local\Temp\EW6BAC.tmp
//        (C:\Users\PLT\Desktop\mksRobinLite_nano\Middlewares\Third_Party\Marlin\digipot_mcp4451.cpp
//        -D USE_HAL_DRIVER -D STM32F103xE -D MKS_ROBIN -D MARLIN -D __arm__ -D
//        USE_MKS_WIFI --preprocess=s
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM\mksRobinLite\List -lC
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM\mksRobinLite\List -lA
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM\mksRobinLite\List
//        --diag_suppress Pa050 -o
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM\mksRobinLite\Obj
//        --no_unroll --no_inline --no_tbaa --no_scheduling --debug
//        --endian=little --cpu=Cortex-M3 -e --char_is_signed --fpu=None
//        --dlib_config "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.1\arm\inc\c\DLib_Config_Full.h" -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Inc\ -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Src\ -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Drivers/STM32F1xx_HAL_Driver/Inc\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Drivers/STM32F10x_StdPeriph_Driver/Inc\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Drivers/CMSIS/Device/ST/STM32F1xx/Include\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Drivers/CMSIS/Include\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Drivers/BSP/STM32MKS-3dPrinter\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Drivers/BSP/Components/Common\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Drivers/BSP/Components/l6474\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Drivers/BSP/Components/at24cxx\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Drivers/BSP/Components/w25qxx\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Drivers/BSP/MotorControl\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Middlewares/Third_Party/FatFs/src\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Middlewares/Third_Party/FatFs/src/drivers\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Middlewares/Third_Party/Marlin\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Middlewares/Third_Party/u8glib_arm_v1.17/src\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Middlewares/arduino\
//        -I
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Middlewares/arduino/avr\
//        -I C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM/../Inc/Logo\ -Om
//        --c++ --no_exceptions --no_rtti -I "D:\Program Files (x86)\IAR
//        Systems\Embedded Workbench 8.1\arm\CMSIS\Core\Include\" -I
//        "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.1\arm\CMSIS\DSP\Include\")
//    Locale       =  C
//    List file    =  
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM\mksRobinLite\List\digipot_mcp4451.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__CPP_Exceptions", "Disabled"
        RTMODEL "__CPP_Language", "C++14"
        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_version", "6"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1


        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// C:\Users\PLT\Desktop\mksRobinLite_nano\Middlewares\Third_Party\Marlin\digipot_mcp4451.cpp
//    1 /**
//    2  * Marlin 3D Printer Firmware
//    3  * Copyright (C) 2016 MarlinFirmware [https://github.com/MarlinFirmware/Marlin]
//    4  *
//    5  * Based on Sprinter and grbl.
//    6  * Copyright (C) 2011 Camiel Gubbels / Erik van der Zalm
//    7  *
//    8  * This program is free software: you can redistribute it and/or modify
//    9  * it under the terms of the GNU General Public License as published by
//   10  * the Free Software Foundation, either version 3 of the License, or
//   11  * (at your option) any later version.
//   12  *
//   13  * This program is distributed in the hope that it will be useful,
//   14  * but WITHOUT ANY WARRANTY; without even the implied warranty of
//   15  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//   16  * GNU General Public License for more details.
//   17  *
//   18  * You should have received a copy of the GNU General Public License
//   19  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
//   20  *
//   21  */
//   22 
//   23 #include "MarlinConfig.h"
//   24 
//   25 #if ENABLED(DIGIPOT_I2C) && DISABLED(DIGIPOT_MCP4018)
//   26 
//   27 #include "Stream.h"
//   28 #include "utility/twi.h"
//   29 #include "Wire.h"
//   30 
//   31 // Settings for the I2C based DIGIPOT (MCP4451) on Azteeg X3 Pro
//   32 #if MB(5DPRINT)
//   33   #define DIGIPOT_I2C_FACTOR 117.96
//   34   #define DIGIPOT_I2C_MAX_CURRENT 1.736
//   35 #else
//   36   #define DIGIPOT_I2C_FACTOR 106.7
//   37   #define DIGIPOT_I2C_MAX_CURRENT 2.5
//   38 #endif
//   39 
//   40 static byte current_to_wiper(float current) {
//   41   return byte(ceil(float((DIGIPOT_I2C_FACTOR * current))));
//   42 }
//   43 
//   44 static void i2c_send(byte addr, byte a, byte b) {
//   45   Wire.beginTransmission(addr);
//   46   Wire.write(a);
//   47   Wire.write(b);
//   48   Wire.endTransmission();
//   49 }
//   50 
//   51 // This is for the MCP4451 I2C based digipot
//   52 void digipot_i2c_set_current(int channel, float current) {
//   53   current = min((float) max(current, 0.0f), DIGIPOT_I2C_MAX_CURRENT);
//   54   // these addresses are specific to Azteeg X3 Pro, can be set to others,
//   55   // In this case first digipot is at address A0=0, A1= 0, second one is at A0=0, A1= 1
//   56   byte addr = 0x2C; // channel 0-3
//   57   if (channel >= 4) {
//   58     addr = 0x2E; // channel 4-7
//   59     channel -= 4;
//   60   }
//   61 
//   62   // Initial setup
//   63   i2c_send(addr, 0x40, 0xFF);
//   64   i2c_send(addr, 0xA0, 0xFF);
//   65 
//   66   // Set actual wiper value
//   67   byte addresses[4] = { 0x00, 0x10, 0x60, 0x70 };
//   68   i2c_send(addr, addresses[channel], current_to_wiper(current));
//   69 }
//   70 
//   71 void digipot_i2c_init() {
//   72   const float digipot_motor_current[] = DIGIPOT_I2C_MOTOR_CURRENTS;
//   73   Wire.begin();
//   74   // setup initial currents as defined in Configuration_adv.h
//   75   for (int i = 0; i < COUNT(digipot_motor_current); i++)
//   76     digipot_i2c_set_current(i, digipot_motor_current[i]);
//   77 }
//   78 
//   79 #endif //DIGIPOT_I2C
// 
// 
// 0 bytes of memory
//
//Errors: none
//Warnings: 2
