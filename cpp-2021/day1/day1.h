//
// Created by Devon D'Apuzzo on 5/5/22.
//

#ifndef CPP_TUTORIAL_DAY1_H
#define CPP_TUTORIAL_DAY1_H

#include <vector>

class Day1 {
private:
  const std::vector<int> days;

public:
  Day1(const std::vector<int> &days);
  int Part1();
  int Part2();
};

#endif // CPP_TUTORIAL_DAY1_H
