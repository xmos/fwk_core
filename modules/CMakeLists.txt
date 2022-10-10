## Add framework libraries
add_subdirectory(clock_control)
add_subdirectory(experimental)
add_subdirectory(inferencing)
add_subdirectory(l2_cache)
add_subdirectory(legacy_compat)
add_subdirectory(multitile_support)
add_subdirectory(otpinfo)
add_subdirectory(random)
add_subdirectory(trycatch)
add_subdirectory(utils)
add_subdirectory(xs3_math)

if((${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS3A) OR (${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS2A))
    ## Create an aggregate of framework_core general libraries
    add_library(framework_core_general INTERFACE)
    target_link_libraries(framework_core_general
        INTERFACE
            core::clock_control
            core::dsp_filters
            core::l2_cache
            core::legacy_compat
            core::otpinfo
            core::random
            core::trycatch
            core::utils
            core::xs3_math
    )
    add_library(core::general ALIAS framework_core_general)

    ## Create an aggregate of framework_core inferencing libraries
    add_library(core::lib_tflite_micro ALIAS inferencing_tflite_micro)

    ## Create an aggregate of all framework_io libraries
    add_library(framework_core_all INTERFACE)
    target_link_libraries(framework_core_all
        INTERFACE
            core::general
            core::lib_tflite_micro
    )
    add_library(core::all ALIAS framework_core_all)
endif()
