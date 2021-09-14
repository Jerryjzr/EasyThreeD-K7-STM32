///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.22.1.15669/W32 for ARM      28/Dec/2020  21:37:07
// Copyright 1999-2018 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\nano\Middlewares\Third_Party\u8glib_arm_v1.17\src\u8g_dev_ssd1325_nhd27oled_gr_new.c
//    Command line =  
//        -f C:\Users\ADMINI~1\AppData\Local\Temp\EW465B.tmp
//        (F:\nano\Middlewares\Third_Party\u8glib_arm_v1.17\src\u8g_dev_ssd1325_nhd27oled_gr_new.c
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
//        F:\nano\EWARM\mksRobinLite\List\u8g_dev_ssd1325_nhd27oled_gr_new.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_version", "6"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN u8g_InitCom
        EXTERN u8g_SetAddress
        EXTERN u8g_SetChipSelect
        EXTERN u8g_WriteByte
        EXTERN u8g_WriteEscSeqP
        EXTERN u8g_WriteSequence4LTo16GrDevice
        EXTERN u8g_com_null_fn
        EXTERN u8g_dev_pb16h2_base_fn
        EXTERN u8g_dev_pb8h2_base_fn

        PUBLIC u8g_dev_ssd1325_nhd27oled_2x_buf
        PUBLIC u8g_dev_ssd1325_nhd27oled_2x_gr_hw_spi
        PUBLIC u8g_dev_ssd1325_nhd27oled_2x_gr_sw_spi
        PUBLIC u8g_dev_ssd1325_nhd27oled_2x_pb
        PUBLIC u8g_dev_ssd1325_nhd27oled_gr_hw_spi
        PUBLIC u8g_dev_ssd1325_nhd27oled_gr_hw_spi_buf
        PUBLIC u8g_dev_ssd1325_nhd27oled_gr_hw_spi_pb
        PUBLIC u8g_dev_ssd1325_nhd27oled_gr_sw_spi
        PUBLIC u8g_dev_ssd1325_nhd27oled_gr_sw_spi_buf
        PUBLIC u8g_dev_ssd1325_nhd27oled_gr_sw_spi_pb
        
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
        
