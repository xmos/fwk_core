
if((${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS3A) OR (${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS2A))
    ## Create library target
    add_library(lib_random STATIC)
    target_sources(lib_random
        PRIVATE
            lib_random/lib_random/src/random.xc
            lib_random/lib_random/src/random_init.c
    )
    target_include_directories(lib_random
        PUBLIC
            lib_random/lib_random/api
    )
endif()
