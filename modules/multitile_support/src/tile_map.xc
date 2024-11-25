// Copyright 2021-2023 XMOS LIMITED.
// This Software is subject to the terms of the XMOS Public Licence: Version 1.


/* 
tile_map.xc

This file defines entry points and initial communication channels between 
tiles on an XCore device. For a two tile application on an XCore 
the C code entry point prototypes for tiles 0 and 1 respectively will be:
  
void main_tile0(chanend_t c);
void main_tile1(chanend_t c);

The chanend_t c can be used on each tile to communicate with the other 
tile by making use of the functions defined in <xcore/channel.h>. To 
achieve this configuration, the required preprocessor defines are:

PLATFORM_SUPPORTS_TILE_0 = 1                                   
PLATFORM_SUPPORTS_TILE_1 = 1                                   
PLATFORM_USES_TILE_0 = 1                                   
PLATFORM_USES_TILE_1 = 1 
MINIMISE_MAIN_TILE_ARGS

Please the multi-tile support module README for further details.      
*/

#include "platform.h"

extern "C" {

#include "main_tile.h

#if (XSCOPE_HOST_IO_ENABLED == 1)
#ifndef XSCOPE_HOST_IO_TILE
#define XSCOPE_HOST_IO_TILE 0
#endif
void init_xscope_host_data_user_cb(chanend c_host);
#endif
}

int main(void) {
#if (XSCOPE_HOST_IO_ENABLED == 1)
  chan c_xscope_host;
#endif
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1) && \
     (PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
  chan c_t0_t1;
#endif
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1) && \
     (PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
  chan c_t0_t2;
#endif
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1) && \
     (PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))
  chan c_t0_t3;
#endif
#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1) && \
     (PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
  chan c_t1_t2;
#endif
#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1) && \
     (PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))
  chan c_t1_t3;
#endif
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1) && \
     (PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))
  chan c_t2_t3;
#endif

  par {
#if (XSCOPE_HOST_IO_ENABLED == 1)
    xscope_host_data(c_xscope_host);
    on tile[XSCOPE_HOST_IO_TILE] : init_xscope_host_data_user_cb(c_xscope_host);
#endif



// -------------------- Tile 0 usage -------------------------------
#if (PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1)
#undef ARGS_STARTED
    on tile[0] : main_tile0(
    
// Tile 0 loopback argument
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif


// Tile 0 channel to tile 1
#if (PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1)
#ifdef ARGS_STARTED      
                          ,
#endif
                    c_t0_t1
#ifdef MINIMISE_MAIN_TILE_ARGS
#define ARGS_STARTED
#else
                           ,
#endif
#else
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif
#endif

// Tile 0 channel to tile 2
#if (PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1)
#ifdef ARGS_STARTED      
                          ,
#endif
                    c_t0_t2
#ifdef MINIMISE_MAIN_TILE_ARGS
#define ARGS_STARTED
#else
                           ,
#endif
#else
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif
#endif

// Tile 0 channel to tile 3
#if (PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1)
#ifdef ARGS_STARTED      
                          ,
#endif
                    c_t0_t3
#ifndef MINIMISE_MAIN_TILE_ARGS
                           ,
#endif
#else
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null
#endif
#endif


                );
#endif // ----------------- End tile 0 usage -----------------------




// -------------------- Tile 1 usage -------------------------------
#if (PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1)
#undef ARGS_STARTED
    on tile[1] : main_tile1(
    

// Tile 1 channel to tile 0    
#if (PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1)
#ifdef ARGS_STARTED      
                          ,
#endif
                    c_t0_t1
#ifdef MINIMISE_MAIN_TILE_ARGS
#define ARGS_STARTED
#else
                           ,
#endif
#else
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif
#endif

// Tile 1 loopback argument
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif


// Tile 1 channel to tile 2    
#if (PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1)
#ifdef ARGS_STARTED      
                          ,
#endif
                    c_t1_t2
#ifdef MINIMISE_MAIN_TILE_ARGS
#define ARGS_STARTED
#else
                           ,
#endif
#else
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif
#endif


// Tile 1 channel to tile 3    
#if (PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1)
#ifdef ARGS_STARTED      
                          ,
#endif
                    c_t1_t3
#ifndef MINIMISE_MAIN_TILE_ARGS
                           ,
#endif
#else
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null
#endif
#endif


                );
#endif // -------------------- End tile 1 usage -----------------------



// -------------------- Tile 2 usage -------------------------------
#if (PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1)
#undef ARGS_STARTED
    on tile[2] : main_tile2(


// Tile 2 channel to tile 0    
#if (PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1)
#ifdef ARGS_STARTED      
                          ,
#endif
                    c_t0_t2
#ifdef MINIMISE_MAIN_TILE_ARGS
#define ARGS_STARTED
#else
                           ,
#endif
#else
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif
#endif


// Tile 2 channel to tile 1    
#if (PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1)
#ifdef ARGS_STARTED      
                          ,
#endif
                    c_t1_t2
#ifdef MINIMISE_MAIN_TILE_ARGS
#define ARGS_STARTED
#else
                           ,
#endif
#else
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif
#endif


// Tile 2 loopback argument
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif


// Tile 2 channel to tile 3    
#if (PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1)
#ifdef ARGS_STARTED      
                          ,
#endif
                    c_t2_t3
#ifndef MINIMISE_MAIN_TILE_ARGS
                           ,
#endif
#else
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null
#endif
#endif


                  );
#endif // -------------------- End tile 2 usage -----------------------



// -------------------- Tile 3 usage -------------------------------
#if (PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1)
#undef ARGS_STARTED
    on tile[3] : main_tile3(
    
    
// Tile 3 channel to tile 0    
#if (PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1)
#ifdef ARGS_STARTED      
                          ,
#endif
                    c_t0_t3
#ifdef MINIMISE_MAIN_TILE_ARGS
#define ARGS_STARTED
#else
                           ,
#endif
#else
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif
#endif

// Tile 3 channel to tile 1    
#if (PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1)
#ifdef ARGS_STARTED      
                          ,
#endif
                    c_t1_t3
#ifndef MINIMISE_MAIN_TILE_ARGS
                           ,
#endif
#else
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif
#endif


// Tile 2 channel to tile 0    
#if (PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1)
#ifdef ARGS_STARTED      
                          ,
#endif
                    c_t2_t3
#ifndef MINIMISE_MAIN_TILE_ARGS
                           ,
#endif
#else
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif
#endif

// Tile 3 loopback argument
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null
#endif


                    );
#endif // -------------------- End tile 3 usage -----------------------
  }

  return 0;
}

