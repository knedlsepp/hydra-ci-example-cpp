cmake_minimum_required(VERSION 3.12)
project(helloworld)

add_library(hellolib SHARED src/hello.cpp)
target_include_directories(hellolib PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
)
include(GNUInstallDirs)
install(TARGETS hellolib LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT lib)

enable_testing(true)
add_subdirectory(tests)
