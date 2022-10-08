# CMake Packs

A set of [CMake Package](https://cmake.org/cmake/help/latest/manual/cmake-packages.7.html) and modules for [CMake](https://cmake.org/).

## Usage

### FindDuktape.cmake
``` cmake
#CMakePacks
include(FetchContent)
FetchContent_Declare(
    CMakePacks
    GIT_REPOSITORY https://github.com/robloach/CMakePacks.git
    GIT_TAG v0.0.1
)
FetchContent_GetProperties(CMakePacks)
if (NOT CMakePacks_POPULATED)
    set(FETCHCONTENT_QUIET NO)
    FetchContent_Populate(CMakePacks)
    add_subdirectory(${CMakePacks_SOURCE_DIR} ${CMakePacks_BINARY_DIR})
endif()
```

## Packages

- duktape
- raylib

## License

[MIT](LICENSE)
