///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.22.1.15669/W32 for ARM      28/Dec/2020  21:37:06
// Copyright 1999-2018 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\nano\Middlewares\Third_Party\u8glib_arm_v1.17\src\u8g_com_raspberrypi_hw_spi.c
//    Command line =  
//        -f C:\Users\ADMINI~1\AppData\Local\Temp\EW4153.tmp
//        (F:\nano\Middlewares\Third_Party\u8glib_arm_v1.17\src\u8g_com_raspberrypi_hw_spi.c
//        -D USE_HAL_DRIVER -D STM32F103xE -D MKS_ROBIN -D MARLIN -D __arm__ -D
//        USE_MKS_WIFI --preprocess=s F:\nano\EWARM\mksRobinLite\List -lC
//        F:\nano\EWARM\mksRobinLite\List -lA F:\nano\EWARM\mksRobinLite\List
//        --diag_suppress Pa050 -o F:\nano\EWARM\mksRobinLite\Obj --no_unroll
//        --no_inline --no_tbaa --no_scheduling --debug --endian=little
//        --cpu=Cortex-M3 -e --char_is_signed --fpu=None --dlib_config
//        "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.0\arm\INC\c\DLib_Config_Full.h" -I F:\nano\EWARM/../Inc\ -I
//        F:\nano\EWARM/../Src\ -I
//        F:\nano\EWARM/../Drivers/STM32F1xx_HAL_Driver/Inc\ -I
//        F:\nano\EWARM/../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy\ -I
//        F:\nano\EWARM/../Drivers/STM32F10x_StdPeriph_Driver/Inc\ -I
//        F:\nano\EWARM/../Drivers/CMSIS/Device/ST/STM32F1xx/Include\ -I
//        F:\nano\EWARM/../Drivers/CMSIS/Include\ -I
//        F:\nano\EWARM/../Drivers/BSP/STM32MKS-3dPrinter\ -I
//        F:\nano\EWARM/../Drivers/BSP/Components/Common\ -I
//        F:\nano\EWARM/../Drivers/BSP/Components/l6474\ -I
//        F:\nano\EWARM/../Drivers/BSP/Components/at24cxx\ -I
//        F:\nano\EWARM/../Drivers/BSP/Components/w25qxx\ -I
//        F:\nano\EWARM/../Drivers/BSP/MotorControl\ -I
//        F:\nano\EWARM/../Middlewares/Third_Party/FatFs/src\ -I
//        F:\nano\EWARM/../Middlewares/Third_Party/FatFs/src/drivers\ -I
//        F:\nano\EWARM/../Middlewares/Third_Party/Marlin\ -I
//        F:\nano\EWARM/../Middlewares/Third_Party/u8glib_arm_v1.17/src\ -I
//        F:\nano\EWARM/../Middlewares/arduino\ -I
//        F:\nano\EWARM/../Middlewares/arduino/avr\ -I
//        F:\nano\EWARM/../Inc/Logo\ -Om --use_c++_inline -I "C:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 8.0\arm\CMSIS\Core\Include\" -I
//        "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.0\arm\CMSIS\DSP\Include\")
//    Locale       =  C
//    List file    =  
//        F:\nano\EWARM\mksRobinLite\List\u8g_com_raspberrypi_hw_spi.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_version", "6"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC u8g_com_raspberrypi_hw_spi_fn
        
          CFI Names cfiNames0
          CFI StackFrame CFA R13 DATA
          CFI Resource R0:32, R1:32, R2:32, R3:32, R4:32, R5:32, R6:32, R7:32
          CFI Resource R8:32, R9:32, R10:32, R11:32, R12:32, R13:32, R14:32
          CFI EndNames cfiNames0
        
          CFI Common cfiCommon0 Using cfiNames0
          CFI CodeAlign 2
          CFI DataAlign 4
          CFI ReturnAddress R14 CODE
          CFI CFA R13+0
          CFI R0 Undefined
          CFI R1 Undefined
          CFI R2 Undefined
          CFI R3 Undefined
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI R8 SameValue
          CFI R9 SameValue
          CFI R10 SameValue
          CFI R11 SameValue
          CFI R12 Undefined
          CFI R14 SameValue
          CFI EndCommon cfiCommon0
        
