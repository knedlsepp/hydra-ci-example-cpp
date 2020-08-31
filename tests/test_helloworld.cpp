#define CATCH_CONFIG_MAIN
#define CATCH_CONFIG_ENABLE_BENCHMARKING

#include <hellolib/hello.hpp>

#include <catch2/catch.hpp>
#include <iostream>


TEST_CASE("Helloing the world is possible", "[Hello]") {
  SECTION("Six is equal to six") { CHECK(hello() == "Hello, world!"); }

  BENCHMARK("Hello") { return hello(); };
}