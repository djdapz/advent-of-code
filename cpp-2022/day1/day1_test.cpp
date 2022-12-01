//
// Created by Devon D'Apuzzo on 5/5/22.
//

#include "day1.h"
#include <vector>

#include "gtest/gtest.h"

#include "input/input.h"
#include "parsing/parsing.h"
using std::vector;
namespace AdventOfCode {

TEST(Day1Test, GetsMaxWeight) {
  vector<vector<int>> input{{1, 1, 1}, {2, 2, 2}};

  auto subject = Day1(input);
  int result = subject.Part1();
  EXPECT_EQ(result, 6);
}

TEST(Day1Test, SumsTop3Elements) {
  vector<vector<int>> input{{1, 1, 1}, {2, 2, 2}, {3, 3, 3}, {4, 4, 4}};

  auto subject = Day1(input);
  int result = subject.Part2();
  EXPECT_EQ(result, 6 + 9 + 12);
}

} // namespace AdventOfCode