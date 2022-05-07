//
// Created by Devon D'Apuzzo on 5/5/22.
//

#include "day1.h"
#include <vector>

#include "gtest/gtest.h"

#include "input/input.h"
#include "parsing/parsing.h"

namespace AdventOfCode {

TEST(Day1Test, TellMeDaysOfIncrease) {
  std::vector<int> input{1, 2, 3, 2};

  auto subject = Day1(input);
  int result = subject.Part1();
  EXPECT_EQ(result, 2);
}

TEST(Day1Test, WorksForSolution) {
  auto day1Input = Parsing::InputToInts(Input::Day1());
  auto subject = Day1(day1Input);
  auto result = subject.Part1();
  EXPECT_EQ(result, 1553);
}

TEST(Day1Test, SlidingWindow) {
  std::vector<int> input{199, 200, 208, 210, 200, 207, 240, 269, 260, 263};

  auto subject = Day1(input);
  int result = subject.Part2();
  EXPECT_EQ(result, 5);
}
} // namespace AdventOfCode