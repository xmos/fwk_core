
if((${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS3A) OR (${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS2A))
    ## Create library target
    add_library(framework_core_multitile_support INTERFACE)
    target_sources(framework_core_multitile_support
        INTERFACE
            src/soc_intertile_channel.c
            src/xscope_host_support.c
            src/tile_map_defaults.c
            src/tile_map.xc
    )
    target_include_directories(framework_core_multitile_support
        INTERFACE
            api
    )
endif()
