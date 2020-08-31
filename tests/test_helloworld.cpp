#define CATCH_CONFIG_MAIN
#define CATCH_CONFIG_ENABLE_BENCHMARKING

#include <hellolib/hello.hpp>

#include <catch2/catch.hpp>
#include <iostream>
#include <vector>

double f(double in) { return 3.14 * in; }

std::vector<double> do_emplace(std::vector<double> as, std::vector<double> bs) {
  for (auto &b : bs) {
    as.emplace_back(f(b));
  }
  return as;
}

std::vector<double> do_emplace_reserve(std::vector<double> as,
                                       std::vector<double> bs) {
  as.reserve(as.size() + bs.size());
  for (const auto &b : bs) {
    as.emplace_back(f(b));
  }
  return as;
}

std::vector<double> do_transform(std::vector<double> as,
                                 std::vector<double> bs) {
  as.resize(as.size() + bs.size());
  std::transform(bs.cbegin(), bs.cend(), as.end() - bs.size(), f);
  return as;
}

std::vector<double> do_transform_back_inserter(std::vector<double> as,
                                               std::vector<double> bs) {
  std::transform(bs.cbegin(), bs.cend(), std::back_inserter(as), f);
  return as;
}

std::vector<double> do_transform_then_move(std::vector<double> as,
                                           std::vector<double> bs) {
  transform(bs.begin(), bs.end(), bs.begin(), f);
  std::move(bs.begin(), bs.end(), std::back_inserter(as));
  return as;
}

TEST_CASE("Helloing the world is possible", "[Hello]") {
  SECTION("Six is equal to six") { CHECK(hello() == "Hello, world!"); }

  BENCHMARK("Hello") { return hello(); };

  BENCHMARK("emplace") {
    auto as = std::vector<double>(100, 3.);
    auto bs = std::vector<double>(150, 2.);
    return do_emplace(as, bs);
  };
  BENCHMARK("reserve+emplace") {
    auto as = std::vector<double>(100, 3.);
    auto bs = std::vector<double>(150, 2.);
    return do_emplace_reserve(as, bs);
  };
  BENCHMARK("transform") {
    auto as = std::vector<double>(100, 3.);
    auto bs = std::vector<double>(150, 2.);
    return do_transform(as, bs);
  };
  BENCHMARK("transform back_inserter") {
    auto as = std::vector<double>(100, 3.);
    auto bs = std::vector<double>(150, 2.);
    return do_transform_back_inserter(as, bs);
  };
  BENCHMARK("transform then move") {
    auto as = std::vector<double>(100, 3.);
    auto bs = std::vector<double>(150, 2.);
    return do_transform_then_move(as, bs);
  };
}