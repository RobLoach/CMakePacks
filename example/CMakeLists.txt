add_executable(duktape_example
    duktape_example.c
)
target_link_libraries(duktape_example PUBLIC
    duktape
)