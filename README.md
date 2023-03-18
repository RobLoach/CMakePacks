# CMake Packs

A set of [CMake Package](https://cmake.org/cmake/help/latest/manual/cmake-packages.7.html) and modules for [CMake](https://cmake.org/).

## Usage

Add the CMake definition files to your project by either copying them into your CMake Modules folder, or using FetchContent...

``` cmake
#CMakePacks
include(FetchContent)
FetchContent_Declare(
    cmakepacks
    GIT_REPOSITORY https://github.com/robloach/cmakepacks.git
    GIT_TAG v0.0.1
)
FetchContent_GetProperties(cmakepacks)
if (NOT cmakepacks_POPULATED)
    set(FETCHCONTENT_QUIET NO)
    FetchContent_Populate(cmakepacks)
    add_subdirectory(${cmakepacks_SOURCE_DIR} ${cmakepacks_BINARY_DIR})
endif()
```

Afterwards, you'll be able to bring in the dependencies with `find_package(raylib)`.


## Packages

- [`duktape`](https://github.com/svaarala/duktape)
- [`raylib`](https://raylib.com)
- [`umka`](https://github.com/vtereshkov/umka-lang)

## License

[MIT](LICENSE)
