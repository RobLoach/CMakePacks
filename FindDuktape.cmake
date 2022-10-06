set(DUKTAPE_DEFAULT_VERSION "2.7.0")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Duktape DEFAULT_MSG)

# TODO: Fix version targeting
if (PACKAGE_FIND_VERSION)
    set(Duktape_VERSION "${PACKAGE_FIND_VERSION}")
else()
    set(Duktape_VERSION ${DUKTAPE_DEFAULT_VERSION})
endif()

# Options
option(DUKTAPE_STATIC "Duktape: Build as shared" FALSE)

# Duktape
include(FetchContent)
FetchContent_Declare(
   duktape
   GIT_REPOSITORY https://github.com/svaarala/duktape-releases.git
   GIT_TAG "v${Duktape_VERSION}"
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
set(DUKTAPE_SRC_DIR ${duktape_SOURCE_DIR}/src)
set(DUKTAPE_EXTRAS_DIR ${duktape_SOURCE_DIR}/extras)
set(DUKTAPE_SRC
    ${DUKTAPE_SRC_DIR}/duktape.c
)

# Library
if (DUKTAPE_STATIC)
    add_library(duktape SHARED ${DUKTAPE_SRC})
else()
    add_library(duktape STATIC ${DUKTAPE_SRC})
endif()

target_include_directories(duktape PUBLIC ${DUKTAPE_SRC_DIR})
target_include_directories(duktape PUBLIC ${DUKTAPE_EXTRAS_DIR})
target_link_libraries(duktape PUBLIC ${DUKTAPE_DEPENDENCIES})
