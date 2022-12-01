//
// Created by Devon D'Apuzzo on 5/5/22.
//

#include "day1.h"
#include <algorithm>
#include <utility>
#include <vector>

int sum_vector(std::vector<int> v) {
  int sum = 0;
  std::for_each(v.begin(), v.end(), [&](int n) { sum += n; });
  return sum;
}

int Day1::Part1() { return caloriesByElf.at(0); }

int Day1::Part2() {
  return caloriesByElf.at(0) + caloriesByElf.at(1) + caloriesByElf.at(2);
}

Day1::Day1(std::vector<std::vector<int>> calories)
    : caloriesByElf(calcCaloriesByElf(std::move(calories))) {}

std::vector<int>
Day1::calcCaloriesByElf(std::vector<std::vector<int>> calories) {
  std::vector<int> calsByElf{};
  std::transform(calories.begin(), calories.end(),
                 std::back_inserter(calsByElf), sum_vector);

  std::sort(calsByElf.begin(), calsByElf.end(), std::greater<int>());

  return calsByElf;
}
