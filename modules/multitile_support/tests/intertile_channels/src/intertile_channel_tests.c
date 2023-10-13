/* System headers */
#include <platform.h>
#include <xcore/channel.h>
#include <stdio.h>
#include <soc_channel.h>


void main_tile0(chanend_t c)
{

  // Customer tile 0 application can use c to communicate with tile 1
  printf("Tile 0: Bare metal application, tile operational\n");

  int tile_0_tx = 101;
  chan_out_word(c, tile_0_tx);
  printf("Tile 0: Sent %d to Tile 1\n",tile_0_tx);

  int tile_0_rx = chan_in_word(c);
  printf("Tile 0: Recieved %d from Tile 1\n",tile_0_rx);
 
  printf("Tile 0: Establishing new channels between the tiles\n");
  printf("Tile 0: Existing channel is 0x%08X -> 0x%08X\n", c, chanend_get_dest(c));
 
  
  chanend_t c_new; 
  c_new = soc_channel_establish(c, soc_channel_inout);

  printf("Tile 0: New channel is 0x%08X -> 0x%08X\n", c_new, chanend_get_dest(c_new));
  
  tile_0_tx = 102;
  chan_out_word(c_new, tile_0_tx);
  printf("Tile 0: Sent %d to Tile 1\n",tile_0_tx);

  tile_0_rx = chan_in_word(c_new);
  printf("Tile 0: Recieved %d from Tile 1\n",tile_0_rx);
}


void main_tile1(chanend_t c)
{

  // Customer tile 1 application can use c to communicate with tile 0
  printf("Tile 1: Bare metal application, tile operational\n");

  int tile_1_rx = chan_in_word(c);
  printf("Tile 1: Recieved %d from Tile 0\n",tile_1_rx);

  int tile_1_tx = 42;
  chan_out_word(c, tile_1_tx);
  printf("Tile 1: Sent %d to Tile 0\n",tile_1_tx);
  
  printf("Tile 1: Establishing new channels between the tiles\n");
  printf("Tile 1: Existing channel is 0x%08X -> 0x%08X\n", c, chanend_get_dest(c));

  chanend_t c_new; 
  c_new = soc_channel_establish(c, soc_channel_inout);

  printf("Tile 1: New channel is 0x%08X -> 0x%08X\n", c_new, chanend_get_dest(c_new));  
  
  tile_1_rx = chan_in_word(c_new);
  printf("Tile 1: Recieved %d from Tile 0 on the new channel\n",tile_1_rx);

  tile_1_tx = 24;
  chan_out_word(c_new, tile_1_tx);
  printf("Tile 1: Sent %d to Tile 0 on the new channel\n",tile_1_tx);

}




