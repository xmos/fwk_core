// This Software is subject to the terms of the XMOS Public Licence: Version 1.
// XMOS Public License: Version 1

/* 
This file defines entry points and initial communication channels between 
tiles on an XCore device. Pre-processor defines are used to configure the 
setup for a given configuation.       

Standard two tile configuration (e.g. XCore.ai)
-----------------------------------------------

In the case of a two tile application on an XCore.ai the C code entry 
point prototypes for tiles 0 and 1 respectively can be:
  
void main_tile0(chanend_t c);
void main_tile1(chanend_t c);

The chanend_t c can be used on each tile to communicate with the other 
tile by making use of the functions defined in <xcore/channel.h>. Note
that any channel communication operation (e.g. chan_out_word(c, 100); )
on one tile must be matched by the opposite channel operation on the 
other tile (e.g. int a = chan_in_word(c); )

To achieve this configuration, the required preprocessor defines are:
PLATFORM_SUPPORTS_TILE_0 = 1                                   
PLATFORM_SUPPORTS_TILE_1 = 1                                   
PLATFORM_USES_TILE_0 = 1                                   
PLATFORM_USES_TILE_1 = 1 
MINIMISE_MAIN_TILE_ARGS

                            
Alternate configurations
------------------------
                                                                          
In general, the code entry point prototype for each tile will be:
                                                                           
void main_tileX (ARGS);

where X is the tile number and ARGS are as described below. Each tile that    
is available in the system and used by the application will have an entry
point defined. 

A tile is available in the system if PLATFORM_SUPPORTS_TILE_X is set to 1
where X is the tile number. 

A tile is used by the application if PLATFORM_USES_TILE_X is set to 1 where
X is the tile number.

If MINIMISE_MAIN_TILE_ARGS is not defined, each tile has an entry point of 
the form:

void main_tileX(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3);

where X is the tile number. The four arguments are channel ends that 
connect to each of the other tiles. In the above protoype, cY indicates a 
channel to tile Y. Where a tile Y is not available and used, or the channel
indicates a loopback (i.e. X == Y), that channel end argument is not a
valid channel end, and must not be used.

If MINIMISE_MAIN_TILE_ARGS is defined, the entry point prototype for 
tiles defined as both available and used will be as decscribed above except  
that invalid channel ends are removed. For example, if tiles 0, 2 and 3 are 
available and used and MINIMISE_MAIN_TILE_ARGS is defined, the entry point 
prototypes would be:

void main_tile0(chanend c2, chanend c3);
void main_tile2(chanend c0, chanend c3);
void main_tile3(chanend c0, chanend c2);

When setting preprocessor defines, using the MINIMISE_MAIN_TILE_ARGS define
also means that PLATFORM_SUPPORTS_TILE_X and PLATFORM_USES_TILE_X that are 
undefined are considered to be the equivalent to being set to 0.
*/


#include "platform.h"

extern "C" {


#ifndef MINIMISE_MAIN_TILE_ARGS 



void main_tile0(chanend c0, chanend c1, chanend c2, chanend c3);
void main_tile1(chanend c0, chanend c1, chanend c2, chanend c3);
void main_tile2(chanend c0, chanend c1, chanend c2, chanend c3);
void main_tile3(chanend c0, chanend c1, chanend c2, chanend c3);


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

// -------------------- Tile 0 prototype ------------------------------
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))
                      void main_tile0(
  
// c0  
// channel c0  is loopback so it is never in the minimised argument set


// c1
#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
                      chanend c1
#define ARGS_STARTED
#endif


// c2
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend c2
#define ARGS_STARTED
#endif


// c3
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend c3
#endif
                      );
#endif // ----------------- End tile 0 prototype --------------------------                      



// -------------------- Tile 1 prototype ------------------------------
#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
                      void main_tile1(
  
// c0
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))
                      chanend c0
#define ARGS_STARTED
#endif

// c1  
// channel c1  is loopback so it is never in the minimised argument set


// c2
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend c2
#define ARGS_STARTED
#endif


// c3
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend c3
#endif

                      );
#endif  // ----------------- End tile 1 prototype --------------------------                     



// -------------------- Tile 2 prototype ------------------------------
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
                      void main_tile2(
  
// c0
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))
                      chanend c0
#define ARGS_STARTED
#endif

#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend c1
#define ARGS_STARTED
#endif

// c2  
// channel c2  is loopback so it is never in the minimised argument set


// c3
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend c3
#endif

                      );
#endif // ----------------- End tile 2 prototype --------------------------                      



// -------------------- Tile 3 prototype ------------------------------
#if ((PLATFORM_SUPPORTS_TILE_3 == 1) && (PLATFORM_USES_TILE_3 == 1))
                      void main_tile3(
  
// c0
#if ((PLATFORM_SUPPORTS_TILE_0 == 1) && (PLATFORM_USES_TILE_0 == 1))
                      chanend c0
#define ARGS_STARTED
#endif

#if ((PLATFORM_SUPPORTS_TILE_1 == 1) && (PLATFORM_USES_TILE_1 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend c1
#define ARGS_STARTED
#endif


// c2
#if ((PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1))
#ifdef ARGS_STARTED
                      ,  
#endif
                      chanend c2
#endif

                      
// c3  
// channel c3  is loopback so it is never in the minimised argument set
                      );

#endif // ----------------- End tile 3 prototype --------------------------                 

#endif // MINIMISE_MAIN_TILE_ARGS




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
    
// c0
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif

// c1
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

// c2
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

// c3
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
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif
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
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif
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
#if (PLATFORM_SUPPORTS_TILE_2 == 1) && (PLATFORM_USES_TILE_2 == 1)
#ifdef ARGS_STARTED      
                          ,
#endif
                    c_t2_t3
#ifdef MINIMISE_MAIN_TILE_ARGS
#else
                           ,
#endif
#else
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null,
#endif
#endif
#ifndef MINIMISE_MAIN_TILE_ARGS
                    null
#endif
                    );
#endif // -------------------- End tile 3 usage -----------------------
  }

  return 0;
}

