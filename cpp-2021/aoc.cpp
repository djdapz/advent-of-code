//
// Created by Devon D'Apuzzo on 5/5/22.
//
#include <iostream>

#include "aoc.h"
#include "day1/day1.h"
#include "input/input.h"
#include "parsing/parsing.h"

namespace AdventOfCode {

using Parsing::InputToInts;

void Run() {

  const auto day1Input = InputToInts(Input::Day1());
  Day1 day1 = Day1(day1Input);
  int i = day1.Part1();
  int part2 = day1.Part2();
  std::cout << "Hello to Advent of Code 2021 C++" << std::endl;
  std::cout << "Day1" << std::endl;
  std::cout << "  Part1: " << i << std::endl;
  std::cout << "  Part2: " << part2 << std::endl;
}
} // namespace AdventOfCode