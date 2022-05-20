
if((${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS3A) OR (${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS2A))
    ## Create library target
    add_library(framework_core_random STATIC)
    target_sources(framework_core_random
        PRIVATE
            lib_random/lib_random/src/random.xc
            lib_random/lib_random/src/random_init.c
    )
    target_include_directories(framework_core_random
        PUBLIC
            lib_random/lib_random/api
    )

    ## Create an alias
    add_library(core::random ALIAS framework_core_random)
endif()
