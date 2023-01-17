
######
add_library(framework_core_dsp_filters STATIC)
target_sources(framework_core_dsp_filters
    PRIVATE
        src/dsp_filters.c
)
target_include_directories(framework_core_dsp_filters
    PUBLIC
        api
)
target_link_libraries(framework_core_dsp_filters
    PUBLIC
        lib_xcore_math
)
