
if((${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS3A) OR (${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS2A))
    ## Create library target
    add_library(framework_core_otpinfo STATIC)
    target_sources(framework_core_otpinfo
        PRIVATE
            lib_otpinfo/lib_otpinfo/src/otp_board_info.xc
    )
    target_include_directories(framework_core_otpinfo
        PUBLIC
            lib_otpinfo/lib_otpinfo/api
    )

    ## Create an alias
    add_library(core::otpinfo ALIAS framework_core_otpinfo)
endif()
