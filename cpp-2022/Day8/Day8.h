//
// Created by Devon D'Apuzzo on 12/12/22.
//

#ifndef CPP_TUTORIAL_DAY8_DAY8_H_
#define CPP_TUTORIAL_DAY8_DAY8_H_
#include "absl/container/flat_hash_set.h"

#include <boost/range/irange.hpp>
#include <boost/range/iterator_range.hpp>
#include <string>
#include <vector>

namespace AdventOfCode {

class Day8 {
private:
  std::vector<std::vector<int>> map;
  absl::flat_hash_set<std::string> visibleTrees;
  int maxY;
  int maxX;

public:
  Day8(std::vector<std::vector<int>> map) : map(map) {
    visibleTrees = {};
    maxY = map.size() - 1;
    maxX = map.at(0).size() - 1;
  }
  int Part1();
  int Part2() const;
  int CheckRowVisibility(boost::strided_integer_range<int> range,
                         bool vertical);
  int ScoreChunk(boost::strided_integer_range<int> range, bool vertical,
                 int treeHeight, int constantPosition) const;
  int ScoreTree(int x, int y) const;
};

} // namespace AdventOfCode

#endif // CPP_TUTORIAL_DAY8_DAY8_H_
