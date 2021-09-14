///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.30.1.114/W32 for ARM        07/Apr/2021  11:05:11
// Copyright 1999-2018 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\PLT\Desktop\mksRobinLite_nano\Middlewares\Third_Party\Marlin\stepper_indirection.cpp
//    Command line =  
//        -f C:\Users\PLT\AppData\Local\Temp\EWA16A.tmp
//        (C:\Users\PLT\Desktop\mksRobinLite_nano\Middlewares\Third_Party\Marlin\stepper_indirection.cpp
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
//        C:\Users\PLT\Desktop\mksRobinLite_nano\EWARM\mksRobinLite\List\stepper_indirection.s
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
// C:\Users\PLT\Desktop\mksRobinLite_nano\Middlewares\Third_Party\Marlin\stepper_indirection.cpp
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
//   23 /**
//   24  * stepper_indirection.cpp
//   25  *
//   26  * Stepper motor driver indirection to allow some stepper functions to
//   27  * be done via SPI/I2c instead of direct pin manipulation.
//   28  *
//   29  * Part of Marlin
//   30  *
//   31  * Copyright (c) 2015 Dominik Wenger
//   32  */
//   33 
//   34 #include "stepper_indirection.h"
//   35 
//   36 #include "MarlinConfig.h"
//   37 
//   38 //
//   39 // TMC26X Driver objects and inits
//   40 //
//   41 #if ENABLED(HAVE_TMCDRIVER)
//   42 
//   43   #include <SPI.h>
//   44   #include <TMC26XStepper.h>
//   45 
//   46   #define _TMC_DEFINE(ST) TMC26XStepper stepper##ST(200, ST##_ENABLE_PIN, ST##_STEP_PIN, ST##_DIR_PIN, ST##_MAX_CURRENT, ST##_SENSE_RESISTOR)
//   47 
//   48   #if ENABLED(X_IS_TMC)
//   49     _TMC_DEFINE(X);
//   50   #endif
//   51   #if ENABLED(X2_IS_TMC)
//   52     _TMC_DEFINE(X2);
//   53   #endif
//   54   #if ENABLED(Y_IS_TMC)
//   55     _TMC_DEFINE(Y);
//   56   #endif
//   57   #if ENABLED(Y2_IS_TMC)
//   58     _TMC_DEFINE(Y2);
//   59   #endif
//   60   #if ENABLED(Z_IS_TMC)
//   61     _TMC_DEFINE(Z);
//   62   #endif
//   63   #if ENABLED(Z2_IS_TMC)
//   64     _TMC_DEFINE(Z2);
//   65   #endif
//   66   #if ENABLED(E0_IS_TMC)
//   67     _TMC_DEFINE(E0);
//   68   #endif
//   69   #if ENABLED(E1_IS_TMC)
//   70     _TMC_DEFINE(E1);
//   71   #endif
//   72   #if ENABLED(E2_IS_TMC)
//   73     _TMC_DEFINE(E2);
//   74   #endif
//   75   #if ENABLED(E3_IS_TMC)
//   76     _TMC_DEFINE(E3);
//   77   #endif
//   78   #if ENABLED(E4_IS_TMC)
//   79     _TMC_DEFINE(E4);
//   80   #endif
//   81 
//   82   #define _TMC_INIT(A) do{ \ 
//   83     stepper##A.setMicrosteps(A##_MICROSTEPS); \ 
//   84     stepper##A.start(); \ 
//   85   }while(0)
//   86 
//   87   void tmc_init() {
//   88     #if ENABLED(X_IS_TMC)
//   89       _TMC_INIT(X);
//   90     #endif
//   91     #if ENABLED(X2_IS_TMC)
//   92       _TMC_INIT(X2);
//   93     #endif
//   94     #if ENABLED(Y_IS_TMC)
//   95       _TMC_INIT(Y);
//   96     #endif
//   97     #if ENABLED(Y2_IS_TMC)
//   98       _TMC_INIT(Y2);
//   99     #endif
//  100     #if ENABLED(Z_IS_TMC)
//  101       _TMC_INIT(Z);
//  102     #endif
//  103     #if ENABLED(Z2_IS_TMC)
//  104       _TMC_INIT(Z2);
//  105     #endif
//  106     #if ENABLED(E0_IS_TMC)
//  107       _TMC_INIT(E0);
//  108     #endif
//  109     #if ENABLED(E1_IS_TMC)
//  110       _TMC_INIT(E1);
//  111     #endif
//  112     #if ENABLED(E2_IS_TMC)
//  113       _TMC_INIT(E2);
//  114     #endif
//  115     #if ENABLED(E3_IS_TMC)
//  116       _TMC_INIT(E3);
//  117     #endif
//  118     #if ENABLED(E4_IS_TMC)
//  119       _TMC_INIT(E4);
//  120     #endif
//  121   }
//  122 
//  123 #endif // HAVE_TMCDRIVER
//  124 
//  125 //
//  126 // TMC2130 Driver objects and inits
//  127 //
//  128 #if ENABLED(HAVE_TMC2130)
//  129 
//  130   #include <SPI.h>
//  131   #include <TMC2130Stepper.h>
//  132   #include "enum.h"
//  133 
//  134   #define _TMC2130_DEFINE(ST) TMC2130Stepper stepper##ST(ST##_ENABLE_PIN, ST##_DIR_PIN, ST##_STEP_PIN, ST##_CS_PIN)
//  135 
//  136   // Stepper objects of TMC2130 steppers used
//  137   #if ENABLED(X_IS_TMC2130)
//  138     _TMC2130_DEFINE(X);
//  139   #endif
//  140   #if ENABLED(X2_IS_TMC2130)
//  141     _TMC2130_DEFINE(X2);
//  142   #endif
//  143   #if ENABLED(Y_IS_TMC2130)
//  144     _TMC2130_DEFINE(Y);
//  145   #endif
//  146   #if ENABLED(Y2_IS_TMC2130)
//  147     _TMC2130_DEFINE(Y2);
//  148   #endif
//  149   #if ENABLED(Z_IS_TMC2130)
//  150     _TMC2130_DEFINE(Z);
//  151   #endif
//  152   #if ENABLED(Z2_IS_TMC2130)
//  153     _TMC2130_DEFINE(Z2);
//  154   #endif
//  155   #if ENABLED(E0_IS_TMC2130)
//  156     _TMC2130_DEFINE(E0);
//  157   #endif
//  158   #if ENABLED(E1_IS_TMC2130)
//  159     _TMC2130_DEFINE(E1);
//  160   #endif
//  161   #if ENABLED(E2_IS_TMC2130)
//  162     _TMC2130_DEFINE(E2);
//  163   #endif
//  164   #if ENABLED(E3_IS_TMC2130)
//  165     _TMC2130_DEFINE(E3);
//  166   #endif
//  167   #if ENABLED(E4_IS_TMC2130)
//  168     _TMC2130_DEFINE(E4);
//  169   #endif
//  170 
//  171   // Use internal reference voltage for current calculations. This is the default.
//  172   // Following values from Trinamic's spreadsheet with values for a NEMA17 (42BYGHW609)
//  173   // https://www.trinamic.com/products/integrated-circuits/details/tmc2130/
//  174   void tmc2130_init(TMC2130Stepper &st, const uint16_t microsteps, const uint32_t thrs, const uint32_t spmm) {
//  175     st.begin();
//  176     st.setCurrent(st.getCurrent(), R_SENSE, HOLD_MULTIPLIER);
//  177     st.microsteps(microsteps);
//  178     st.blank_time(36);
//  179     st.off_time(5); // Only enables the driver if used with stealthChop
//  180     st.interpolate(INTERPOLATE);
//  181     st.power_down_delay(128); // ~2s until driver lowers to hold current
//  182     st.hysterisis_start(0); // HSTRT = 1
//  183     st.hysterisis_low(1); // HEND = -2
//  184     st.diag1_active_high(1); // For sensorless homing
//  185     #if ENABLED(STEALTHCHOP)
//  186       st.stealth_freq(1); // f_pwm = 2/683 f_clk
//  187       st.stealth_autoscale(1);
//  188       st.stealth_gradient(5);
//  189       st.stealth_amplitude(255);
//  190       st.stealthChop(1);
//  191       #if ENABLED(HYBRID_THRESHOLD)
//  192         st.stealth_max_speed(12650000UL*st.microsteps()/(256*thrs*spmm));
//  193       #endif
//  194     #elif ENABLED(SENSORLESS_HOMING)
//  195       st.coolstep_min_speed(1024UL * 1024UL - 1UL);
//  196     #endif
//  197   }
//  198 
//  199   #define _TMC2130_INIT(ST, SPMM) tmc2130_init(stepper##ST, ST##_MICROSTEPS, ST##_HYBRID_THRESHOLD, SPMM)
//  200 
//  201   void tmc2130_init() {
//  202     constexpr uint16_t steps_per_mm[] = DEFAULT_AXIS_STEPS_PER_UNIT;
//  203     #if ENABLED(X_IS_TMC2130)
//  204       _TMC2130_INIT( X, steps_per_mm[X_AXIS]);
//  205       #if ENABLED(SENSORLESS_HOMING)
//  206         stepperX.sg_stall_value(X_HOMING_SENSITIVITY);
//  207       #endif
//  208     #endif
//  209     #if ENABLED(X2_IS_TMC2130)
//  210       _TMC2130_INIT(X2, steps_per_mm[X_AXIS]);
//  211     #endif
//  212     #if ENABLED(Y_IS_TMC2130)
//  213       _TMC2130_INIT( Y, steps_per_mm[Y_AXIS]);
//  214       #if ENABLED(SENSORLESS_HOMING)
//  215         stepperY.sg_stall_value(Y_HOMING_SENSITIVITY);
//  216       #endif
//  217     #endif
//  218     #if ENABLED(Y2_IS_TMC2130)
//  219       _TMC2130_INIT(Y2, steps_per_mm[Y_AXIS]);
//  220     #endif
//  221     #if ENABLED(Z_IS_TMC2130)
//  222       _TMC2130_INIT( Z, steps_per_mm[Z_AXIS]);
//  223     #endif
//  224     #if ENABLED(Z2_IS_TMC2130)
//  225       _TMC2130_INIT(Z2, steps_per_mm[Z_AXIS]);
//  226     #endif
//  227     #if ENABLED(E0_IS_TMC2130)
//  228       _TMC2130_INIT(E0, steps_per_mm[E_AXIS]);
//  229     #endif
//  230     #if ENABLED(E1_IS_TMC2130)
//  231       { constexpr int extruder = 1; _TMC2130_INIT(E1, steps_per_mm[E_AXIS_N]); }
//  232     #endif
//  233     #if ENABLED(E2_IS_TMC2130)
//  234       { constexpr int extruder = 2; _TMC2130_INIT(E2, steps_per_mm[E_AXIS_N]); }
//  235     #endif
//  236     #if ENABLED(E3_IS_TMC2130)
//  237       { constexpr int extruder = 3; _TMC2130_INIT(E3, steps_per_mm[E_AXIS_N]); }
//  238     #endif
//  239     #if ENABLED(E4_IS_TMC2130)
//  240       { constexpr int extruder = 4; _TMC2130_INIT(E4, steps_per_mm[E_AXIS_N]); }
//  241     #endif
//  242 
//  243     TMC2130_ADV()
//  244   }
//  245 #endif // HAVE_TMC2130
//  246 
//  247 
//  248 //
//  249 // L6470 Driver objects and inits
//  250 //
//  251 #if ENABLED(HAVE_L6470DRIVER)
//  252 
//  253   #include <SPI.h>
//  254   #include <L6470.h>
//  255 
//  256   #define _L6470_DEFINE(ST) L6470 stepper##ST(ST##_ENABLE_PIN)
//  257 
//  258   // L6470 Stepper objects
//  259   #if ENABLED(X_IS_L6470)
//  260     _L6470_DEFINE(X);
//  261   #endif
//  262   #if ENABLED(X2_IS_L6470)
//  263     _L6470_DEFINE(X2);
//  264   #endif
//  265   #if ENABLED(Y_IS_L6470)
//  266     _L6470_DEFINE(Y);
//  267   #endif
//  268   #if ENABLED(Y2_IS_L6470)
//  269     _L6470_DEFINE(Y2);
//  270   #endif
//  271   #if ENABLED(Z_IS_L6470)
//  272     _L6470_DEFINE(Z);
//  273   #endif
//  274   #if ENABLED(Z2_IS_L6470)
//  275     _L6470_DEFINE(Z2);
//  276   #endif
//  277   #if ENABLED(E0_IS_L6470)
//  278     _L6470_DEFINE(E0);
//  279   #endif
//  280   #if ENABLED(E1_IS_L6470)
//  281     _L6470_DEFINE(E1);
//  282   #endif
//  283   #if ENABLED(E2_IS_L6470)
//  284     _L6470_DEFINE(E2);
//  285   #endif
//  286   #if ENABLED(E3_IS_L6470)
//  287     _L6470_DEFINE(E3);
//  288   #endif
//  289   #if ENABLED(E4_IS_L6470)
//  290     _L6470_DEFINE(E4);
//  291   #endif
//  292 
//  293   #define _L6470_INIT(A) do{ \ 
//  294     stepper##A.init(A##_K_VAL); \ 
//  295     stepper##A.softFree(); \ 
//  296     stepper##A.setMicroSteps(A##_MICROSTEPS); \ 
//  297     stepper##A.setOverCurrent(A##_OVERCURRENT); \ 
//  298     stepper##A.setStallCurrent(A##_STALLCURRENT); \ 
//  299   } while(0)
//  300 
//  301   void L6470_init() {
//  302     #if ENABLED(X_IS_L6470)
//  303       _L6470_INIT(X);
//  304     #endif
//  305     #if ENABLED(X2_IS_L6470)
//  306       _L6470_INIT(X2);
//  307     #endif
//  308     #if ENABLED(Y_IS_L6470)
//  309       _L6470_INIT(Y);
//  310     #endif
//  311     #if ENABLED(Y2_IS_L6470)
//  312       _L6470_INIT(Y2);
//  313     #endif
//  314     #if ENABLED(Z_IS_L6470)
//  315       _L6470_INIT(Z);
//  316     #endif
//  317     #if ENABLED(Z2_IS_L6470)
//  318       _L6470_INIT(Z2);
//  319     #endif
//  320     #if ENABLED(E0_IS_L6470)
//  321       _L6470_INIT(E0);
//  322     #endif
//  323     #if ENABLED(E1_IS_L6470)
//  324       _L6470_INIT(E1);
//  325     #endif
//  326     #if ENABLED(E2_IS_L6470)
//  327       _L6470_INIT(E2);
//  328     #endif
//  329     #if ENABLED(E3_IS_L6470)
//  330       _L6470_INIT(E3);
//  331     #endif
//  332     #if ENABLED(E4_IS_L6470)
//  333       _L6470_INIT(E4);
//  334     #endif
//  335   }
//  336 
//  337 #endif // HAVE_L6470DRIVER
//  338 
// 
// 
// 0 bytes of memory
//
//Errors: none
//Warnings: 2
