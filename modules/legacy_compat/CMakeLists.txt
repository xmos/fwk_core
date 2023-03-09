
if((${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS3A) OR (${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS2A))
    ## Create library target
    add_library(framework_core_legacy_compat INTERFACE)
    target_include_directories(framework_core_legacy_compat
        INTERFACE
            api
    )
    target_link_libraries(framework_core_legacy_compat
        INTERFACE
            framework_core_utils
    )
endif()
