//
// Created by Devon D'Apuzzo on 5/5/22.
//

#include "Day5.h"
#include "gtest/gtest.h"
#include <stack>
#include <vector>

#include "input/input.h"
#include "parsing/parsing.h"
using std::vector;
namespace AdventOfCode {

char pop_value(std::unique_ptr<std::stack<char>> &stack) {
  auto v = std::move(stack->top());
  stack->pop();
  return v;
}

TEST(Day5Test, ParseCrates) {
  std::vector<std::vector<std::string>> input{{
                                                  "[D]        ",
                                                  "[N] [C]    ",
                                                  "[Z] [M] [P]",
                                                  " 1   2   3 ",
                                              },
                                              {}};

  auto day = absl::make_unique<Day5>(Day5(input));
  auto stacks = day->MakeCrates();
  EXPECT_EQ(stacks.size(), 3);

  //  auto s1 = stacks.at(0);

  EXPECT_EQ(stacks.at(0)->size(), 3);
  EXPECT_EQ(pop_value(stacks.at(0)), 'D');
  EXPECT_EQ(pop_value(stacks.at(0)), 'N');
  EXPECT_EQ(pop_value(stacks.at(0)), 'Z');

  EXPECT_EQ(stacks.at(1)->size(), 2);
  EXPECT_EQ(pop_value(stacks.at(1)), 'C');
  EXPECT_EQ(pop_value(stacks.at(1)), 'M');

  EXPECT_EQ(stacks.at(2)->size(), 1);
  EXPECT_EQ(pop_value(stacks.at(2)), 'P');
}

TEST(Day5Test, ParsesCommands) {
  std::vector<std::vector<std::string>> input{
      {
          "[D]        ",
          "[N] [C]    ",
          "[Z] [M] [P]",
          " 1   2   3 ",
      },
      {"move 1 from 2 to 1", "move 3 from 1 to 3", "move 2 from 2 to 1",
       "move 1 from 1 to 2"}};

  auto day = absl::make_unique<Day5>(Day5(input));
  auto &commands = day->commands;
  EXPECT_EQ(commands.size(), 4);
  EXPECT_EQ(commands.at(0)->count, 1);
  EXPECT_EQ(commands.at(0)->startColumn, 2);
  EXPECT_EQ(commands.at(0)->endColumn, 1);

  EXPECT_EQ(commands.at(1)->count, 3);
  EXPECT_EQ(commands.at(1)->startColumn, 1);
  EXPECT_EQ(commands.at(1)->endColumn, 3);
}

TEST(Day5Test, FiguesOutWordAfterRearanghing) {
  std::vector<std::vector<std::string>> input{{
                                                  "    [D]    ",
                                                  "[N] [C]    ",
                                                  "[Z] [M] [P]",
                                                  " 1   2   3 ",
                                              },
                                              {
                                                  "move 1 from 2 to 1",
                                                  "move 3 from 1 to 3",
                                                  "move 2 from 2 to 1",
                                                  "move 1 from 1 to 2",
                                              }};

  auto day = absl::make_unique<Day5>(Day5(input));
  auto part1 = day->Part1();
  EXPECT_EQ(part1, "CMZ");
}

TEST(Day5Test, FiguesOutWordAfterRearanghingAccordingTtV2) {
  std::vector<std::vector<std::string>> input{{
                                                  "    [D]    ",
                                                  "[N] [C]    ",
                                                  "[Z] [M] [P]",
                                                  " 1   2   3 ",
                                              },
                                              {
                                                  "move 1 from 2 to 1",
                                                  "move 3 from 1 to 3",
                                                  "move 2 from 2 to 1",
                                                  "move 1 from 1 to 2",
                                              }};

  auto day = absl::make_unique<Day5>(Day5(input));
  auto part2 = day->Part2();
  EXPECT_EQ(part2, "MCD");
}

} // namespace AdventOfCode