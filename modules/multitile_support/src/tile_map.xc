// This Software is subject to the terms of the XMOS Public Licence: Version 1.
// XMOS Public License: Version 1

#include "platform.h"

extern "C" {


#ifndef MINIMISE_MAIN_TILE_ARGS 



void main_tile0(chanend c0, chanend c1, chanend c2, chanend c3);
void main_tile1(chanend c0, chanend c1, chanend c2, chanend c3);
void main_tile2(chanend c0, chanend c1, chanend c2, chanend c3);
void main_tile3(chanend c0, chanend c1, chanend c2, chanend c3);


#else // MINIMISE_MAIN_TILE_ARGS defined



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

