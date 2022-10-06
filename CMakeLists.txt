cmake_minimum_required(VERSION 3.11)
project(CMakePacks
    DESCRIPTION "CMakePacks: A set of CMake packages"
    HOMEPAGE_URL "https://github.com/robloach/CMakePacks"
    VERSION 0.0.1
)

# Options
if ("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_CURRENT_SOURCE_DIR}")
    set(CMAKE_MODULES_IS_SOURCE_DIR TRUE)
else()
    set(CMAKE_MODULES_IS_SOURCE_DIR FALSE)
endif()
option(CMAKE_MODULES_BUILD_TESTS "${PROJECT_NAME}: Tests" ${CMAKE_MODULES_IS_SOURCE_DIR})

# Set the CMAKE_MODULE_PATH
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}")

# Testing
if (CMAKE_MODULES_BUILD_TESTS)
    add_subdirectory(tests)
endif()