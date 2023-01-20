
if((${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS3A) OR (${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS2A))
    ## Create library target
    add_library(lib_otpinfo STATIC)
    target_sources(lib_otpinfo
        PRIVATE
            lib_otpinfo/lib_otpinfo/src/otp_board_info.xc
    )
    target_include_directories(lib_otpinfo
        PUBLIC
            lib_otpinfo/lib_otpinfo/api
    )
endif()
