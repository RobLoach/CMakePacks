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

### CMakeLists.txt
``` cmake
# Add the CMake Modules Path
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR})
find_package(Duktake)

<<<<<<< HEAD
# Example of getting Duktape
find_package(Duktape)
=======
# Application
add_executable(MyApp main.c)
target_link_libraries(MyApp PUBLIC duktape)
>>>>>>> 9d445c7b7e0e4739dd6f04f6be61d50b39854001
```

# License

[MIT](LICENSE)
