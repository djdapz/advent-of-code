//
// Created by Devon D'Apuzzo on 5/5/22.
//

#include "parsing.h"
#include <string>
#include <vector>

#include "gtest/gtest.h"

using AdventOfCode::Parsing::InputToInts;

TEST(ParsingTest, ParsesOneLine) {
  std::string input = R"(
                      1
                      )";

  auto result = InputToInts(input);

  auto expected = std::vector<int>();
  expected.push_back(1);

  EXPECT_EQ(result, expected);
}

TEST(ParsingTest, ParsesMultiLine) {
  std::string input = R"(
1
2
3
4
                      )";

  auto result = InputToInts(input);

  std::vector<int> expected{1, 2, 3, 4};

  EXPECT_EQ(result, expected);
}