//
// Created by Devon D'Apuzzo on 12/6/22.
//

#ifndef CPP_TUTORIAL_DAY3_H
#define CPP_TUTORIAL_DAY3_H

#include <string>
#include <vector>

namespace AdventOfCode {

class Day3 {
private:
  std::vector<std::string> backpackContents;

public:
  Day3(std::vector<std::string> backpackContents)
      : backpackContents(backpackContents) {}
  int Part1() const;
  int Part2() const;
  static int PriorityOf(char c);
  int GetPriorityOfGroupsBadge(int offset) const;
};

} // namespace AdventOfCode

#endif // CPP_TUTORIAL_DAY3_H
