//
// Created by Devon D'Apuzzo on 5/5/22.
//

#include "Day4.h"
#include <vector>

#include "gtest/gtest.h"

#include "input/input.h"
#include "parsing/parsing.h"
using std::vector;
namespace AdventOfCode {

TEST(Day4Test, TellsMeTheresFullContainment_LeftContainsRight) {
  vector<std::string> input{
      "1-5,3-4",
      "1-5,2-2",
  };

  auto subject = Day4(input);
  int result = subject.Part1();
  EXPECT_EQ(result, input.size());
}

TEST(Day4Test, TellsMeTheresFullContainment_RightContainsLeft) {
  vector<std::string> input{
      "3-4,1-5",
      "2-2,1-5",
  };

  auto subject = Day4(input);
  int result = subject.Part1();
  EXPECT_EQ(result, input.size());
}

TEST(Day4Test, TellsMeTheresNoOverlapWhenIntersecting) {
  vector<std::string> input{
      "2-5,1-4",
      "2-5,4-7",
  };

  auto subject = Day4(input);
  int result = subject.Part1();
  EXPECT_EQ(result, 0);
}

TEST(Day4Test, TellsMeDemoOk) {
  vector<std::string> input{
      "2-4,6-8", "2-3,4-5", "5-7,7-9", "2-8,3-7", "6-6,4-6", "2-6,4-8",
  };

  auto subject = Day4(input);
  int result = subject.Part1();
  EXPECT_EQ(result, 2);
}

TEST(Day4Test, TellsMeTheresNoOverlapWhenMissing) {
  vector<std::string> input{
      "2-5,7-9",
  };

  auto subject = Day4(input);
  int result = subject.Part1();
  EXPECT_EQ(result, 0);
}

TEST(Day4Test, ShouldBeSmallerThanWrongAnswer) {
  const std::vector<std::string> day4Input =
      Parsing::InputToStrings(Input::Day4());
  Day4 day4 = Day4(day4Input);
  ASSERT_LT(day4.Part1(), 611);
}

TEST(Day4Test, ShouldCountAllOverlaps) {
  vector<std::string> input{
      "2-5,7-9", "2-5,1-4", "2-5,4-7", "3-4,1-5",
      "2-2,1-5", "1-5,3-4", "1-5,2-2",
  };

  auto subject = Day4(input);
  int result = subject.Part2();
  EXPECT_EQ(result, 6);
}

} // namespace AdventOfCode