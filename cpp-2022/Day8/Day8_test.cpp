//
// Created by Devon D'Apuzzo on 5/5/22.
//

#include "Day8.h"
#include <vector>

#include "gtest/gtest.h"

#include "input/input.h"
#include "parsing/parsing.h"
using std::vector;
namespace AdventOfCode {

TEST(Day8Test, TreeVisibleCount) {
  vector<std::vector<int>> input{};

  auto subject = Day8({{3, 0, 3, 7, 3},
                       {2, 5, 5, 1, 2},
                       {6, 5, 3, 3, 2},
                       {3, 3, 5, 4, 9},
                       {3, 5, 3, 9, 0}});
  int result = subject.Part1();
  EXPECT_EQ(result, 21);
}

TEST(Day8Test, TreeVisibleScores) {
  vector<std::vector<int>> input{};

  auto subject = Day8({{3, 0, 3, 7, 3},
                       {2, 5, 5, 1, 2},
                       {6, 5, 3, 3, 2},
                       {3, 3, 5, 4, 9},
                       {3, 5, 3, 9, 0}});
  int result = subject.ScoreTree(2, 1);
  EXPECT_EQ(result, 4);
}

TEST(Day8Test, TreeVisibleScores2) {
  vector<std::vector<int>> input{};

  auto subject = Day8({{3, 0, 3, 7, 3},
                       {2, 5, 5, 1, 2},
                       {6, 5, 3, 3, 2},
                       {3, 3, 5, 4, 9},
                       {3, 5, 3, 9, 0}});
  int result = subject.ScoreTree(2, 3);
  EXPECT_EQ(result, 8);
}

// TEST(Day8Test, TODO2) {
//   vector<std::vector<int>> input{};
//
//   auto subject = Day8(input);
//   int result = subject.Part2();
//   EXPECT_EQ("TODO", "WRITE TESTS");
// }

} // namespace AdventOfCode