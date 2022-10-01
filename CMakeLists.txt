cmake_minimum_required(VERSION 3.11)
project(duktape
    DESCRIPTION "Duktape: Embeddable Javascript Engine"
    HOMEPAGE_URL "https://duktape.org/"
    VERSION 2.7.0
    LANGUAGES C
)

# Options
if ("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_CURRENT_SOURCE_DIR}")
    set(DUKTAPE_IS_MAIN TRUE)
else()
    set(DUKTAPE_IS_MAIN FALSE)
endif()
option(DUKTAPE_BUILD_EXAMPLE "Duktape Example" ${DUKTAPE_IS_MAIN})

# Duktape
include(FetchContent)
FetchContent_Declare(
   duktape
   GIT_REPOSITORY https://github.com/svaarala/duktape-releases.git
   GIT_TAG "v${PROJECT_VERSION}"
)
FetchContent_MakeAvailable(duktape)

# Dependencies
include(CheckLibraryExists)

# Dependency: Math
check_library_exists(m cos "" HAVE_LIB_M)
if (HAVE_LIB_M)
    set(DUKTAPE_DEPENDENCIES ${EXTRA_LIBS} m)
endif()

# Sources
set(DUKTAPE_SRC
    ${duktape_SOURCE_DIR}/src/duktape.c
)

# Library
add_library(duktape STATIC ${DUKTAPE_SRC})
target_include_directories(duktape PUBLIC ${duktape_SOURCE_DIR}/src)
target_include_directories(duktape PUBLIC ${duktape_SOURCE_DIR}/extras)
target_link_libraries(duktape PUBLIC ${DUKTAPE_DEPENDENCIES})

# Examples
if (DUKTAPE_BUILD_EXAMPLE)
    add_subdirectory(example)
endif()
