//
// Created by Devon D'Apuzzo on 5/5/22.
//

#include "day1.h"
#include <vector>

int Day1::Part1() {
  int count = 0;
  int prev = INT16_MAX;
  for (int i = 0; i < days.size(); ++i) {
    if (days[i] > prev) {
      count++;
    }
    prev = days[i];
  }
  return count;
}

int Day1::Part2() {
  int count = 0;
  int prev = days[0] + days[1] + days[2];

  for (int i = 3; i < days.size(); ++i) {
    int next = prev - days[i - 3] + days[i];

    if (next > prev) {
      count++;
    }
    prev = next;
  }
  return count;
}
Day1::Day1(const std::vector<int> &days) : days(days) {}
