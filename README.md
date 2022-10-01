# Duktape CMake

[CMake](https://cmake.org/) definition file for [Duktape](https://duktape.org/).

## Usage

``` cmake
# Duktape
include(FetchContent)
FetchContent_Declare(
    duktapecmake
    GIT_REPOSITORY https://github.com/robloach/duktape-cmake.git
    GIT_TAG v2.7.0
)
FetchContent_GetProperties(duktapecmake)
if (NOT duktapecmake_POPULATED)
    set(FETCHCONTENT_QUIET NO)
    FetchContent_Populate(duktapecmake)
    add_subdirectory(${duktapecmake_SOURCE_DIR} ${duktapecmake_BINARY_DIR})
endif()

# Application
add_executable(MyProject main.c)
target_link_libraries(MyProject PUBLIC duktape)
```

# License

[MIT](LICENSE)
