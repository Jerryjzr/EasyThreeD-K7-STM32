///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.22.1.15669/W32 for ARM      28/Dec/2020  21:37:06
// Copyright 1999-2018 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\nano\Middlewares\Third_Party\u8glib_arm_v1.17\src\u8g_com_raspberrypi_ssd_i2c.c
//    Command line =  
//        -f C:\Users\ADMINI~1\AppData\Local\Temp\EW4173.tmp
//        (F:\nano\Middlewares\Third_Party\u8glib_arm_v1.17\src\u8g_com_raspberrypi_ssd_i2c.c
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
//        F:\nano\EWARM\mksRobinLite\List\u8g_com_raspberrypi_ssd_i2c.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
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
// F:\nano\Middlewares\Third_Party\u8glib_arm_v1.17\src\u8g_com_raspberrypi_ssd_i2c.c
//    1 /*  
//    2   Special pin usage:
//    3     U8G_PI_I2C_OPTION	additional options
//    4     U8G_PI_A0_STATE	used to store the last value of the command/data register selection
//    5     U8G_PI_SET_A0		1: Signal request to update I2C device with new A0_STATE, 0: Do nothing, A0_STATE matches I2C device
//    6     U8G_PI_SCL		clock line (NOT USED)
//    7     U8G_PI_SDA		data line (NOT USED)
//    8     
//    9     U8G_PI_RESET		reset line (currently disabled, see below)
//   10 
//   11   Protocol:
//   12     SLA, Cmd/Data Selection, Arguments
//   13     The command/data register is selected by a special instruction byte, which is sent after SLA
//   14     
//   15     The continue bit is always 0 so that a (re)start is equired for the change from cmd to/data mode
//   16 */
//   17 
//   18 #include "u8g.h"
//   19 
//   20 #if defined(U8G_RASPBERRY_PI)
//   21 
//   22 #include <wiringPi.h>
//   23 #include <wiringPiI2C.h>
//   24 #include <stdio.h>
//   25 #include <stdlib.h>
//   26 #include <errno.h>
//   27 
//   28 #define I2C_SLA		0x3c
//   29 #define I2C_CMD_MODE	0x000
//   30 #define I2C_DATA_MODE	0x040
//   31 
//   32 #if defined(U8G_WITH_PINLIST)
//   33 
//   34 uint8_t u8g_com_raspberrypi_ssd_start_sequence(u8g_t *u8g)
//   35 {
//   36   /* are we requested to set the a0 state? */
//   37   if ( u8g->pin_list[U8G_PI_SET_A0] == 0 )
//   38     return 1;	
//   39   
//   40   /* setup bus, might be a repeated start */
//   41   if ( u8g_i2c_start(I2C_SLA) == 0 )
//   42     return 0;
//   43   if ( u8g->pin_list[U8G_PI_A0_STATE] == 0 )
//   44   {
//   45     if ( u8g_i2c_send_mode(I2C_CMD_MODE) == 0 )
//   46       return 0;
//   47   }
//   48   else
//   49   {
//   50     if ( u8g_i2c_send_mode(I2C_DATA_MODE) == 0 )
//   51       return 0;
//   52   }
//   53   
//   54   
//   55   u8g->pin_list[U8G_PI_SET_A0] = 0;
//   56   return 1;
//   57 }
//   58 
//   59 uint8_t u8g_com_raspberrypi_ssd_i2c_fn(u8g_t *u8g, uint8_t msg, uint8_t arg_val, void *arg_ptr)
//   60 {
//   61   switch(msg)
//   62   {
//   63     case U8G_COM_MSG_INIT:
//   64       u8g_i2c_init(u8g->pin_list[U8G_PI_I2C_OPTION]);
//   65       u8g_SetPIOutput(u8g, U8G_PI_RESET);
//   66       u8g_SetPIOutput(u8g, U8G_PI_A0);
//   67       break;
//   68     
//   69     case U8G_COM_MSG_STOP:
//   70       break;
//   71 
//   72     case U8G_COM_MSG_RESET:
//   73       break;
//   74       
//   75     case U8G_COM_MSG_CHIP_SELECT:
//   76       u8g->pin_list[U8G_PI_A0_STATE] = 0;
//   77       u8g->pin_list[U8G_PI_SET_A0] = 1;		/* force a0 to set again, also forces start condition */
//   78       if ( arg_val == 0 )
//   79       {
//   80         /* disable chip, send stop condition */
//   81 	u8g_i2c_stop();
//   82      }
//   83       else
//   84       {
//   85         /* enable, do nothing: any byte writing will trigger the i2c start */
//   86       }
//   87       break;
//   88 
//   89     case U8G_COM_MSG_WRITE_BYTE:
//   90       //u8g->pin_list[U8G_PI_SET_A0] = 1;
//   91       if ( u8g_com_raspberrypi_ssd_start_sequence(u8g) == 0 )
//   92 	return u8g_i2c_stop(), 0;
//   93       if ( u8g_i2c_send_byte(arg_val) == 0 )
//   94 	return u8g_i2c_stop(), 0;
//   95       // u8g_i2c_stop();
//   96       break;
//   97     
//   98     case U8G_COM_MSG_WRITE_SEQ:
//   99       //u8g->pin_list[U8G_PI_SET_A0] = 1;
//  100       if ( u8g_com_raspberrypi_ssd_start_sequence(u8g) == 0 )
//  101 	return u8g_i2c_stop(), 0;
//  102       {
//  103         register uint8_t *ptr = (uint8_t *)arg_ptr;
//  104         while( arg_val > 0 )
//  105         {
//  106 	  if ( u8g_i2c_send_byte(*ptr++) == 0 )
//  107 	    return u8g_i2c_stop(), 0;
//  108           arg_val--;
//  109         }
//  110       }
//  111       // u8g_i2c_stop();
//  112       break;
//  113 
//  114     case U8G_COM_MSG_WRITE_SEQ_P:
//  115       //u8g->pin_list[U8G_PI_SET_A0] = 1;
//  116       if ( u8g_com_raspberrypi_ssd_start_sequence(u8g) == 0 )
//  117 	return u8g_i2c_stop(), 0;
//  118       {
//  119         register uint8_t *ptr = (uint8_t *)arg_ptr;
//  120         while( arg_val > 0 )
//  121         {
//  122 	  if ( u8g_i2c_send_byte(u8g_pgm_read(ptr)) == 0 )
//  123 	    return 0;
//  124           ptr++;
//  125           arg_val--;
//  126         }
//  127       }
//  128       // u8g_i2c_stop();
//  129       break;
//  130       
//  131     case U8G_COM_MSG_ADDRESS:                     /* define cmd (arg_val = 0) or data mode (arg_val = 1) */
//  132       u8g->pin_list[U8G_PI_A0_STATE] = arg_val;
//  133       u8g->pin_list[U8G_PI_SET_A0] = 1;		/* force a0 to set again */
//  134     
//  135 #ifdef OLD_CODE    
//  136       if ( i2c_state != 0 )
//  137       {
//  138 	u8g_i2c_stop();
//  139 	i2c_state = 0;
//  140       }
//  141 
//  142       if ( u8g_com_raspberrypi_ssd_start_sequence(arg_val) == 0 )
//  143 	return 0;
//  144     
//  145       /* setup bus, might be a repeated start */
//  146       /*
//  147       if ( u8g_i2c_start(I2C_SLA) == 0 )
//  148 	return 0;
//  149       if ( arg_val == 0 )
//  150       {
//  151 	i2c_state = 1;
//  152 	
//  153 	if ( u8g_i2c_send_byte(I2C_CMD_MODE) == 0 )
//  154 	  return 0;
//  155       }
//  156       else
//  157       {
//  158 	i2c_state = 2;
//  159 	if ( u8g_i2c_send_byte(I2C_DATA_MODE) == 0 )
//  160 	  return 0;
//  161       }
//  162       */
//  163 #endif
//  164       break;
//  165   }
//  166   return 1;
//  167 }
//  168 
//  169 #else	/* defined(U8G_WITH_PINLIST) */
//  170 
//  171 uint8_t u8g_com_raspberrypi_ssd_i2c_fn(u8g_t *u8g, uint8_t msg, uint8_t arg_val, void *arg_ptr) {
//  172    return 1;
//  173 }
//  174 
//  175 #endif	/* defined(U8G_WITH_PINLIST) */
//  176 #endif
// 
//
// 
//
//
//Errors: none
//Warnings: none
