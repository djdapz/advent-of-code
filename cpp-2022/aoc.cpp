//
// Created by Devon D'Apuzzo on 5/5/22.
//
#include <iostream>

#include "Day7/Day7.h"
#include "Day8/Day8.h"
#include "Day9/Day9.h"
#include "aoc.h"
#include "day1/day1.h"
#include "day2/day2.h"
#include "day3/Day3.h"
#include "day4/Day4.h"
#include "day5/Day5.h"
#include "day6/Day6.h"
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

  const std::vector<std::string> day4Input =
      Parsing::InputToStrings(Input::Day4());
  Day4 day4 = Day4(day4Input);
  std::cout << "Day4" << std::endl;
  std::cout << "  Part1: " << day4.Part1() << std::endl;
  std::cout << "  Part2: " << day4.Part2() << std::endl;

  const std::vector<std::vector<std::string>> day5Input =
      Parsing::InputToGroupedStrings(Input::Day5());
  Day5 day5 = Day5(day5Input);
  std::cout << "Day5" << std::endl;
  std::cout << "  Part1: " << day5.Part1() << std::endl;
  std::cout << "  Part2: " << day5.Part2() << std::endl;

  Day6 day6 = Day6(Input::Day6());
  std::cout << "Day6" << std::endl;
  std::cout << "  Part1: " << day6.Part1() << std::endl;
  std::cout << "  Part2: " << day6.Part2() << std::endl;

  const std::vector<std::string> day7Input =
      Parsing::InputToStrings(Input::Day7());
  Day7 day7 = Day7(day7Input);
  std::cout << "Day7" << std::endl;
  std::cout << "  Part1: " << day7.Part1() << std::endl;
  std::cout << "  Part2: " << day7.Part2() << std::endl;

  Day8 day8 = Day8(Parsing::InputToIntListsNoSeparator(Input::Day8()));
  std::cout << "Day8" << std::endl;
  std::cout << "  Part1: " << day8.Part1() << std::endl;
  std::cout << "  Part2: " << day8.Part2() << std::endl;

  Day9 day9 = Day9(Parsing::InputToStrings(Input::Day9()));
  std::cout << "Day9" << std::endl;
  std::cout << "  Part1: " << day9.Part1() << std::endl;
  std::cout << "  Part2: " << day9.Part2() << std::endl;

}
} // namespace AdventOfCode