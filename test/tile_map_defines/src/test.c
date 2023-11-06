/* System headers */
#include <platform.h>
#include <xcore/channel.h>
#include <stdio.h>


void main_tile0(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3)
{
  (void)c0; // Not used (channel would loop back to tile 0)
  (void)c2; // Tile 2 not available on this device
  (void)c3; // Tile 3 not available on this device

  // Customer tile 0 application can use c1 to communicate with tile 1
  printf("Bare metal application: Tile 0 operational\n");

  int tile_0_tx = 101;
  chan_out_word(c1, tile_0_tx);
  printf("Tile 0 sent %d to Tile 1\n",tile_0_tx);

  int tile_0_rx = chan_in_word(c1);
  printf("Tile 0 recieved %d from Tile 1\n",tile_0_rx);
}


void main_tile1(chanend_t c0, chanend_t c1, chanend_t c2, chanend_t c3)
{
  (void)c1; // Not used (channel would loop back to tile 1)
  (void)c2; // Tile 2 not available on this device
  (void)c3; // Tile 3 not available on this device

  // Customer tile 1 application can use c0 to communicate with tile 0
  printf("Bare metal application: Tile 1 operational\n");

  int tile_1_rx = chan_in_word(c0);
  printf("Tile 1 recieved %d from Tile 0\n",tile_1_rx);

  int tile_1_tx = 42;
  chan_out_word(c0, tile_1_tx);
  printf("Tile 1 sent %d to Tile 0\n",tile_1_tx);
}
