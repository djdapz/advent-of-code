#include "Day4.h"
#include "absl/strings/ascii.h"
#include "absl/strings/numbers.h"
#include "absl/strings/str_split.h"
#include <string>
#include <vector>

using absl::SimpleAtoi;
using absl::string_view;
using std::vector;

namespace AdventOfCode {

class Assignment {
private:
  absl::uint128 start;
  absl::uint128 end;

public:
  Assignment(const string_view assignment) {
    vector<string_view> spots = absl::StrSplit(assignment, "-");

    SimpleAtoi(spots.at(0), &start);
    SimpleAtoi(spots.at(1), &end);
  }

  bool contains(const Assignment *a) {
    return this->start <= a->start && this->end >= a->end;
  }

  bool overlaps(const Assignment *a) {
    if (this->end < a->start || this->start > a->end) {
      return false;
    }

    return true;
  }
};

int Day4::Part1() const {
  int overlap = 0;
  for (auto assignment : assignments) {
    vector<string_view> elves = absl::StrSplit(assignment, ",");

    vector<string_view> elf1 = absl::StrSplit(elves.at(0), "-");
    vector<string_view> elf2 = absl::StrSplit(elves.at(1), "-");

    auto a1 = new Assignment(elves.at(0));
    auto a2 = new Assignment(elves.at(1));

    if (a1->contains(a2) || a2->contains(a1)) {
      overlap++;
    }
  }

  return overlap;
}
int Day4::Part2() const {
  int overlap = 0;
  for (auto assignment : assignments) {
    vector<string_view> elves = absl::StrSplit(assignment, ",");

    vector<string_view> elf1 = absl::StrSplit(elves.at(0), "-");
    vector<string_view> elf2 = absl::StrSplit(elves.at(1), "-");

    auto a1 = new Assignment(elves.at(0));
    auto a2 = new Assignment(elves.at(1));

    if (a1->overlaps(a2) || a2->overlaps(a1)) {
      overlap++;
    }
  }

  return overlap;
}

} // namespace AdventOfCode