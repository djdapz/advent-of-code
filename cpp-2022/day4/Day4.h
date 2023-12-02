//
// Created by Devon D'Apuzzo on 12/7/22.
//

#ifndef CPP_TUTORIAL_DAY4_H
#define CPP_TUTORIAL_DAY4_H

#include <string>
#include <vector>

namespace AdventOfCode {

class Day4 {
private:
  std::vector<std::string> assignments;

public:
  Day4(std::vector<std::string> assignments) : assignments(assignments) {}
  int Part1() const;
  int Part2() const;
};

} // namespace AdventOfCode

#endif // CPP_TUTORIAL_DAY4_H
