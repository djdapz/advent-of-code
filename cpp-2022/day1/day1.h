//
// Created by Devon D'Apuzzo on 5/5/22.
//

#ifndef CPP_TUTORIAL_DAY1_H
#define CPP_TUTORIAL_DAY1_H

#include <vector>

class Day1 {
private:
  const std::vector<int> caloriesByElf{};
  static std::vector<int>
  calcCaloriesByElf(std::vector<std::vector<int>> vector1);

public:
  Day1(std::vector<std::vector<int>> days);
  int Part1();
  int Part2();
};

#endif // CPP_TUTORIAL_DAY1_H
