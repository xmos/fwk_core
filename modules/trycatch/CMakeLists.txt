
if((${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS3A) OR (${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS2A))
    ## cmake doesn't recognize .S files as assembly by default
    set_source_files_properties(lib_trycatch/lib_trycatch/src/trycatch_asm.S PROPERTIES LANGUAGE ASM)

    ## Create library target
    add_library(lib_trycatch STATIC)
    target_sources(lib_trycatch
        PRIVATE
            lib_trycatch/lib_trycatch/src/trycatch_asm.S
            lib_trycatch/lib_trycatch/src/trycatch.c
    )
    target_include_directories(lib_trycatch
        PUBLIC
            lib_trycatch/lib_trycatch/src
            lib_trycatch/lib_trycatch/api
    )
endif()