// F:\nano\Middlewares\Third_Party\u8glib_arm_v1.17\src\u8g_dev_ssd1325_nhd27oled_gr_new.c
//    1 /*
//    2 
//    3   u8g_dev_ssd1325_nhd27oled_gr.c
//    4   
//    5   2-Bit (gray level) Driver for SSD1325 Controller (OLED Display)
//    6   Rewritten with new architecture
//    7   Tested with NHD-2.7-12864UCY3
//    8 
//    9   Universal 8bit Graphics Library
//   10   
//   11   Copyright (c) 2011, olikraus@gmail.com
//   12   All rights reserved.
//   13 
//   14   Redistribution and use in source and binary forms, with or without modification, 
//   15   are permitted provided that the following conditions are met:
//   16 
//   17   * Redistributions of source code must retain the above copyright notice, this list 
//   18     of conditions and the following disclaimer.
//   19     
//   20   * Redistributions in binary form must reproduce the above copyright notice, this 
//   21     list of conditions and the following disclaimer in the documentation and/or other 
//   22     materials provided with the distribution.
//   23 
//   24   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND 
//   25   CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
//   26   INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
//   27   MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
//   28   DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR 
//   29   CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
//   30   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
//   31   NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
//   32   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
//   33   CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
//   34   STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
//   35   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
//   36   ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.  
//   37   
//   38   SSD130x       Monochrom OLED Controller
//   39   SSD131x       Character OLED Controller
//   40   SSD132x       Graylevel OLED Controller
//   41   SSD1331       Color OLED Controller       
//   42 
//   43 */
//   44 
//   45 #include "u8g.h"
//   46 
//   47 #define WIDTH 128
//   48 #define HEIGHT 64
//   49 
//   50 /* http://www.newhavendisplay.com/app_notes/OLED_2_7_12864.txt */
//   51 static const uint8_t u8g_dev_ssd1325_2bit_nhd_27_12864ucy3_init_seq[] PROGMEM = {
//   52   U8G_ESC_DLY(10),              /* delay 10 ms */
//   53   U8G_ESC_CS(0),                 /* disable chip */
//   54   U8G_ESC_ADR(0),               /* instruction mode */
//   55   U8G_ESC_RST(1),               /* do reset low pulse with (1*16)+2 milliseconds */
//   56   U8G_ESC_CS(1),                /* enable chip */
//   57   0x0ae,                                /* display off, sleep mode */
//   58   0x0b3, 0x091,                    /* set display clock divide ratio/oscillator frequency (set clock as 135 frames/sec) */
//   59   0x0a8, 0x03f,                     /* multiplex ratio: 0x03f * 1/64 duty */
//   60   0x0a2, 0x04c,                     /* display offset, shift mapping ram counter */
//   61   0x0a1, 0x000,                     /* display start line */
//   62   0x0ad, 0x002,                     /* master configuration: disable embedded DC-DC, enable internal VCOMH */
//   63   0x0a0, 0x052,                     /* remap configuration, horizontal address increment (bit 2 = 0), enable nibble remap (upper nibble is left, bit 1 = 1), old values: 0x0a0 0x0a6 */
//   64   0x086,                                /* full current range (0x084, 0x085, 0x086) */
//   65   0x0b8,                                /* set gray scale table */
//   66       //0x01, 0x011, 0x022, 0x032, 0x043, 0x054, 0x065, 0x076,
//   67       0x01, 0x011, 0x022, 0x032, 0x043, 0x054, 0x077, 0x077,            // 4L mode uses 0, 2, 4, 7
//   68   0x081, 0x070,                    /* contrast, brightness, 0..128, Newhaven: 0x040 */
//   69   0x0b2, 0x051,                    /* frame frequency (row period) */
//   70   0x0b1, 0x055,                    /* phase length */
//   71   0x0bc, 0x010,                    /* pre-charge voltage level */
//   72   0x0b4, 0x002,                    /* set pre-charge compensation level (not documented in the SDD1325 datasheet, but used in the NHD init seq.) */
//   73   0x0b0, 0x028,                    /* enable pre-charge compensation (not documented in the SDD1325 datasheet, but used in the NHD init seq.) */
//   74   0x0be, 0x01c,                     /* VCOMH voltage */
//   75   0x0bf, 0x002|0x00d,           /* VSL voltage level (not documented in the SDD1325 datasheet, but used in the NHD init seq.) */
//   76   0x0a4,                                 /* normal display mode */
//   77   0x0af,                                  /* display on */
//   78   U8G_ESC_DLY(50),             /* delay 50 ms */
//   79   U8G_ESC_CS(0),             /* disable chip */
//   80   U8G_ESC_END                /* end of sequence */
//   81 };
//   82 
//   83 static const uint8_t u8g_dev_ssd1325_2bit_nhd_27_12864ucy3_prepare_page_seq[] PROGMEM = {
//   84   U8G_ESC_ADR(0),               /* instruction mode */
//   85   U8G_ESC_CS(1),                /* enable chip */
//   86   0x015,       /* column address... */
//   87   0x000,       /* start at column 0 */
//   88   0x03f,       /* end at column 63 (which is y == 127), because there are two pixel in one column */
//   89   0x075,       /* row address... */
//   90   U8G_ESC_END                /* end of sequence */
//   91 };
//   92 

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function u8g_dev_ssd1325_gr_prepare_row
        THUMB
//   93 static void u8g_dev_ssd1325_gr_prepare_row(u8g_t *u8g, u8g_dev_t *dev, uint8_t delta_row)
//   94 {
u8g_dev_ssd1325_gr_prepare_row:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOV      R4,R0
        MOV      R5,R1
        MOV      R6,R2
