//
// Created by Devon D'Apuzzo on 5/5/22.
//

#include "day2.h"
#include <vector>

#include "gtest/gtest.h"

#include "input/input.h"
#include "parsing/parsing.h"
using std::vector;
namespace AdventOfCode {

TEST(Day2Test, GetsMaxWeight) {
  vector<std::string> input{"A Y", "B X", "C Z"};

  auto subject = Day2(input);
  int result = subject.Part1();
  EXPECT_EQ(result, 15);
}

} // namespace AdventOfCode