cmake_minimum_required(VERSION 3.21)

## Disable in-source build.
if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
    message(FATAL_ERROR "In-source build is not allowed! Please specify a build folder.\n\tex:cmake -B build")
endif()

## Project declaration
project(framework_core)

## Enable languages for project
enable_language(CXX C ASM)

## Project options
option(FRAMEWORK_CORE_TESTS     "Enable framework_core tests"  OFF)

## Setup a framework root path
SET(FRAMEWORK_CORE_ROOT_PATH ${PROJECT_SOURCE_DIR}

## Add framework libraries
add_subdirectory(clock_control)
add_subdirectory(experimental)
add_subdirectory(inferencing)
add_subdirectory(l2_cache)
add_subdirectory(otpinfo)
add_subdirectory(random)
add_subdirectory(xs3_math)

## Add targets for when this is the top level project
if(PROJECT_IS_TOP_LEVEL)
    include(examples/examples.cmake)
endif()

if(FRAMEWORK_CORE_TESTS)
    include(test/tests.cmake)
endif()
