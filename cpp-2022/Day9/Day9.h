//
// Created by Devon D'Apuzzo on 2/6/23.
//

#ifndef CPP_TUTORIAL_DAY9_DAY9_H_
#define CPP_TUTORIAL_DAY9_DAY9_H_
#include "absl/container/flat_hash_set.h"
#include "absl/hash/hash.h"
#include <iostream>
#include <ostream>
#include <string>
#include <vector>

namespace AdventOfCode {

struct Coordinate {
  int x;
  int y;

  template <typename H> friend H AbslHashValue(H h, const Coordinate &c) {
    return H::combine(std::move(h), c.x, c.y);
  }

  bool operator==(const Coordinate &rhs) const {
    return x == rhs.x && y == rhs.y;
  }
  bool operator!=(const Coordinate &rhs) const { return !(rhs == *this); }

  friend std::ostream &operator<<(std::ostream &os,
                                  const Coordinate &coordinate) {
    os << "x: " << coordinate.x << " y: " << coordinate.y;
    return os;
  }
};

enum Direction { UP, DOWN, LEFT, RIGHT };

struct Move {
  Direction direction;
  int distance;
  bool operator==(const Move &rhs) const {
    return direction == rhs.direction && distance == rhs.distance;
  }
  bool operator!=(const Move &rhs) const { return !(rhs == *this); }
  static Move DeserializeMove(const std::string &serialized);
  friend std::ostream &operator<<(std::ostream &os, const Move &move) {
    os << "direction: " << move.direction << " distance: " << move.distance;
    return os;
  }
};

struct Position {
  Coordinate head;
  Coordinate tail;

  bool operator==(const Position &rhs) const {
    return head == rhs.head && tail == rhs.tail;
  }
  bool operator!=(const Position &rhs) const { return !(rhs == *this); }

  friend std::ostream &operator<<(std::ostream &os, const Position &position) {
    os << "head: " << position.head << " tail: " << position.tail;
    return os;
  }
};

class State {
  Position position;
  absl::flat_hash_set<Coordinate> visited_by_tail = {};

public:
  State(Position position) : position(position) {
    this->visited_by_tail.insert(position.tail);
  }

  void DoMove(Move move);

  const Position &GetPosition() const { return position; }

  int TailVisitedCount();
  bool TailHasVisited(const Coordinate &coordinate);

private:
  bool TailNeedsToMove();
  void MoveTail(int x, int y);
};

class Day9 {
private:
  std::vector<Move> moves;

public:
  Day9(std::vector<std::string> moves) {
    for (auto move : moves) {
      this->moves.push_back(Move::DeserializeMove(move));
    }
  }
  int Part1() const;
  int Part2() const;
};

} // namespace AdventOfCode

#endif // CPP_TUTORIAL_DAY9_DAY9_H_
