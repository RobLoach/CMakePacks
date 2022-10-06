cmake_minimum_required(VERSION 3.11)
project(example)

# Dependencies
include(FetchContent)
FetchContent_Declare(
    CMakePacks
    GIT_REPOSITORY https://github.com/robloach/CMakePacks.git
    GIT_TAG master
)
FetchContent_GetProperties(CMakePacks)
if (NOT CMakePacks_POPULATED)
    set(FETCHCONTENT_QUIET NO)
    FetchContent_Populate(CMakePacks)
    add_subdirectory(${CMakePacks_SOURCE_DIR} ${CMakePacks_BINARY_DIR})
endif()

# Library
find_package(duktape)
add_executable(MyApp
    main.c
)
target_link_libraries(MyApp PUBLIC
    duktape
)
