// Copyright 2023 XMOS LIMITED.
// This Software is subject to the terms of the XMOS Public Licence: Version 1.

/* 
main_tile.h

This file provides prototypes for the entry point for each tile on an XCore 
device. Including this file with your application will allow entry point
errors to be picked up at compile time rather than at the link stage.

Please see the multi-tile support module README for further details.      
*/
#include <platform.h>

#include <xcore/chanend.h>

extern "C" 
{

#ifndef MINIMISE_MAIN_TILE_ARGS

void main_tile0(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3);
void main_tile1(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3);
void main_tile2(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3);
void main_tile3(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3);

#else // MINIMISE_MAIN_TILE_ARGS

// ---------------- Minimised Argument Prototypes ---------------------
// Common to all 
#define MAIN_TAIL );

// -------------------- Tile 0 prototype ------------------------------
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))

#define MAIN0_HEAD void main_tile0(
  
// c0  
// channel c0  is loopback so it is never in the minimised argument set
#define MAIN0_ARG0

// c1
#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
  #define MAIN0_ARG1 chanend_t c_0to1
  #define ARGS_STARTED
#else
  #define MAIN0_ARG1
#endif


// c2
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))

  #ifdef ARGS_STARTED
    #define MAIN0_ARG2 , chanend_t c_0to2  
  #else
    #define MAIN0_ARG2 chanend_t c_0to2
  #endif
  
  #define ARGS_STARTED
  
#else
  #define MAIN0_ARG2
#endif


// c3
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))

  #ifdef ARGS_STARTED
    #define MAIN0_ARG3 , chanend_t c_0to3  
  #else
    #define MAIN0_ARG3 chanend_t c_0to3
  #endif

#else
  #define MAIN0_ARG3
#endif

 
MAIN0_HEAD MAIN0_ARG0 MAIN0_ARG1 MAIN0_ARG2 MAIN0_ARG3 MAIN_TAIL
#endif // ----------------- End tile 0 prototype --------------------------                      



// -------------------- Tile 1 prototype ------------------------------
#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))

#define MAIN1_HEAD void main_tile1(

  
// c0
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))
  #define MAIN1_ARG0 chanend_t c_1to0
  #define ARGS_STARTED
#else
  #define MAIN1_ARG0
#endif

// c1  
// channel c1  is loopback so it is never in the minimised argument set
#define MAIN1_ARG1


// c2
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
  #ifdef ARGS_STARTED
    #define MAIN1_ARG2 , chanend_t c_1to2  
  #else
    #define MAIN1_ARG2 chanend_t c_1to2
  #endif
  
  #define ARGS_STARTED
  
#else
  #define MAIN1_ARG2
#endif


// c3
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))

  #ifdef ARGS_STARTED
    #define MAIN1_ARG3 , chanend_t c_1to3  
  #else
    #define MAIN1_ARG3 chanend_t c_1to3
  #endif

#else
  #define MAIN1_ARG3
#endif


MAIN1_HEAD MAIN1_ARG0 MAIN1_ARG1 MAIN1_ARG2 MAIN1_ARG3 MAIN_TAIL
#endif  // ----------------- End tile 1 prototype --------------------------                     



// -------------------- Tile 2 prototype ------------------------------
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
#define MAIN2_HEAD void main_tile2(
  
// c0
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))
  #define MAIN2_ARG0 chanend_t c_2to0
  #define ARGS_STARTED
#else
  #define MAIN2_ARG0
#endif

#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
  #ifdef ARGS_STARTED
    #define MAIN2_ARG1 , chanend_t c_2to1  
  #else
    #define MAIN2_ARG1 chanend_t c_2to1
  #endif
  
  #define ARGS_STARTED
  
#else
  #define MAIN3_ARG1
#endif

// c2  
// channel c2  is loopback so it is never in the minimised argument set
#define MAIN2_ARG2


// c3
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))

  #ifdef ARGS_STARTED
    #define MAIN2_ARG3 , chanend_t c_2to3  
  #else
    #define MAIN2_ARG3 chanend_t c_2to3
  #endif

#else
  #define MAIN2_ARG3
#endif


MAIN2_HEAD MAIN2_ARG0 MAIN2_ARG1 MAIN2_ARG2 MAIN2_ARG3 MAIN_TAIL
#endif // ----------------- End tile 2 prototype --------------------------                      



// -------------------- Tile 3 prototype ------------------------------
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))
#define MAIN3_HEAD void main_tile3(
  
// c0
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))
  #define MAIN3_ARG0 chanend_t c_3to0
  #define ARGS_STARTED
#else
  #define MAIN3_ARG0
#endif

#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
  #ifdef ARGS_STARTED
    #define MAIN3_ARG1 , chanend_t c_3to1  
  #else
    #define MAIN3_ARG1 chanend_t c_3to1
  #endif
  
  #define ARGS_STARTED
  
#else
  #define MAIN3_ARG1
#endif


// c2
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
  #ifdef ARGS_STARTED
    #define MAIN3_ARG2 , chanend_t c_3to2  
  #else
    #define MAIN3_ARG2 chanend_t c_3to2
  #endif
  
  #define ARGS_STARTED
  
#else
  #define MAIN3_ARG2
#endif
                      
// c3  
// channel c3  is loopback so it is never in the minimised argument set
#define MAIN3_ARG3


MAIN3_HEAD MAIN3_ARG0 MAIN3_ARG1 MAIN3_ARG2 MAIN3_ARG3 MAIN_TAIL
#endif // ----------------- End tile 3 prototype --------------------------                 

#endif // MINIMISE_MAIN_TILE_ARGS
}
 
