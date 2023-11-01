// Copyright 2021 XMOS LIMITED.
// This Software is subject to the terms of the XMOS Public Licence: Version 1.

/* 
main_tile.h

This file provides prototypes for the entry point for each tile on an XCore 
device. Including this file with your application will allow entry point
errors to be picked up at compile time rather than at the link stage.

Please the multi-tile support module README for further details.      
*/
#include <platform.h>

#include <xcore/chanend.h>

#ifndef MINIMISE_MAIN_TILE_ARGS 

void main_tile0(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3);
void main_tile1(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3);
void main_tile2(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3);
void main_tile3(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3);

#else // MINIMISE_MAIN_TILE_ARGS defined

// Set defaults so that irrelevant tiles don't have to be defined
// this only happens when MINIMISE_MAIN_TILE_ARGS is defined,
// maintaining backward compatibility

#ifndef PLATFORM_SUPPORTS_TILE_0
#define PLATFORM_SUPPORTS_TILE_0 0
#endif

#ifndef PLATFORM_SUPPORTS_TILE_1
#define PLATFORM_SUPPORTS_TILE_1 0
#endif

#ifndef PLATFORM_SUPPORTS_TILE_2
#define PLATFORM_SUPPORTS_TILE_2 0
#endif

#ifndef PLATFORM_SUPPORTS_TILE_3
#define PLATFORM_SUPPORTS_TILE_3 0
#endif

#ifndef PLATFORM_USES_TILE_0
#define PLATFORM_USES_TILE_0 0
#endif

#ifndef PLATFORM_USES_TILE_1
#define PLATFORM_USES_TILE_1 0
#endif

#ifndef PLATFORM_USES_TILE_2
#define PLATFORM_USES_TILE_2 0
#endif

#ifndef PLATFORM_USES_TILE_3
#define PLATFORM_USES_TILE_3 0
#endif


// Common to all prototypes
#define MAIN_TILE_TAIL );

// -------------------- Tile 0 prototype ------------------------------
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))

#define MAIN_TILE0_HEAD void main_tile0(
  
// c0  
// channel c0  is loopback so it is never in the minimised argument set
#define MAIN_TILE0_ARG0

// c1
#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
  #define MAIN_TILE0_ARG1 chanend_t c_0to1
  #define ARGS_STARTED
#else
  #define MAIN_TILE0_ARG1
#endif


// c2
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))

  #ifdef ARGS_STARTED
    #define MAIN_TILE0_ARG2 , chanend_t c_0to2  
  #else
    #define MAIN_TILE0_ARG2 chanend_t c_0to2
  #endif
  
  #define ARGS_STARTED
  
#else
  #define MAIN_TILE0_ARG2
#endif


// c3
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))

  #ifdef ARGS_STARTED
    #define MAIN_TILE0_ARG3 , chanend_t c_0to3  
  #else
    #define MAIN_TILE0_ARG3 chanend_t c_0to3
  #endif

#else
  #define MAIN_TILE0_ARG3
#endif

 
#define MAIN_TILE0_PROTOTYPE  MAIN_TILE0_HEAD MAIN_TILE0_ARG0 MAIN_TILE0_ARG1 MAIN_TILE0_ARG2 MAIN_TILE0_ARG3 MAIN_TILE_TAIL
#endif // ----------------- End tile 0 prototype --------------------------                      



// -------------------- Tile 1 prototype ------------------------------
#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
__attribute__((weak))

#define MAIN_TILE0_HEAD void main_tile1(

  
// c0
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))
  #define MAIN_TILE1_ARG0 chanend_t c_1to0
  #define ARGS_STARTED
#else
  #define MAIN_TILE1_ARG0
#endif

// c1  
// channel c1  is loopback so it is never in the minimised argument set
#define MAIN_TILE1_ARG1


// c2
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
  #ifdef ARGS_STARTED
    #define MAIN_TILE1_ARG2 , chanend_t c_1to2  
  #else
    #define MAIN_TILE1_ARG2 chanend_t c_1to2
  #endif
  
  #define ARGS_STARTED
  
#else
  #define MAIN_TILE1_ARG2
#endif


// c3
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))

  #ifdef ARGS_STARTED
    #define MAIN_TILE1_ARG3 , chanend_t c_1to3  
  #else
    #define MAIN_TILE1_ARG3 chanend_t c_1to3
  #endif

#else
  #define MAIN_TILE1_ARG3
#endif


#define MAIN_TILE1_PROTOTYPE  MAIN_TILE1_HEAD MAIN_TILE1_ARG0 MAIN_TILE1_ARG1 MAIN_TILE1_ARG2 MAIN_TILE1_ARG3 MAIN_TILE_TAIL
#endif  // ----------------- End tile 1 prototype --------------------------                     



// -------------------- Tile 2 prototype ------------------------------
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
__attribute__((weak))

#define MAIN_TILE0_HEAD void main_tile2(
  
// c0
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))
  #define MAIN_TILE2_ARG0 chanend_t c_2to0
  #define ARGS_STARTED
#else
  #define MAIN_TILE2_ARG0
#endif

#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
  #ifdef ARGS_STARTED
    #define MAIN_TILE2_ARG1 , chanend_t c_2to1  
  #else
    #define MAIN_TILE2_ARG1 chanend_t c_2to1
  #endif
  
  #define ARGS_STARTED
  
#else
  #define MAIN_TILE3_ARG1
#endif

// c2  
// channel c2  is loopback so it is never in the minimised argument set
#define MAIN_TILE2_ARG2


// c3
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))

  #ifdef ARGS_STARTED
    #define MAIN_TILE2_ARG3 , chanend_t c_2to3  
  #else
    #define MAIN_TILE2_ARG3 chanend_t c_2to3
  #endif

#else
  #define MAIN_TILE2_ARG3
#endif


#define MAIN_TILE2_PROTOTYPE  MAIN_TILE2_HEAD MAIN_TILE2_ARG0 MAIN_TILE2_ARG1 MAIN_TILE2_ARG2 MAIN_TILE2_ARG3 MAIN_TILE_TAIL
#endif // ----------------- End tile 2 prototype --------------------------                      



// -------------------- Tile 3 prototype ------------------------------
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))
__attribute__((weak))

#define MAIN_TILE0_HEAD void main_tile3(
  
// c0
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))
  #define MAIN_TILE3_ARG0 chanend_t c_3to0
  #define ARGS_STARTED
#else
  #define MAIN_TILE3_ARG0
#endif

#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
  #ifdef ARGS_STARTED
    #define MAIN_TILE3_ARG1 , chanend_t c_3to1  
  #else
    #define MAIN_TILE3_ARG1 chanend_t c_3to1
  #endif
  
  #define ARGS_STARTED
  
#else
  #define MAIN_TILE3_ARG1
#endif


// c2
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
  #ifdef ARGS_STARTED
    #define MAIN_TILE3_ARG2 , chanend_t c_3to2  
  #else
    #define MAIN_TILE3_ARG2 chanend_t c_3to2
  #endif
  
  #define ARGS_STARTED
  
#else
  #define MAIN_TILE3_ARG2
#endif
                      
// c3  
// channel c3  is loopback so it is never in the minimised argument set
#define MAIN_TILE3_ARG3


#define MAIN_TILE3_PROTOTYPE  MAIN_TILE3_HEAD MAIN_TILE3_ARG0 MAIN_TILE3_ARG1 MAIN_TILE3_ARG2 MAIN_TILE3_ARG3 MAIN_TILE_TAIL
#endif // ----------------- End tile 3 prototype --------------------------                 


#endif // MINIMISE_MAIN_TILE_ARGS


 
