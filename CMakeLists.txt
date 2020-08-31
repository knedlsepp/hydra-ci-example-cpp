cmake_minimum_required(VERSION 3.12)
set(CMAKE_CXX_STANDARD 20)
project(helloworld)
option(BUILD_SHARED_LIBS "Build shared libraries instead of static ones" ON)

add_library(hellolib src/hello.cpp)
target_include_directories(hellolib PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
)
include(GNUInstallDirs)
install(TARGETS hellolib LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT lib)

enable_testing(true)
add_subdirectory(tests)