//   95   uint8_t row = ((u8g_pb_t *)(dev->dev_mem))->p.page;
//   96   
//   97   row *= ((u8g_pb_t *)(dev->dev_mem))->p.page_height;
//   98   row += delta_row;
        LDR      R0,[R5, #+4]
        LDRB     R1,[R0, #+4]
        LDRB     R0,[R0, #+0]
        MLA      R6,R0,R1,R6
//   99   
//  100   u8g_WriteEscSeqP(u8g, dev, u8g_dev_ssd1325_2bit_nhd_27_12864ucy3_prepare_page_seq);
        Nop      
        ADR.N    R2,u8g_dev_ssd1325_2bit_nhd_27_12864ucy3_prepare_page_seq
        MOV      R1,R5
        MOV      R0,R4
          CFI FunCall u8g_WriteEscSeqP
        BL       u8g_WriteEscSeqP
//  101   
//  102   u8g_WriteByte(u8g, dev, row);       /* start at the selected row */
        MOV      R2,R6
        UXTB     R2,R2
        MOV      R1,R5
        MOV      R0,R4
          CFI FunCall u8g_WriteByte
        BL       u8g_WriteByte
//  103   u8g_WriteByte(u8g, dev, row+1);       /* end within the selected row */  
        ADDS     R6,R6,#+1
        MOV      R2,R6
        UXTB     R2,R2
        MOV      R1,R5
        MOV      R0,R4
          CFI FunCall u8g_WriteByte
        BL       u8g_WriteByte
//  104   
//  105   //u8g_SetAddress(u8g, dev, 0);          /* instruction mode mode */
//  106   //u8g_WriteByte(u8g, dev, 0x05c);       /* write to ram */  
//  107   u8g_SetAddress(u8g, dev, 1);          /* data mode */
        MOVS     R2,#+1
        MOV      R1,R5
        MOV      R0,R4
        POP      {R4-R6,LR}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R14 SameValue
          CFI CFA R13+0
          CFI FunCall u8g_SetAddress
        B.W      u8g_SetAddress
//  108 }
          CFI EndBlock cfiBlock0
//  109 
//  110 static const uint8_t u8g_dev_ssd13xx_sleep_on[] PROGMEM = {
//  111   U8G_ESC_ADR(0),           /* instruction mode */
//  112   U8G_ESC_CS(1),             /* enable chip */
//  113   0x0ae,		/* display off */      
//  114   U8G_ESC_CS(0),             /* disable chip, bugfix 12 nov 2014 */
//  115   U8G_ESC_END                /* end of sequence */
//  116 };
//  117 
//  118 static const uint8_t u8g_dev_ssd13xx_sleep_off[] PROGMEM = {
//  119   U8G_ESC_ADR(0),           /* instruction mode */
//  120   U8G_ESC_CS(1),             /* enable chip */
//  121   0x0af,		/* display on */      
//  122   U8G_ESC_DLY(50),       /* delay 50 ms */
//  123   U8G_ESC_CS(0),             /* disable chip, bugfix 12 nov 2014 */
//  124   U8G_ESC_END                /* end of sequence */
//  125 };
//  126 
//  127 
//  128 

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function u8g_dev_ssd1325_nhd27oled_gr_fn
        THUMB
//  129 static uint8_t u8g_dev_ssd1325_nhd27oled_gr_fn(u8g_t *u8g, u8g_dev_t *dev, uint8_t msg, void *arg)
//  130 {
u8g_dev_ssd1325_nhd27oled_gr_fn:
        PUSH     {R3-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+40
        MOV      R7,R0
        MOV      R10,R1
        MOV      R8,R2
        MOV      R9,R3
//  131   switch(msg)
        MOV      R0,R8
        CMP      R0,#+10
        BEQ.N    ??u8g_dev_ssd1325_nhd27oled_gr_fn_0
        CMP      R0,#+15
        BEQ.N    ??u8g_dev_ssd1325_nhd27oled_gr_fn_1
        CMP      R0,#+16
        BEQ.N    ??u8g_dev_ssd1325_nhd27oled_gr_fn_2
        CMP      R0,#+17
        BEQ.N    ??u8g_dev_ssd1325_nhd27oled_gr_fn_3
        CMP      R0,#+21
        BEQ.N    ??u8g_dev_ssd1325_nhd27oled_gr_fn_4
        B.N      ??u8g_dev_ssd1325_nhd27oled_gr_fn_5
//  132   {
//  133     case U8G_DEV_MSG_INIT:
//  134       u8g_InitCom(u8g, dev, U8G_SPI_CLK_CYCLE_300NS);
??u8g_dev_ssd1325_nhd27oled_gr_fn_0:
        MOVS     R2,#+2
        MOV      R0,R7
          CFI FunCall u8g_InitCom
        BL       u8g_InitCom
//  135       u8g_WriteEscSeqP(u8g, dev, u8g_dev_ssd1325_2bit_nhd_27_12864ucy3_init_seq);
        ADR.N    R2,u8g_dev_ssd1325_2bit_nhd_27_12864ucy3_init_seq
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_WriteEscSeqP
        BL       u8g_WriteEscSeqP
//  136       break;
//  137     case U8G_DEV_MSG_STOP:
//  138       break;
//  139     case U8G_DEV_MSG_PAGE_NEXT:
//  140       {
//  141 	uint8_t i;
//  142 	u8g_pb_t *pb = (u8g_pb_t *)(dev->dev_mem);
//  143 	uint8_t *p = pb->buf;
//  144 	u8g_uint_t cnt;
//  145 	cnt = pb->width;
//  146 	cnt >>= 2;
//  147 
//  148 	for( i = 0; i < pb->p.page_height; i++ )
//  149 	{
//  150 	  u8g_dev_ssd1325_gr_prepare_row(u8g, dev, i);		/* this will also enable chip select */
//  151 	  u8g_WriteSequence4LTo16GrDevice(u8g, dev, cnt, p);
//  152 	  u8g_SetChipSelect(u8g, dev, 0);        
//  153 	  p+=cnt;
//  154 	}
//  155       }
//  156       break;
//  157     case U8G_DEV_MSG_CONTRAST:
//  158       u8g_SetChipSelect(u8g, dev, 1);
//  159       u8g_SetAddress(u8g, dev, 0);          /* instruction mode */
//  160       u8g_WriteByte(u8g, dev, 0x081);
//  161       u8g_WriteByte(u8g, dev, (*(uint8_t *)arg) >> 1);
//  162       u8g_SetChipSelect(u8g, dev, 0);      
//  163       return 1;
//  164     case U8G_DEV_MSG_SLEEP_ON:
//  165       u8g_WriteEscSeqP(u8g, dev, u8g_dev_ssd13xx_sleep_on);    
//  166       return 1;
//  167     case U8G_DEV_MSG_SLEEP_OFF:
//  168       u8g_WriteEscSeqP(u8g, dev, u8g_dev_ssd13xx_sleep_off);    
//  169       return 1;
//  170   }
//  171   return u8g_dev_pb8h2_base_fn(u8g, dev, msg, arg);
??u8g_dev_ssd1325_nhd27oled_gr_fn_5:
        MOV      R3,R9
        MOV      R2,R8
        MOV      R1,R10
        MOV      R0,R7
        ADD      SP,SP,#+4
          CFI CFA R13+36
        POP      {R4-R11,LR}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI R8 SameValue
          CFI R9 SameValue
          CFI R10 SameValue
          CFI R11 SameValue
          CFI R14 SameValue
          CFI CFA R13+0
          CFI FunCall u8g_dev_pb8h2_base_fn
        B.W      u8g_dev_pb8h2_base_fn
          CFI R4 Frame(CFA, -36)
          CFI R5 Frame(CFA, -32)
          CFI R6 Frame(CFA, -28)
          CFI R7 Frame(CFA, -24)
          CFI R8 Frame(CFA, -20)
          CFI R9 Frame(CFA, -16)
          CFI R10 Frame(CFA, -12)
          CFI R11 Frame(CFA, -8)
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+40
??u8g_dev_ssd1325_nhd27oled_gr_fn_6:
        POP      {R1,R4-R11,PC}   ;; return
??u8g_dev_ssd1325_nhd27oled_gr_fn_4:
        LDR      R4,[R10, #+4]
        LDR      R5,[R4, #+8]
        LDRB     R6,[R4, #+5]
        LSRS     R6,R6,#+2
        MOV      R11,#+0
??u8g_dev_ssd1325_nhd27oled_gr_fn_7:
        MOV      R0,R11
        LDRB     R1,[R4, #+0]
        UXTB     R0,R0
        CMP      R0,R1
        BCS.N    ??u8g_dev_ssd1325_nhd27oled_gr_fn_5
        MOV      R2,R11
        UXTB     R2,R2
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_dev_ssd1325_gr_prepare_row
        BL       u8g_dev_ssd1325_gr_prepare_row
        MOV      R3,R5
        MOV      R2,R6
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_WriteSequence4LTo16GrDevice
        BL       u8g_WriteSequence4LTo16GrDevice
        MOVS     R2,#+0
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_SetChipSelect
        BL       u8g_SetChipSelect
        MOV      R0,R6
        ADD      R5,R5,R0
        ADD      R11,R11,#+1
        B.N      ??u8g_dev_ssd1325_nhd27oled_gr_fn_7
??u8g_dev_ssd1325_nhd27oled_gr_fn_1:
        MOVS     R2,#+1
        MOV      R0,R7
          CFI FunCall u8g_SetChipSelect
        BL       u8g_SetChipSelect
        MOVS     R2,#+0
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_SetAddress
        BL       u8g_SetAddress
        MOVS     R2,#+129
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_WriteByte
        BL       u8g_WriteByte
        LDRB     R2,[R9, #+0]
        LSRS     R2,R2,#+1
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_WriteByte
        BL       u8g_WriteByte
        MOVS     R2,#+0
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_SetChipSelect
        BL       u8g_SetChipSelect
        MOVS     R0,#+1
        B.N      ??u8g_dev_ssd1325_nhd27oled_gr_fn_6
??u8g_dev_ssd1325_nhd27oled_gr_fn_2:
        ADR.N    R2,u8g_dev_ssd13xx_sleep_on
        MOV      R0,R7
          CFI FunCall u8g_WriteEscSeqP
        BL       u8g_WriteEscSeqP
        MOVS     R0,#+1
        B.N      ??u8g_dev_ssd1325_nhd27oled_gr_fn_6
??u8g_dev_ssd1325_nhd27oled_gr_fn_3:
        ADR.N    R2,u8g_dev_ssd13xx_sleep_off
        MOV      R0,R7
          CFI FunCall u8g_WriteEscSeqP
        BL       u8g_WriteEscSeqP
        MOVS     R0,#+1
        B.N      ??u8g_dev_ssd1325_nhd27oled_gr_fn_6
//  172 }
          CFI EndBlock cfiBlock1
//  173 
//  174 
//  175 

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function u8g_dev_ssd1325_nhd27oled_2x_gr_fn
        THUMB
//  176 static uint8_t u8g_dev_ssd1325_nhd27oled_2x_gr_fn(u8g_t *u8g, u8g_dev_t *dev, uint8_t msg, void *arg)
//  177 {
u8g_dev_ssd1325_nhd27oled_2x_gr_fn:
        PUSH     {R3-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+40
        MOV      R7,R0
        MOV      R10,R1
        MOV      R8,R2
        MOV      R9,R3
//  178   switch(msg)
        MOV      R0,R8
        CMP      R0,#+10
        BEQ.N    ??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_0
        CMP      R0,#+15
        BEQ.N    ??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_1
        CMP      R0,#+16
        BEQ.N    ??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_2
        CMP      R0,#+17
        BEQ.N    ??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_3
        CMP      R0,#+21
        BEQ.N    ??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_4
        B.N      ??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_5
//  179   {
//  180     case U8G_DEV_MSG_INIT:
//  181       u8g_InitCom(u8g, dev, U8G_SPI_CLK_CYCLE_300NS);
??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_0:
        MOVS     R2,#+2
        MOV      R0,R7
          CFI FunCall u8g_InitCom
        BL       u8g_InitCom
//  182       u8g_WriteEscSeqP(u8g, dev, u8g_dev_ssd1325_2bit_nhd_27_12864ucy3_init_seq);
        ADR.N    R2,u8g_dev_ssd1325_2bit_nhd_27_12864ucy3_init_seq
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_WriteEscSeqP
        BL       u8g_WriteEscSeqP
//  183       break;
//  184     case U8G_DEV_MSG_STOP:
//  185       break;
//  186     case U8G_DEV_MSG_PAGE_NEXT:
//  187       {
//  188 	uint8_t i;
//  189 	u8g_pb_t *pb = (u8g_pb_t *)(dev->dev_mem);
//  190 	uint8_t *p = pb->buf;
//  191 	u8g_uint_t cnt;
//  192 	cnt = pb->width;
//  193 	cnt >>= 2;
//  194 
//  195 	for( i = 0; i < pb->p.page_height; i++ )
//  196 	{
//  197 	  u8g_dev_ssd1325_gr_prepare_row(u8g, dev, i);		/* this will also enable chip select */
//  198 	  u8g_WriteSequence4LTo16GrDevice(u8g, dev, cnt, p);
//  199 	  u8g_SetChipSelect(u8g, dev, 0);        
//  200 	  p+=cnt;
//  201 	}
//  202       }
//  203       break;
//  204     case U8G_DEV_MSG_CONTRAST:
//  205       u8g_SetChipSelect(u8g, dev, 1);
//  206       u8g_SetAddress(u8g, dev, 0);          /* instruction mode */
//  207       u8g_WriteByte(u8g, dev, 0x081);
//  208       u8g_WriteByte(u8g, dev, (*(uint8_t *)arg) >> 1);
//  209       u8g_SetChipSelect(u8g, dev, 0);      
//  210       return 1;
//  211     case U8G_DEV_MSG_SLEEP_ON:
//  212       u8g_WriteEscSeqP(u8g, dev, u8g_dev_ssd13xx_sleep_on);    
//  213       return 1;
//  214     case U8G_DEV_MSG_SLEEP_OFF:
//  215       u8g_WriteEscSeqP(u8g, dev, u8g_dev_ssd13xx_sleep_off);    
//  216       return 1;
//  217   }
//  218   return u8g_dev_pb16h2_base_fn(u8g, dev, msg, arg);
??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_5:
        MOV      R3,R9
        MOV      R2,R8
        MOV      R1,R10
        MOV      R0,R7
        ADD      SP,SP,#+4
          CFI CFA R13+36
        POP      {R4-R11,LR}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI R8 SameValue
          CFI R9 SameValue
          CFI R10 SameValue
          CFI R11 SameValue
          CFI R14 SameValue
          CFI CFA R13+0
          CFI FunCall u8g_dev_pb16h2_base_fn
        B.W      u8g_dev_pb16h2_base_fn
          CFI R4 Frame(CFA, -36)
          CFI R5 Frame(CFA, -32)
          CFI R6 Frame(CFA, -28)
          CFI R7 Frame(CFA, -24)
          CFI R8 Frame(CFA, -20)
          CFI R9 Frame(CFA, -16)
          CFI R10 Frame(CFA, -12)
          CFI R11 Frame(CFA, -8)
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+40
??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_6:
        POP      {R1,R4-R11,PC}   ;; return
??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_4:
        LDR      R4,[R10, #+4]
        LDR      R5,[R4, #+8]
        LDRB     R6,[R4, #+5]
        LSRS     R6,R6,#+2
        MOV      R11,#+0
??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_7:
        MOV      R0,R11
        LDRB     R1,[R4, #+0]
        UXTB     R0,R0
        CMP      R0,R1
        BCS.N    ??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_5
        MOV      R2,R11
        UXTB     R2,R2
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_dev_ssd1325_gr_prepare_row
        BL       u8g_dev_ssd1325_gr_prepare_row
        MOV      R3,R5
        MOV      R2,R6
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_WriteSequence4LTo16GrDevice
        BL       u8g_WriteSequence4LTo16GrDevice
        MOVS     R2,#+0
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_SetChipSelect
        BL       u8g_SetChipSelect
        MOV      R0,R6
        ADD      R5,R5,R0
        ADD      R11,R11,#+1
        B.N      ??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_7
??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_1:
        MOVS     R2,#+1
        MOV      R0,R7
          CFI FunCall u8g_SetChipSelect
        BL       u8g_SetChipSelect
        MOVS     R2,#+0
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_SetAddress
        BL       u8g_SetAddress
        MOVS     R2,#+129
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_WriteByte
        BL       u8g_WriteByte
        LDRB     R2,[R9, #+0]
        LSRS     R2,R2,#+1
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_WriteByte
        BL       u8g_WriteByte
        MOVS     R2,#+0
        MOV      R1,R10
        MOV      R0,R7
          CFI FunCall u8g_SetChipSelect
        BL       u8g_SetChipSelect
        MOVS     R0,#+1
        B.N      ??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_6
??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_2:
        ADR.N    R2,u8g_dev_ssd13xx_sleep_on
        MOV      R0,R7
          CFI FunCall u8g_WriteEscSeqP
        BL       u8g_WriteEscSeqP
        MOVS     R0,#+1
        B.N      ??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_6
??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_3:
        ADR.N    R2,u8g_dev_ssd13xx_sleep_off
        MOV      R0,R7
          CFI FunCall u8g_WriteEscSeqP
        BL       u8g_WriteEscSeqP
        MOVS     R0,#+1
        B.N      ??u8g_dev_ssd1325_nhd27oled_2x_gr_fn_6
//  219 }
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
u8g_dev_ssd1325_2bit_nhd_27_12864ucy3_init_seq:
        DC8 255, 10, 255, 208, 255, 224, 255, 193, 255, 209, 174, 179, 145, 168
        DC8 63, 162, 76, 161, 0, 173, 2, 160, 82, 134, 184, 1, 17, 34, 50, 67
        DC8 84, 119, 119, 129, 112, 178, 81, 177, 85, 188, 16, 180, 2, 176, 40
        DC8 190, 28, 191, 15, 164, 175, 255, 50, 255, 208, 255, 254, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
u8g_dev_ssd1325_2bit_nhd_27_12864ucy3_prepare_page_seq:
        DC8 255, 224, 255, 209, 21, 0, 63, 117, 255, 254, 0, 0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
u8g_dev_ssd13xx_sleep_on:
        DC8 255, 224, 255, 209, 174, 255, 208, 255, 254, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
u8g_dev_ssd13xx_sleep_off:
        DC8 255, 224, 255, 209, 175, 255, 50, 255, 208, 255, 254, 0
//  220 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  221 U8G_PB_DEV(u8g_dev_ssd1325_nhd27oled_gr_sw_spi , WIDTH, HEIGHT, 4, u8g_dev_ssd1325_nhd27oled_gr_fn, U8G_COM_SW_SPI);
u8g_dev_ssd1325_nhd27oled_gr_sw_spi_buf:
        DS8 128

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
// __absolute u8g_pb_t u8g_dev_ssd1325_nhd27oled_gr_sw_spi_pb
u8g_dev_ssd1325_nhd27oled_gr_sw_spi_pb:
        DC8 4, 64, 0, 0, 0, 128, 0, 0
        DC32 u8g_dev_ssd1325_nhd27oled_gr_sw_spi_buf

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
// __absolute u8g_dev_t u8g_dev_ssd1325_nhd27oled_gr_sw_spi
u8g_dev_ssd1325_nhd27oled_gr_sw_spi:
        DC32 u8g_dev_ssd1325_nhd27oled_gr_fn
        DC32 u8g_dev_ssd1325_nhd27oled_gr_sw_spi_pb, u8g_com_null_fn

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  222 U8G_PB_DEV(u8g_dev_ssd1325_nhd27oled_gr_hw_spi , WIDTH, HEIGHT, 4, u8g_dev_ssd1325_nhd27oled_gr_fn, U8G_COM_HW_SPI);
u8g_dev_ssd1325_nhd27oled_gr_hw_spi_buf:
        DS8 128

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
// __absolute u8g_pb_t u8g_dev_ssd1325_nhd27oled_gr_hw_spi_pb
u8g_dev_ssd1325_nhd27oled_gr_hw_spi_pb:
        DC8 4, 64, 0, 0, 0, 128, 0, 0
        DC32 u8g_dev_ssd1325_nhd27oled_gr_hw_spi_buf

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
// __absolute u8g_dev_t u8g_dev_ssd1325_nhd27oled_gr_hw_spi
u8g_dev_ssd1325_nhd27oled_gr_hw_spi:
        DC32 u8g_dev_ssd1325_nhd27oled_gr_fn
        DC32 u8g_dev_ssd1325_nhd27oled_gr_hw_spi_pb, u8g_com_null_fn
//  223 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  224 uint8_t u8g_dev_ssd1325_nhd27oled_2x_buf[WIDTH*2] U8G_NOCOMMON ; 
u8g_dev_ssd1325_nhd27oled_2x_buf:
        DS8 256

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//  225 u8g_pb_t u8g_dev_ssd1325_nhd27oled_2x_pb = { {8, HEIGHT, 0, 0, 0},  WIDTH, u8g_dev_ssd1325_nhd27oled_2x_buf}; 
u8g_dev_ssd1325_nhd27oled_2x_pb:
        DC8 8, 64, 0, 0, 0, 128, 0, 0
        DC32 u8g_dev_ssd1325_nhd27oled_2x_buf

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//  226 u8g_dev_t u8g_dev_ssd1325_nhd27oled_2x_gr_sw_spi = { u8g_dev_ssd1325_nhd27oled_2x_gr_fn, &u8g_dev_ssd1325_nhd27oled_2x_pb, U8G_COM_SW_SPI };
u8g_dev_ssd1325_nhd27oled_2x_gr_sw_spi:
        DC32 u8g_dev_ssd1325_nhd27oled_2x_gr_fn
        DC32 u8g_dev_ssd1325_nhd27oled_2x_pb, u8g_com_null_fn

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//  227 u8g_dev_t u8g_dev_ssd1325_nhd27oled_2x_gr_hw_spi = { u8g_dev_ssd1325_nhd27oled_2x_gr_fn, &u8g_dev_ssd1325_nhd27oled_2x_pb, U8G_COM_HW_SPI };
u8g_dev_ssd1325_nhd27oled_2x_gr_hw_spi:
        DC32 u8g_dev_ssd1325_nhd27oled_2x_gr_fn
        DC32 u8g_dev_ssd1325_nhd27oled_2x_pb, u8g_com_null_fn

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 512 bytes in section .bss
//  84 bytes in section .data
// 614 bytes in section .text
// 
// 614 bytes of CODE memory
// 596 bytes of DATA memory
//
//Errors: none
//Warnings: none
