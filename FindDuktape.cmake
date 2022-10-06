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
   Duktape
   GIT_REPOSITORY https://github.com/svaarala/duktape-releases.git
   GIT_TAG "v${Duktape_VERSION}"
)
FetchContent_MakeAvailable(Duktape)

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
set(Duktape_INCLUDE_DIR ${duktape_SOURCE_DIR}/src)

# Library
if (DUKTAPE_STATIC)
    add_library(duktape SHARED ${DUKTAPE_SRC})
else()
    add_library(duktape STATIC ${DUKTAPE_SRC})
endif()

target_include_directories(duktape PUBLIC ${Duktape_INCLUDE_DIR})
target_link_libraries(duktape PUBLIC ${DUKTAPE_DEPENDENCIES})
