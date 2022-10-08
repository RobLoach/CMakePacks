find_package(umka)

add_executable(umka_example
    umka_example.c
)
target_link_libraries(umka_example PUBLIC
    umka
)