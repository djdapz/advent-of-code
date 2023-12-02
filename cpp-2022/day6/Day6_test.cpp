//
// Created by Devon D'Apuzzo on 5/5/22.
//

#include "Day6.h"
#include <vector>

#include "gtest/gtest.h"

#include "input/input.h"
#include "parsing/parsing.h"
using std::vector;
namespace AdventOfCode {

TEST(Day6Test, FindFirstWindowOf4NonRepeatingElements) {
  EXPECT_EQ(Day6("mjqjpqmgbljsphdztnvjfqwrcgsmlb").Part1(), 7);
}

TEST(Day6Test, TODO2) {
  std::string input = "hi";

  auto subject = Day6(input);
  int result = subject.Part2();
  EXPECT_EQ("TODO", "WRITE TESTS");
}

} // namespace AdventOfCode