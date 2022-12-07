//
// Created by Devon D'Apuzzo on 5/5/22.
//

#ifndef CPP_TUTORIAL_DAY2_H
#define CPP_TUTORIAL_DAY2_H

#include <map>
#include <string>
#include <vector>

class Day2 {
private:
  std::vector<std::string> rounds;

public:
  Day2(std::vector<std::string> rounds) { this->rounds = std::move(rounds); }
  int Part1();
  int Part2();
  int runStrategy(const std::map<std::string, int> &strategy);
};

#endif // CPP_TUTORIAL_DAY2_H
