//
// Created by Devon D'Apuzzo on 5/5/22.
//

#include "Day3.h"
#include <vector>

#include "gtest/gtest.h"

#include "input/input.h"
#include "parsing/parsing.h"
using std::vector;
namespace AdventOfCode {

TEST(Day3Test, ShouldIdentifyLowercasePAsMostCommonLetter) {
  vector<std::string> input{"vJrwpWtwJgWrhcsFMMfFFhFp"};

  auto subject = Day3(input);
  int result = subject.Part1();
  EXPECT_EQ(result, 16);
}

TEST(Day3Test, ShouldIdentifyUppercasePAsMostCommonLetter) {
  vector<std::string> input{"vJrwPWtwJgWrhcsFMMfFFhFP"};

  auto subject = Day3(input);
  int result = subject.Part1();
  EXPECT_EQ(result, 42);
}

TEST(Day3Test, ShouldSumUpAllThePriorities) {
  vector<std::string> input{
      "vJrwpWtwJgWrhcsFMMfFFhFp", "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
      "PmmdzqPrVvPwwTWBwg",       "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
      "ttgJtRGJQctTZtZT",         "CrZsJsPPZsGzwwsLwLmpwMDw"};

  auto subject = Day3(input);
  int result = subject.Part1();
  EXPECT_EQ(result, 157);
}

TEST(Day3Test, FindsCommonElementBetweenThreeBackpacks) {
  vector<std::string> input{
      "vJrwpWtwJgWrhcsFMMfFFhFp",
      "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
      "PmmdzqPrVvPwwTWBwg",
  };

  auto subject = Day3(input);
  int result = subject.Part2();
  EXPECT_EQ(result, Day3::PriorityOf('r'));
}

TEST(Day3Test, FindsPriorityOfEachGroupsBadges) {
  vector<std::string> input{
      "vJrwpWtwJgWrhcsFMMfFFhFp", "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
      "PmmdzqPrVvPwwTWBwg",       "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
      "ttgJtRGJQctTZtZT",         "CrZsJsPPZsGzwwsLwLmpwMDw",
  };

  auto subject = Day3(input);
  int result = subject.Part2();
  int expected = Day3::PriorityOf('r') + Day3::PriorityOf('Z');
  EXPECT_EQ(result, expected);
}

TEST(Day3Test, PriorityOfWorks) {
  EXPECT_EQ(16, Day3::PriorityOf('p'));
  EXPECT_EQ(38, Day3::PriorityOf('L'));
  EXPECT_EQ(42, Day3::PriorityOf('P'));
  EXPECT_EQ(22, Day3::PriorityOf('v'));
  EXPECT_EQ(20, Day3::PriorityOf('t'));
  EXPECT_EQ(19, Day3::PriorityOf('s'));
}

} // namespace AdventOfCode