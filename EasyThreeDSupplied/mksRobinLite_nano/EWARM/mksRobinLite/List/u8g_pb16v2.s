///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.22.1.15669/W32 for ARM      28/Dec/2020  21:37:11
// Copyright 1999-2018 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\nano\Middlewares\Third_Party\u8glib_arm_v1.17\src\u8g_pb16v2.c
//    Command line =  
//        -f C:\Users\ADMINI~1\AppData\Local\Temp\EW537C.tmp
//        (F:\nano\Middlewares\Third_Party\u8glib_arm_v1.17\src\u8g_pb16v2.c -D
//        USE_HAL_DRIVER -D STM32F103xE -D MKS_ROBIN -D MARLIN -D __arm__ -D
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
//    List file    =  F:\nano\EWARM\mksRobinLite\List\u8g_pb16v2.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_version", "6"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN u8g_page_First
        EXTERN u8g_page_Next
        EXTERN u8g_pb_GetPageBox
        EXTERN u8g_pb_Is8PixelVisible

        PUBLIC u8g_dev_pb16v2_base_fn
        PUBLIC u8g_pb16v2Init
        PUBLIC u8g_pb16v2_Clear
        PUBLIC u8g_pb16v2_Set8PixelStd
        PUBLIC u8g_pb16v2_SetPixel
        PUBLIC u8g_pb16v2_set_pixel
        
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
        
// F:\nano\Middlewares\Third_Party\u8glib_arm_v1.17\src\u8g_pb16v2.c
//    1 /*
//    2 
//    3   u8g_pb16v2.c
//    4   
//    5   16 bit height 2 bit per pixel page buffer
//    6   byte has vertical orientation
//    7 
//    8   Universal 8bit Graphics Library
//    9   
//   10   Copyright (c) 2012, olikraus@gmail.com
//   11   All rights reserved.
//   12 
//   13   Redistribution and use in source and binary forms, with or without modification, 
//   14   are permitted provided that the following conditions are met:
//   15 
//   16   * Redistributions of source code must retain the above copyright notice, this list 
//   17     of conditions and the following disclaimer.
//   18     
//   19   * Redistributions in binary form must reproduce the above copyright notice, this 
//   20     list of conditions and the following disclaimer in the documentation and/or other 
//   21     materials provided with the distribution.
//   22 
//   23   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND 
//   24   CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
//   25   INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
//   26   MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
//   27   DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR 
//   28   CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
//   29   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
//   30   NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
//   31   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
//   32   CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
//   33   STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
//   34   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
//   35   ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.  
//   36   
//   37 
//   38 */
//   39 
//   40 #include "u8g.h"
//   41 #include <string.h>
//   42 
//   43 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function u8g_pb16v2_Clear
          CFI NoCalls
        THUMB
