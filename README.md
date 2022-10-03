# Duktape CMake

[CMake](https://cmake.org/) definition file for [Duktape](https://duktape.org/).

## Usage

### FindDuktape.cmake
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
```

### CMakeLists.txt
``` cmake
# Add the CMake Modules Path
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR})
find_package(Duktake)

# Application
add_executable(MyApp main.c)
target_link_libraries(MyApp PUBLIC duktape)
```

# License

[MIT](LICENSE)
