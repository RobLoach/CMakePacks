find_package(raylib)

add_executable(raylib_example
    raylib_example.c
)
target_link_libraries(raylib_example PUBLIC
    raylib
)