//   44 void u8g_pb16v2_Clear(u8g_pb_t *b)
//   45 {
//   46   uint8_t *ptr = (uint8_t *)b->buf;
u8g_pb16v2_Clear:
        LDR      R1,[R0, #+8]
//   47   uint8_t *end_ptr = ptr;
//   48   
//   49   /* two bits per pixel, 16 bits height --> 8 pixel --> 4 pixel per byte */
//   50   end_ptr += b->width;
//   51   end_ptr += b->width;
        LDRB     R0,[R0, #+5]
        ADD      R0,R1,R0, LSL #+1
        MOVS     R2,#+0
//   52   
//   53   do
//   54   {
//   55     *ptr++ = 0;
??u8g_pb16v2_Clear_0:
        STRB     R2,[R1], #+1
//   56   } while( ptr != end_ptr );
        CMP      R1,R0
        BNE.N    ??u8g_pb16v2_Clear_0
//   57 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   58 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function u8g_pb16v2Init
        THUMB
//   59 void u8g_pb16v2Init(u8g_pb_t *b, void *buf, u8g_uint_t width)
//   60 {
//   61   b->buf = buf;
u8g_pb16v2Init:
        STR      R1,[R0, #+8]
//   62   b->width = width;
        STRB     R2,[R0, #+5]
//   63   u8g_pb16v2_Clear(b);
          CFI FunCall u8g_pb16v2_Clear
        B.N      u8g_pb16v2_Clear
//   64 }
          CFI EndBlock cfiBlock1
//   65 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function u8g_pb16v2_set_pixel
          CFI NoCalls
        THUMB
//   66 void u8g_pb16v2_set_pixel(u8g_pb_t *b, u8g_uint_t x, u8g_uint_t y, uint8_t color_index)
//   67 {
u8g_pb16v2_set_pixel:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   68   register uint8_t mask;
//   69   uint8_t *ptr = b->buf;
        LDR      R5,[R0, #+8]
//   70   y -= b->p.page_y0;
        LDRB     R4,[R0, #+2]
        SUBS     R2,R2,R4
//   71   if ( y >= 4 )
        MOV      R4,R2
        UXTB     R4,R4
        CMP      R4,#+4
        BLT.N    ??u8g_pb16v2_set_pixel_0
//   72   {
//   73     ptr += b->width;
        LDRB     R0,[R0, #+5]
        ADD      R5,R5,R0
//   74   }
//   75   mask = 0x03;
//   76   y &= 0x03;
//   77   y <<= 1;
??u8g_pb16v2_set_pixel_0:
        LSLS     R2,R2,#+1
        AND      R2,R2,#0x6
//   78   mask <<= y;
//   79   mask ^=0xff;
//   80   color_index &= 3;
//   81   color_index <<= y;
//   82   ptr += x;
        ADDS     R0,R5,R1
//   83   *ptr &= mask;
        LDRB     R1,[R0, #+0]
        MOVS     R4,#+3
        LSLS     R4,R4,R2
        EOR      R4,R4,#0xFF
        ANDS     R1,R4,R1
        STRB     R1,[R0, #+0]
//   84   *ptr |= color_index;
        AND      R3,R3,#0x3
        LSL      R2,R3,R2
        ORRS     R2,R2,R1
        STRB     R2,[R0, #+0]
//   85 }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//   86 
//   87 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function u8g_pb16v2_SetPixel
        THUMB
//   88 void u8g_pb16v2_SetPixel(u8g_pb_t *b, const u8g_dev_arg_pixel_t * const arg_pixel)
//   89 {
u8g_pb16v2_SetPixel:
        PUSH     {R3,R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+8
//   90   if ( arg_pixel->y < b->p.page_y0 )
        LDRB     R2,[R1, #+1]
        LDRB     R3,[R0, #+2]
        CMP      R2,R3
        BCC.N    ??u8g_pb16v2_SetPixel_0
//   91     return;
//   92   if ( arg_pixel->y > b->p.page_y1 )
        LDRB     R3,[R0, #+3]
        CMP      R3,R2
        BCC.N    ??u8g_pb16v2_SetPixel_0
//   93     return;
//   94   if ( arg_pixel->x >= b->width )
        LDRB     R4,[R1, #+0]
        LDRB     R3,[R0, #+5]
        CMP      R4,R3
        BCS.N    ??u8g_pb16v2_SetPixel_0
//   95     return;
//   96   u8g_pb16v2_set_pixel(b, arg_pixel->x, arg_pixel->y, arg_pixel->color);
        LDRB     R3,[R1, #+4]
        MOV      R1,R4
        ADD      SP,SP,#+4
          CFI CFA R13+4
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
          CFI FunCall u8g_pb16v2_set_pixel
        B.N      u8g_pb16v2_set_pixel
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+8
??u8g_pb16v2_SetPixel_0:
        POP      {R0,R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
//   97 }
          CFI EndBlock cfiBlock3
//   98 
//   99 

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function u8g_pb16v2_Set8PixelStd
        THUMB
//  100 void u8g_pb16v2_Set8PixelStd(u8g_pb_t *b, u8g_dev_arg_pixel_t *arg_pixel)
//  101 {
u8g_pb16v2_Set8PixelStd:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOV      R4,R0
        MOV      R5,R1
//  102   register uint8_t pixel = arg_pixel->pixel;
        LDRB     R6,[R5, #+2]
//  103   do
//  104   {
//  105     if ( pixel & 128 )
??u8g_pb16v2_Set8PixelStd_1:
        LSLS     R0,R6,#+24
        BPL.N    ??u8g_pb16v2_Set8PixelStd_2
//  106     {
//  107       u8g_pb16v2_SetPixel(b, arg_pixel);
        MOV      R1,R5
        MOV      R0,R4
          CFI FunCall u8g_pb16v2_SetPixel
        BL       u8g_pb16v2_SetPixel
//  108     }
//  109     switch( arg_pixel->dir )
??u8g_pb16v2_Set8PixelStd_2:
        LDRB     R0,[R5, #+3]
        CMP      R0,#+3
        BHI.N    ??u8g_pb16v2_Set8PixelStd_3
        TBB      [PC, R0]
        DATA
??u8g_pb16v2_Set8PixelStd_0:
        DC8      0x2,0x6,0xA,0xE
        THUMB
//  110     {
//  111       case 0: arg_pixel->x++; break;
??u8g_pb16v2_Set8PixelStd_4:
        LDRB     R0,[R5, #+0]
        ADDS     R0,R0,#+1
        STRB     R0,[R5, #+0]
        B.N      ??u8g_pb16v2_Set8PixelStd_3
//  112       case 1: arg_pixel->y++; break;
??u8g_pb16v2_Set8PixelStd_5:
        LDRB     R0,[R5, #+1]
        ADDS     R0,R0,#+1
        STRB     R0,[R5, #+1]
        B.N      ??u8g_pb16v2_Set8PixelStd_3
//  113       case 2: arg_pixel->x--; break;
??u8g_pb16v2_Set8PixelStd_6:
        LDRB     R0,[R5, #+0]
        SUBS     R0,R0,#+1
        STRB     R0,[R5, #+0]
        B.N      ??u8g_pb16v2_Set8PixelStd_3
//  114       case 3: arg_pixel->y--; break;
??u8g_pb16v2_Set8PixelStd_7:
        LDRB     R0,[R5, #+1]
        SUBS     R0,R0,#+1
        STRB     R0,[R5, #+1]
//  115     }
//  116     pixel <<= 1;
??u8g_pb16v2_Set8PixelStd_3:
        LSLS     R6,R6,#+1
//  117   } while( pixel != 0  );
        MOV      R0,R6
        UXTB     R0,R0
        CMP      R0,#+0
        BNE.N    ??u8g_pb16v2_Set8PixelStd_1
//  118 }
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock4
//  119 
//  120 
//  121 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function u8g_dev_pb16v2_base_fn
        THUMB
//  122 uint8_t u8g_dev_pb16v2_base_fn(u8g_t *u8g, u8g_dev_t *dev, uint8_t msg, void *arg)
//  123 {
u8g_dev_pb16v2_base_fn:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOV      R4,R3
//  124   u8g_pb_t *pb = (u8g_pb_t *)(dev->dev_mem);
        LDR      R5,[R1, #+4]
//  125   switch(msg)
        CMP      R2,#+20
        BEQ.N    ??u8g_dev_pb16v2_base_fn_0
        CMP      R2,#+21
        BEQ.N    ??u8g_dev_pb16v2_base_fn_1
        CMP      R2,#+23
        BEQ.N    ??u8g_dev_pb16v2_base_fn_2
        CMP      R2,#+50
        BEQ.N    ??u8g_dev_pb16v2_base_fn_3
        CMP      R2,#+59
        BEQ.N    ??u8g_dev_pb16v2_base_fn_4
        CMP      R2,#+70
        BEQ.N    ??u8g_dev_pb16v2_base_fn_5
        CMP      R2,#+71
        BEQ.N    ??u8g_dev_pb16v2_base_fn_6
        CMP      R2,#+72
        BEQ.N    ??u8g_dev_pb16v2_base_fn_7
        B.N      ??u8g_dev_pb16v2_base_fn_8
//  126   {
//  127     case U8G_DEV_MSG_SET_8PIXEL:
//  128       if ( u8g_pb_Is8PixelVisible(pb, (u8g_dev_arg_pixel_t *)arg) )
??u8g_dev_pb16v2_base_fn_4:
        MOV      R1,R4
        MOV      R0,R5
          CFI FunCall u8g_pb_Is8PixelVisible
        BL       u8g_pb_Is8PixelVisible
        CMP      R0,#+0
        BEQ.N    ??u8g_dev_pb16v2_base_fn_8
//  129       {
//  130         u8g_pb16v2_Set8PixelStd(pb, (u8g_dev_arg_pixel_t *)arg);
        MOV      R1,R4
        MOV      R0,R5
          CFI FunCall u8g_pb16v2_Set8PixelStd
        BL       u8g_pb16v2_Set8PixelStd
//  131       }
//  132       break;
//  133     case U8G_DEV_MSG_SET_PIXEL:
//  134       u8g_pb16v2_SetPixel(pb, (u8g_dev_arg_pixel_t *)arg);
//  135       break;
//  136     case U8G_DEV_MSG_INIT:
//  137       break;
//  138     case U8G_DEV_MSG_STOP:
//  139       break;
//  140     case U8G_DEV_MSG_PAGE_FIRST:
//  141       u8g_pb16v2_Clear(pb);
//  142       u8g_page_First(&(pb->p));
//  143       break;
//  144     case U8G_DEV_MSG_PAGE_NEXT:
//  145       if ( u8g_page_Next(&(pb->p)) == 0 )
//  146         return 0;
//  147       u8g_pb16v2_Clear(pb);
//  148       break;
//  149 #ifdef U8G_DEV_MSG_IS_BBX_INTERSECTION
//  150     case U8G_DEV_MSG_IS_BBX_INTERSECTION:
//  151       return u8g_pb_IsIntersection(pb, (u8g_dev_arg_bbx_t *)arg);
//  152 #endif
//  153     case U8G_DEV_MSG_GET_PAGE_BOX:
//  154       u8g_pb_GetPageBox(pb, (u8g_box_t *)arg);
//  155       break;
//  156     case U8G_DEV_MSG_GET_WIDTH:
//  157       *((u8g_uint_t *)arg) = pb->width;
//  158       break;
//  159     case U8G_DEV_MSG_GET_HEIGHT:
//  160       *((u8g_uint_t *)arg) = pb->p.total_height;
//  161       break;
//  162     case U8G_DEV_MSG_SET_COLOR_ENTRY:
//  163       break;
//  164     case U8G_DEV_MSG_SET_XY_CB:
//  165       break;
//  166     case U8G_DEV_MSG_GET_MODE:
//  167       return U8G_MODE_GRAY2BIT;
//  168   }
//  169   return 1;
??u8g_dev_pb16v2_base_fn_8:
        MOVS     R0,#+1
        POP      {R1,R4,R5,PC}    ;; return
??u8g_dev_pb16v2_base_fn_3:
        MOV      R1,R4
        MOV      R0,R5
          CFI FunCall u8g_pb16v2_SetPixel
        BL       u8g_pb16v2_SetPixel
        B.N      ??u8g_dev_pb16v2_base_fn_8
??u8g_dev_pb16v2_base_fn_0:
        MOV      R0,R5
          CFI FunCall u8g_pb16v2_Clear
        BL       u8g_pb16v2_Clear
        MOV      R0,R5
          CFI FunCall u8g_page_First
        BL       u8g_page_First
        B.N      ??u8g_dev_pb16v2_base_fn_8
??u8g_dev_pb16v2_base_fn_1:
        MOV      R0,R5
          CFI FunCall u8g_page_Next
        BL       u8g_page_Next
        CMP      R0,#+0
        BNE.N    ??u8g_dev_pb16v2_base_fn_9
        MOVS     R0,#+0
        POP      {R1,R4,R5,PC}
??u8g_dev_pb16v2_base_fn_9:
        MOV      R0,R5
          CFI FunCall u8g_pb16v2_Clear
        BL       u8g_pb16v2_Clear
        B.N      ??u8g_dev_pb16v2_base_fn_8
??u8g_dev_pb16v2_base_fn_2:
        MOV      R1,R4
        MOV      R0,R5
          CFI FunCall u8g_pb_GetPageBox
        BL       u8g_pb_GetPageBox
        B.N      ??u8g_dev_pb16v2_base_fn_8
??u8g_dev_pb16v2_base_fn_5:
        LDRB     R0,[R5, #+5]
        STRB     R0,[R4, #+0]
        B.N      ??u8g_dev_pb16v2_base_fn_8
??u8g_dev_pb16v2_base_fn_6:
        LDRB     R0,[R5, #+1]
        STRB     R0,[R4, #+0]
        B.N      ??u8g_dev_pb16v2_base_fn_8
??u8g_dev_pb16v2_base_fn_7:
        MOVS     R0,#+2
        POP      {R1,R4,R5,PC}
//  170 }
          CFI EndBlock cfiBlock5

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//  171  
//  172   
// 
// 334 bytes in section .text
// 
// 334 bytes of CODE memory
//
//Errors: none
//Warnings: none
