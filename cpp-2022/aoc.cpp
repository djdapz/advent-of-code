//
// Created by Devon D'Apuzzo on 5/5/22.
//
#include <iostream>

#include "aoc.h"
#include "day1/day1.h"
#include "day2/day2.h"
#include "day3/Day3.h"
#include "input/input.h"
#include "parsing/parsing.h"

namespace AdventOfCode {

using Parsing::InputToInts;

void Run() {

  std::cout << "Hello to Advent of Code 2021 C++" << std::endl;
  const auto day1Input = Parsing::InputToGroupedInts(Input::Day1());
  Day1 day1 = Day1(day1Input);
  std::cout << "Day1" << std::endl;
  std::cout << "  Part1: " << day1.Part1() << std::endl;
  std::cout << "  Part2: " << day1.Part2() << std::endl;

  const std::vector<std::string> day2Input =
      Parsing::InputToStrings(Input::Day2());
  Day2 day2 = Day2(day2Input);
  std::cout << "Day2" << std::endl;
  std::cout << "  Part1: " << day2.Part1() << std::endl;
  std::cout << "  Part2: " << day2.Part2() << std::endl;

  const std::vector<std::string> day3Input =
      Parsing::InputToStrings(Input::Day3());
  Day3 day3 = Day3(day3Input);
  std::cout << "Day3" << std::endl;
  std::cout << "  Part1: " << day3.Part1() << std::endl;
  std::cout << "  Part2: " << day3.Part2() << std::endl;
}
} // namespace AdventOfCode