// F:\nano\Middlewares\Third_Party\u8glib_arm_v1.17\src\u8g_com_raspberrypi_hw_spi.c
//    1 /*
//    2   
//    3   u8g_com_raspberrypi_hw_spi.c
//    4 
//    5   Universal 8bit Graphics Library
//    6   
//    7   Copyright (c) 2012, olikraus@gmail.com
//    8   All rights reserved.
//    9 
//   10   Redistribution and use in source and binary forms, with or without modification, 
//   11   are permitted provided that the following conditions are met:
//   12 
//   13   * Redistributions of source code must retain the above copyright notice, this list 
//   14     of conditions and the following disclaimer.
//   15     
//   16   * Redistributions in binary form must reproduce the above copyright notice, this 
//   17     list of conditions and the following disclaimer in the documentation and/or other 
//   18     materials provided with the distribution.
//   19 
//   20   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND 
//   21   CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
//   22   INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
//   23   MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
//   24   DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR 
//   25   CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
//   26   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
//   27   NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
//   28   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
//   29   CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
//   30   STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
//   31   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
//   32   ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.  
//   33   
//   34   
//   35   Assumes, that 
//   36     MOSI is at PORTB, Pin 3
//   37   and
//   38     SCK is at PORTB, Pin 5
//   39 
//   40   Update for ATOMIC operation done (01 Jun 2013)
//   41     U8G_ATOMIC_OR(ptr, val)
//   42     U8G_ATOMIC_AND(ptr, val)
//   43     U8G_ATOMIC_START()
//   44     U8G_ATOMIC_END()
//   45  
//   46 
//   47 
//   48 */
//   49 
//   50 #include "u8g.h"
//   51 
//   52 
//   53 
//   54 #if defined(U8G_RASPBERRY_PI)
//   55 
//   56 #include <wiringPiSPI.h>
//   57 #include <wiringPi.h>
//   58 #include <stdio.h>
//   59 #include <stdlib.h>
//   60 #include <errno.h>
//   61 
//   62 uint8_t u8g_com_raspberrypi_hw_spi_fn(u8g_t *u8g, uint8_t msg, uint8_t arg_val, void *arg_ptr)
//   63 {
//   64   switch(msg)
//   65   {
//   66     case U8G_COM_MSG_STOP:
//   67       break;
//   68     
//   69     case U8G_COM_MSG_INIT:
//   70 		// check wiringPi setup
//   71 		if (wiringPiSetup() == -1)
//   72 		{
//   73 			printf("wiringPi-Error\n");
//   74 			exit(1);
//   75 		}
//   76 
//   77 		if (wiringPiSPISetup (0, 100000) < 0)
//   78 		{
//   79 			printf ("Unable to open SPI device 0: %s\n", strerror (errno)) ;
//   80 			exit (1) ;
//   81 		}
//   82 		
//   83 		u8g_SetPIOutput(u8g, U8G_PI_RESET);
//   84 		u8g_SetPIOutput(u8g, U8G_PI_A0);
//   85 
//   86       break;
//   87     
//   88     case U8G_COM_MSG_ADDRESS:                     /* define cmd (arg_val = 0) or data mode (arg_val = 1) */
//   89 	  u8g_SetPILevel(u8g, U8G_PI_A0, arg_val);
//   90       break;
//   91 
//   92     case U8G_COM_MSG_CHIP_SELECT:
//   93 		/* Done by the SPI hardware */
//   94       break;
//   95       
//   96     case U8G_COM_MSG_RESET:
//   97       u8g_SetPILevel(u8g, U8G_PI_RESET, arg_val);
//   98       break;
//   99     
//  100     case U8G_COM_MSG_WRITE_BYTE:
//  101 		wiringPiSPIDataRW (0, &arg_val, 1) ;
//  102       break;
//  103     
//  104     case U8G_COM_MSG_WRITE_SEQ:
//  105 		wiringPiSPIDataRW (0, arg_ptr, arg_val);
//  106       break;
//  107 
//  108 	case U8G_COM_MSG_WRITE_SEQ_P:
//  109 		wiringPiSPIDataRW (0, arg_ptr, arg_val);		
//  110       break;
//  111   }
//  112   return 1;
//  113 }
//  114 
//  115 #else
//  116 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function u8g_com_raspberrypi_hw_spi_fn
          CFI NoCalls
        THUMB
//  117 uint8_t u8g_com_raspberrypi_hw_spi_fn(u8g_t *u8g, uint8_t msg, uint8_t arg_val, void *arg_ptr)
//  118 {
//  119   return 1;
u8g_com_raspberrypi_hw_spi_fn:
        MOVS     R0,#+1
        BX       LR               ;; return
//  120 }
          CFI EndBlock cfiBlock0

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//  121 
//  122 #endif
//  123 
//  124 
// 
// 4 bytes in section .text
// 
// 4 bytes of CODE memory
//
//Errors: none
//Warnings: none
