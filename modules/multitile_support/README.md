# Multi-Tile Support

This module provides support for starting an application on multiple tiles 
and communicating between those tiles. Support is provided for applications
using 2 or 4 tile XCore devices.     

## Starting a multi-tile application

Starting a multi-tile application on an XCore device requires that an
entry point be defined for each tile. These entry points replace the 
C standard main() entry point and are defined in tile_map.xc. In order 
to make communication possible between the tiles of an XCore device, 
the multi-tile entry points provide an XCore channel between each pair 
of tiles used. 

A set of weak implementations is provided for inclusion in your 
project by adding tile_map_defaults.c to your build sources. This allows
the application code for on tile to be compiled and tested without 
adding code for other tiles.

### Standard two tile configuration (e.g. XCore.ai)

Most applications will use a single XCore device with two tiles. In this 
case, the application the C code needs two entry points, and the 
prototypes (for tiles 0 and 1 respectively) will be:
  
    void main_tile0(chanend_t c);
    void main_tile1(chanend_t c);

The *chanend_t c* can be used on each tile to communicate with the other 
tile by making use of the functions defined in **<xcore/channel.h>**. Note
that any channel communication operation (e.g. *chan_out_word(c, 100);* )
on one tile must be matched by the opposite channel operation on the 
other tile (e.g. *int a = chan_in_word(c);* )

To achieve this configuration, the required preprocessor defines are:

    PLATFORM_SUPPORTS_TILE_0 = 1                                   
    PLATFORM_SUPPORTS_TILE_1 = 1                                   
    PLATFORM_USES_TILE_0 = 1                                   
    PLATFORM_USES_TILE_1 = 1 
    MINIMISE_MAIN_TILE_ARGS
                            
### Alternate configurations

In general, the code entry point prototype for each tile *X* which has both 
**PLATFORM_SUPPORTS_TILE_*X* = 1** and **PLATFORM_USES_TILE_*X* = 1**                                   
will be:
                                                                           
    void main_tile*X* (*ARGS*);

If **MINIMISE_MAIN_TILE_ARGS** is not defined, each tile has an entry point of 
the form:

    void main_tile*X*(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3);

where *X* is the tile number. The four arguments are channel ends that 
connect to each of the other tiles. In the above protoype, c*Y* indicates a 
channel to tile *Y*. Where a tile *Y* is not both supported and used, or the 
channel indicates a loopback (i.e. *X* == *Y*), that channel end argument is 
not a valid channel end, and must not be used.

If **MINIMISE_MAIN_TILE_ARGS** is defined, the entry point prototype for 
tiles defined as both supported and used will be as described above except
that invalid channel ends are removed. For example, if tiles 0, 2 and 3 are 
available and used and MINIMISE_MAIN_TILE_ARGS is defined, the entry point 
prototypes would be:

    void main_tile0(chanend c2, chanend c3);
    void main_tile2(chanend c0, chanend c3);
    void main_tile3(chanend c0, chanend c2);

When setting preprocessor defines, using the **MINIMISE_MAIN_TILE_ARGS** define
also means that **PLATFORM_SUPPORTS_TILE_*X*** and **PLATFORM_USES_TILE_*X***  
that are undefined are considered to be the equivalent to being set to 0.



## Inter-tile communication

The entry point prototypes provide a single channel for communication between
each tile pair by passing a dedicated channel end (*chanend_t*) to those two
tiles. In general, a chanend can only be used by a single thread running on a 
core of the tile to which the channel end was provided. To establish 
additional channels between tiles, this module provides an api which makes use 
of the single channel passed to the code entry point to establish additional
channels. 