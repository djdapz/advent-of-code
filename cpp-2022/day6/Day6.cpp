#include "Day6.h"
#include "absl/container/flat_hash_set.h"
#include <vector>
namespace AdventOfCode {

int Day6::Part1() const { return findNonRepeatingWindow(4); }
int Day6::findNonRepeatingWindow(int windowSize) const {
  for (int signalLoc = windowSize - 1; signalLoc < input.size(); signalLoc++) {
    absl::flat_hash_set<char> set;
    for (int i = 0; i < windowSize; i++) {
      const char letter = input.at(signalLoc - i);
      if (!set.contains(letter)) {
        set.insert(letter);
      }
    }
    if (set.size() == windowSize) {
      return signalLoc + 1;
    }
  }
  return -1;
}
int Day6::Part2() const { return findNonRepeatingWindow(14); }

} // namespace AdventOfCode