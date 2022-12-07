#include "Day3.h"
#include "absl/container/flat_hash_set.h"
#include "absl/strings/str_split.h"
#include <iostream>
#include <vector>

namespace AdventOfCode {

absl::flat_hash_set<char> BuildSetFromBackpack(const std::string &backpack) {
  absl::flat_hash_set<char> set;
  for (char letter : backpack) {
    set.insert(letter);
  }
  return set;
}

int PriorityOfBackpack(const std::string &backpack) {
  if (backpack.empty()) {
    return 0;
  }

  std::vector<std::string> comps =
      absl::StrSplit(backpack, absl::ByLength(backpack.size() / 2));

  auto set = BuildSetFromBackpack(comps.at(0));

  for (char letter : comps.at(1)) {
    if (set.contains(letter)) {
      return Day3::PriorityOf(letter);
    }
  }
  return 0;
}

int Day3::GetPriorityOfGroupsBadge(int offset) const {
  auto backpack1 = BuildSetFromBackpack(backpackContents.at(0 + offset));
  absl::flat_hash_set<char> overlapping;

  for (auto letter : backpackContents.at(1 + offset)) {
    if (backpack1.contains(letter)) {
      overlapping.insert(letter);
    }
  }

  for (auto letter : backpackContents.at(2 + offset)) {
    if (overlapping.contains(letter)) {
      return PriorityOf(letter);
    }
  }

  return 0;
}

int Day3::PriorityOf(char c) {
  if (islower(c)) {
    return int(c) - 97 + 1;
  }
  return int(c) - 65 + 27;
}

int Day3::Part1() const {
  int total = 0;
  for (auto backpack : backpackContents) {
    total += PriorityOfBackpack(backpack);
  }
  return total;
}
int Day3::Part2() const {
  int total = 0;
  for (int i = 0; i < backpackContents.size() - 2; i += 3) {
    total += GetPriorityOfGroupsBadge(i);
  }
  return total;
}

} // namespace AdventOfCode