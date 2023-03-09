## Add framework libraries
add_subdirectory(clock_control)
add_subdirectory(l2_cache)
add_subdirectory(legacy_compat)
add_subdirectory(multitile_support)
add_subdirectory(otpinfo)
add_subdirectory(random)
add_subdirectory(trycatch)
add_subdirectory(utils)
add_subdirectory(xcore_math)

if((${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS3A) OR (${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS2A))
    ## Create an aggregate of framework_core general libraries
    add_library(framework_core_general INTERFACE)
    target_link_libraries(framework_core_general
        INTERFACE
            framework_core_clock_control
            framework_core_legacy_compat
            framework_core_utils
            lib_l2_cache
            lib_otpinfo
            lib_random
            lib_trycatch
            lib_xcore_math
    )
    add_library(core::general ALIAS framework_core_general)

    ## Create an aggregate of all framework_io libraries
    add_library(framework_core_all INTERFACE)
    target_link_libraries(framework_core_all
        INTERFACE
            core::general
    )
    add_library(core::all ALIAS framework_core_all)
endif()
