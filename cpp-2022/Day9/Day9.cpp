#include "Day9.h"
#include <iostream>
#include <vector>

#include "absl/strings/str_split.h"
#include "parsing/parsing.h"
using absl::string_view;

namespace AdventOfCode {

int Day9::Part1() const {
  Position origin = Position{.head = Coordinate{.x = 0, .y = 0},
                             .tail = Coordinate{.x = 0, .y = 0}};

  auto state = absl::make_unique<State>(origin);
  for (auto move : moves) {

    state->DoMove(move);
  }

  return state->TailVisitedCount();
}
int Day9::Part2() const { return -1; }

void State::DoMove(Move move) {

  switch (move.direction) {
  case UP:
    for (int i = 0; i < move.distance; i++) {
      position.head.y++;
      if (TailNeedsToMove()) {
        MoveTail(position.head.x, position.head.y - 1);
      }
    }
    return;
  case DOWN:
    for (int i = 0; i < move.distance; i++) {
      position.head.y--;
      if (TailNeedsToMove()) {
        MoveTail(position.head.x, position.head.y + 1);
      }
    }
    return;
  case LEFT:
    for (int i = 0; i < move.distance; i++) {
      position.head.x--;
      if (TailNeedsToMove()) {
        MoveTail(position.head.x + 1, position.head.y);
      }
    }
    break;
  case RIGHT:
    for (int i = 0; i < move.distance; i++) {
      position.head.x++;
      if (TailNeedsToMove()) {
        MoveTail(position.head.x - 1, position.head.y);
      }
    }
    break;
  }
}

int State::TailVisitedCount() { return visited_by_tail.size(); }
bool State::TailHasVisited(const Coordinate &coordinate) {
  return visited_by_tail.contains(coordinate);
}

bool State::TailNeedsToMove() {
  return std::abs(position.head.x - position.tail.x) > 1 ||
         std::abs(position.head.y - position.tail.y) > 1;
}
void State::MoveTail(int x, int y) {
  position.tail.x = x;
  position.tail.y = y;
  visited_by_tail.insert({x, y});
}

Direction DetermineDirection(const string_view &component) {
  switch (component[0]) {
  case 'U':
    return UP;
  case 'D':
    return DOWN;
  case 'L':
    return LEFT;
  case 'R':
    return RIGHT;
  default:
    throw std::invalid_argument("Direction not recognized:" +
                                std::string(component));
  }
}

Move Move::DeserializeMove(const std::string &serialized) {
  std::vector<string_view> split = absl::StrSplit(serialized, ' ');
  return Move{.distance = Parsing::StringToInt(split[1]),
              .direction = DetermineDirection(split[0])};
}
} // namespace AdventOfCode