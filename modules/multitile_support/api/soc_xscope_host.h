// Copyright 2022 XMOS LIMITED.
// This Software is subject to the terms of the XMOS Public Licence: Version 1.

#ifndef SOC_XSCOPE_HOST_H_
#define SOC_XSCOPE_HOST_H_

/**
 * User callback to handle the user channel end to talk to xscope_host_data()
 *
 * Note: Will default to run on tile 0 unless XSCOPE_HOST_IO_TILE is defined
 */
void init_xscope_host_data_user_cb(chanend_t c_host);

#endif /* SOC_XSCOPE_HOST_H_ */
