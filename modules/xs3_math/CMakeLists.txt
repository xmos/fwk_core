add_subdirectory(lib_xs3_math/lib_xcore_math)

## Create an alias
add_library(core::xs3_math ALIAS lib_xcore_math)
