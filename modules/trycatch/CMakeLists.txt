
if((${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS3A) OR (${CMAKE_SYSTEM_NAME} STREQUAL XCORE_XS2A))
    ## cmake doesn't recognize .S files as assembly by default
    set_source_files_properties(lib_trycatch/lib_trycatch/src/trycatch_asm.S PROPERTIES LANGUAGE ASM)

    ## Create library target
    add_library(framework_core_trycatch STATIC)
    target_sources(framework_core_trycatch
        PRIVATE
            lib_trycatch/lib_trycatch/src/trycatch_asm.S
            lib_trycatch/lib_trycatch/src/trycatch.c
    )
    target_include_directories(framework_core_trycatch
        PUBLIC
            lib_trycatch/lib_trycatch/src
            lib_trycatch/lib_trycatch/api
    )

    ## Create an alias
    add_library(core::trycatch ALIAS framework_core_trycatch)
endif()
