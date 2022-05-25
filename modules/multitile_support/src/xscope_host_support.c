// Copyright 2022 XMOS LIMITED.
// This Software is subject to the terms of the XMOS Public Licence: Version 1.

#include <xcore/chanend.h>

#include "soc.h"

#if (XSCOPE_HOST_IO_ENABLED == 1)
__attribute__((weak))
void init_xscope_host_data_user_cb(chanend_t c_host)
{
    return;
}
#endif
