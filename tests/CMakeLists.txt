find_package(Catch2 REQUIRED)

add_executable(test_helloworld test_helloworld.cpp)
target_link_libraries(test_helloworld PRIVATE hellolib Catch2::Catch2)
add_test(NAME test_helloworld COMMAND $<TARGET_FILE:test_helloworld>) # Dummy test target
install(TARGETS test_helloworld RUNTIME DESTINATION bin)
