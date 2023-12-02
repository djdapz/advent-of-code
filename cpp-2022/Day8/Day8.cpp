#include "Day8.h"
#include "absl/container/flat_hash_set.h"
#include <boost/range/algorithm/reverse.hpp>
#include <boost/range/irange.hpp>
#include <boost/range/iterator_range.hpp>
#include <vector>

using std::to_string;

namespace AdventOfCode {

boost::strided_integer_range<int> range(int start, int end) {
  if (start > end) {
    return boost::irange(start, end, -1);
  } else {
    return boost::irange(start, end, 1);
  }
}

std::string MakeKey(int x, int y) {
  return "x=" + to_string(x) + ",y=" + to_string(y);
}

int Day8::Part1() {
  int count = 0;

  // TOP DOWN - 3
  count += CheckRowVisibility(range(0, maxX), true);
  count += CheckRowVisibility(range(maxX, 0), true);
  count += CheckRowVisibility(range(0, maxY), false);
  count += CheckRowVisibility(range(maxY, 0), false);

  return 4 + count;
}

int Day8::CheckRowVisibility(boost::strided_integer_range<int> range,
                             bool vertical) {
  int count = 0;
  int mainMax = vertical ? maxY : maxX;
  for (int mainAxis = 1; mainAxis < mainMax; mainAxis++) {
    int tallestSoFar = -1;
    for (int traversalAxis : range) {
      int x = vertical ? mainAxis : traversalAxis;
      int y = vertical ? traversalAxis : mainAxis;
      int currentTree = map.at(x).at(y);

      if (currentTree > tallestSoFar) {
        tallestSoFar = currentTree;
        if (!visibleTrees.contains(MakeKey(x, y))) {
          count++;
        }
        visibleTrees.insert(MakeKey(x, y));
      }
      if (currentTree == 9)
        break;
    }
  }
  return count;
}

int Day8::ScoreChunk(boost::strided_integer_range<int> range, bool vertical,
                     int treeHeight, int constantPosition) const {
  int score = 1;
  for (int i : range) {
    int currentHeight = vertical ? map.at(constantPosition).at(i)
                                 : map.at(i).at(constantPosition);
    if (currentHeight >= treeHeight) {
      return score;
    }
    score++;
  }
  return score;
}

int Day8::ScoreTree(int x, int y) const {

  int treeHeight = map.at(x).at(y);

  int up = y > 0 ? ScoreChunk(range(y - 1, 0), true, treeHeight, x) : 1;
  int down = y < maxY ? ScoreChunk(range(y + 1, maxY), true, treeHeight, x) : 1;
  int left = x > 0 ? ScoreChunk(range(x - 1, 0), false, treeHeight, y) : 1;
  int right =
      x < maxX ? ScoreChunk(range(x + 1, maxX), false, treeHeight, y) : 1;

  return up * down * left * right;
}

int Day8::Part2() const {
  int max = 0;
  for (int x : range(0, maxX)) {
    for (int y : range(0, maxY)) {
      int score = ScoreTree(x, y);
      if (score > max) {
        max = score;
      }
    }
  }
  return max;
}

} // namespace AdventOfCode