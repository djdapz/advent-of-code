//
// Created by Devon D'Apuzzo on 12/8/22.
//

#ifndef CPP_TUTORIAL_DAY5_H
#define CPP_TUTORIAL_DAY5_H

#include "absl/memory/memory.h"
#include <stack>
#include <string>
#include <vector>

namespace AdventOfCode {

struct Command {
  int count;
  int startColumn;
  int endColumn;
  Command(int count, int startColumn, int endColumn);
};

class Day5 {
private:
  std::vector<std::vector<std::string>> input;

  void MakeCommands(const std::vector<std::vector<std::string>> &input);

public:
  Day5(std::vector<std::vector<std::string>> input);
  std::string Part1();
  std::string Part2();
  std::vector<std::unique_ptr<Command>> commands;
  std::vector<std::unique_ptr<std::stack<char>>> MakeCrates();
};

} // namespace AdventOfCode

#endif // CPP_TUTORIAL_DAY5_H
