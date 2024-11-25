// Copyright 2021-23 XMOS LIMITED.
// This Software is subject to the terms of the XMOS Public Licence: Version 1.

/* 
tile_map_defaults.c

This file defines weak C entry point implementations for each tile on an XCore 
device. Configuration matches the protoype given in tile_map.xc

Please the multi-tile support module README for further details.      
*/
#include <platform.h>

#include <xcore/chanend.h>

#include "main_tile.h"

#ifndef MINIMISE_MAIN_TILE_ARGS 

__attribute__((weak))
void main_tile0(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3)
{
    return;
}

__attribute__((weak))
void main_tile1(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3)
{
    return;
}

__attribute__((weak))
void main_tile2(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3)
{
    return;
}

__attribute__((weak))
void main_tile3(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3)
{
    return;
}

else // MINIMISE_MAIN_TILE_ARGS defined


// -------------------- Tile 0 weak implementation ------------------------------
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))
__attribute__((weak)) void main0(
  
// c0  
// channel c0  is loopback so it is never in the minimised argument set


// c1
#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
                      chanend_t c1
#define ARGS_STARTED
#endif


// c2
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend_t c2
#define ARGS_STARTED
#endif


// c3
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend_t c3
#endif
                      )
{
    return;
}
#endif // -------- End tile 0 weak implementation ---------------------                      



// ------------------- Tile 1 weak implementation ---------------------
#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
__attribute__((weak)) void main1(
  
// c0
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))
                      chanend_t c0
#define ARGS_STARTED
#endif

// c1  
// channel c1  is loopback so it is never in the minimised argument set


// c2
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend_t c2
#define ARGS_STARTED
#endif


// c3
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend_t c3
#endif

                      )
{
    return;
}

#endif  // ---------- End tile 1 weak implementation ------------------                     



// -------------------- Tile 2  weak implementation -------------------
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
__attribute__((weak)) void main2(
  
// c0
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))
                      chanend_t c0
#define ARGS_STARTED
#endif

#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend_t c1
#define ARGS_STARTED
#endif

// c2  
// channel c2  is loopback so it is never in the minimised argument set


// c3
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend_t c3
#endif

                      )
{
    return;
}

#endif // ----------- End tile 2 weak implementation ----------------                      



// -------------------- Tile 3 weak implementation -------------------
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))
__attribute__((weak)) void main3(
  
// c0
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))
                      chanend_t c0
#define ARGS_STARTED
#endif

#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend_t c1
#define ARGS_STARTED
#endif


// c2
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend_t c2
#endif

                      
// c3  
// channel c3  is loopback so it is never in the minimised argument set
                      )
{
    return;
}


#endif // ---------- End tile 3  weak implementation ------------------                 


#endif // MINIMISE_MAIN_TILE_ARGS


