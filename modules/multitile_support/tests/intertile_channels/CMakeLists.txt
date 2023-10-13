#**********************
# Gather Sources
#**********************
file(GLOB_RECURSE TEST_SOURCES ${CMAKE_CURRENT_LIST_DIR}/src/*.c )
set(APP_INCLUDES
    ${CMAKE_CURRENT_LIST_DIR}/src
)

#**********************
# Flags
#**********************
set(APP_COMPILER_FLAGS
    -Os
    -g
    -report
    -fxscope
    -mcmodel=large
    -Wno-xcore-fptrgroup
    ${CMAKE_CURRENT_LIST_DIR}/XCORE-AI-EXPLORER.xn
)
set(APP_COMPILE_DEFINITIONS
    DEBUG_PRINT_ENABLE=1
    PLATFORM_SUPPORTS_TILE_0=1
    PLATFORM_SUPPORTS_TILE_1=1
    PLATFORM_USES_TILE_0=1
    PLATFORM_USES_TILE_1=1
    MINIMISE_MAIN_TILE_ARGS
    XUD_CORE_CLOCK=600
)

set(APP_LINK_OPTIONS
    -lquadflash
    -report
    ${CMAKE_CURRENT_LIST_DIR}/XCORE-AI-EXPLORER.xn
)

#**********************
# Tile Targets
#**********************
add_executable(intertile_channel_test)
target_sources(intertile_channel_test PUBLIC ${TEST_SOURCES})
target_include_directories(intertile_channel_test PUBLIC ${APP_INCLUDES})
target_compile_definitions(intertile_channel_test PRIVATE ${APP_COMPILE_DEFINITIONS})
target_compile_options(intertile_channel_test PRIVATE ${APP_COMPILER_FLAGS})
target_link_libraries(intertile_channel_test PUBLIC core::general io::all framework_core_multitile_support)
target_link_options(intertile_channel_test PRIVATE ${APP_LINK_OPTIONS})


#**********************
# Create run and debug targets
#**********************
create_run_target(intertile_channel_test)
create_debug_target(intertile_channel_test)
