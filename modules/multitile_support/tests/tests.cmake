if(${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS3A)
    #include(${CMAKE_CURRENT_LIST_DIR}/tile_map_defines/tests.cmake)
    include(${CMAKE_CURRENT_LIST_DIR}/intertile_channels/CMakeLists.txt)
endif()
