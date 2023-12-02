//
// Created by Devon D'Apuzzo on 12/12/22.
//

#ifndef CPP_TUTORIAL_DAY6_H
#define CPP_TUTORIAL_DAY6_H

#include <string>
#include <vector>

namespace AdventOfCode {

class Day6 {
private:
  std::string input;

public:
  Day6(std::string input) : input(input) {}
  int Part1() const;
  int Part2() const;
  int findNonRepeatingWindow(int windowSize) const;
};

} // namespace AdventOfCode

#endif // CPP_TUTORIAL_DAY6_H
