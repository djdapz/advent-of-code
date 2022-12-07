//
// Created by Devon D'Apuzzo on 5/5/22.
//

#include "day2.h"

#include <algorithm>
#include <map>
#include <string>
#include <utility>
#include <vector>

// ABC = Elf
// XYZ = me
// A,X = Rock 1
// B,Y = Paper 2
// C,Z = Scissors 3
const std::map<std::string, int> handToScore = {
    {"A X", 4}, // Rock V Rock = 1 + 3 => 4
    {"A Y", 8}, // Rock v Paper =  2 + 6 => 8
    {"A Z", 3}, // Rock v Scissors = 3 + 0 => 3
    {"B X", 1}, // Paper v Rock = 1 + 0 => 1
    {"B Y", 5}, // Paper v Paper =  2 + 3 => 5
    {"B Z", 9}, // Paper v Scissors = 3 + 6 => 9
    {"C X", 7}, // Scissors v Rock = 1 + 6 => 7
    {"C Y", 2}, // Scissors v Paper =  2 + 0 => 2
    {"C Z", 6}, // Scissors v Scissors = 3 + 3 => 6
};

// ABC = Elf
// XYZ = Outcome
// X = lose, Y = draw, Z = win
// A,X = Rock 1
// B,Y = Paper 2
// C,Z = Scissors 3
const std::map<std::string, int> strategyScoring = {
    {"A X", 3}, // (L) Rock v Scissors = 3 + 0 => 3
    {"A Y", 4}, // (D) Rock v Rock = 1 + 3 => 4
    {"A Z", 8}, // (W) Rock v Paper = 2 + 6 => 8
    {"B X", 1}, // (L) Paper v Rock = 1 + 0 => 1
    {"B Y", 5}, // (D) Paper v Paper = 2 + 3 => 5
    {"B Z", 9}, // (W) Paper v Scissors = 3 + 6 => 9
    {"C X", 2}, // (L) Scissors v Paper = 2 + 0 => 2
    {"C Y", 6}, // (D) Scissors v Scissors = 3 + 3 => 6
    {"C Z", 7}, // (W) Scissors v Rock = 1 + 6 => 7
};

int Day2::runStrategy(const std::map<std::string, int> &strategy) {
  int score = 0;
  for (auto &round : rounds) {
    int roundScore = strategy.find(round)->second;
    score += roundScore;
  }
  return score;
}

int Day2::Part1() { return runStrategy(handToScore); }
int Day2::Part2() { return runStrategy(strategyScoring); }
