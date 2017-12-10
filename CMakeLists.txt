cmake_minimum_required (VERSION 2.8.11)
project(HELLO)

enable_testing(true)
add_executable(hellworld main.cpp)
add_test(NAME test-helloworld COMMAND $<TARGET_FILE:hellworld>) # Dummy test target
