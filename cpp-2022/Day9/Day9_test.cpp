//
// Created by Devon D'Apuzzo on 5/5/22.
//

#include "Day9.h"
#include <vector>

#include "gtest/gtest.h"

#include "input/input.h"
#include "parsing/parsing.h"
using std::vector;
namespace AdventOfCode {

TEST(Day9Test, MoveHead) {
  Position origin = Position{.head = Coordinate{.x = 0, .y = 0},
                             .tail = Coordinate{.x = 0, .y = 0}};

  auto state = absl::make_unique<State>(origin);

  state->DoMove(Move{UP, 3});
  Position position = Position{
      .head = Coordinate{0, 3},
      .tail = Coordinate{0, 2},
  };
  EXPECT_EQ(state->GetPosition(), position);

  state->DoMove(Move{RIGHT, 10});
  position = Position{
      .head = Coordinate{.x = 10, .y = 3},
      .tail = Coordinate{.x = 9, .y = 3},
  };
  EXPECT_EQ(state->GetPosition(), position);

  state->DoMove(Move{DOWN, 5});
  position = Position{
      .head = Coordinate{10, -2},
      .tail = Coordinate{10, -1},
  };
  EXPECT_EQ(state->GetPosition(), position);

  state->DoMove(Move{LEFT, 5});
  position = Position{
      .head = Coordinate{5, -2},
      .tail = Coordinate{6, -2},
  };
  EXPECT_EQ(state->GetPosition(), position);
}

TEST(Day9Test, UpAndRight) {
  Position origin = Position{.head = Coordinate{.x = 0, .y = 0},
                             .tail = Coordinate{.x = 0, .y = 0}};

  auto state = absl::make_unique<State>(origin);

  state->DoMove(Move{UP, 3});
  state->DoMove(Move{RIGHT, 3});
  EXPECT_EQ(state->TailVisitedCount(), 5);
  EXPECT_TRUE(state->TailHasVisited(Coordinate{0, 0}));
  EXPECT_TRUE(state->TailHasVisited(Coordinate{0, 1}));
  EXPECT_TRUE(state->TailHasVisited(Coordinate{0, 2}));
  EXPECT_TRUE(state->TailHasVisited(Coordinate{1, 3}));
  EXPECT_TRUE(state->TailHasVisited(Coordinate{2, 3}));
}

TEST(Day9Test, RightAndUp) {
  testing::internal::CaptureStdout();
  Position origin = Position{.head = Coordinate{.x = 0, .y = 0},
                             .tail = Coordinate{.x = 0, .y = 0}};

  auto state = absl::make_unique<State>(origin);

  state->DoMove(Move{RIGHT, 3});
  state->DoMove(Move{UP, 3});
  EXPECT_EQ(state->TailVisitedCount(), 5);
  EXPECT_TRUE(state->TailHasVisited(Coordinate{0, 0}));
  EXPECT_TRUE(state->TailHasVisited(Coordinate{1, 0}));
  EXPECT_TRUE(state->TailHasVisited(Coordinate{2, 0}));
  EXPECT_TRUE(state->TailHasVisited(Coordinate{3, 1}));
  EXPECT_TRUE(state->TailHasVisited(Coordinate{3, 2}));

  EXPECT_FALSE(state->TailHasVisited(Coordinate{3, 0}));

  std::string output = testing::internal::GetCapturedStdout();
}

TEST(Day9Test, DownAndLeft) {

  Position origin = Position{.head = Coordinate{.x = 0, .y = 0},
                             .tail = Coordinate{.x = 0, .y = 0}};

  auto state = absl::make_unique<State>(origin);

  state->DoMove(Move{DOWN, 3});
  state->DoMove(Move{LEFT, 3});
  EXPECT_EQ(state->TailVisitedCount(), 5);
  EXPECT_TRUE(state->TailHasVisited(Coordinate{0, 0}));
  EXPECT_TRUE(state->TailHasVisited(Coordinate{0, -1}));
  EXPECT_TRUE(state->TailHasVisited(Coordinate{0, -2}));
  EXPECT_TRUE(state->TailHasVisited(Coordinate{-1, -3}));
  EXPECT_TRUE(state->TailHasVisited(Coordinate{-2, -3}));
}

TEST(Day9Test, MovementsOf1TowardsTailDontMoveTail) {}

TEST(Day9Test, FullExample) {
  testing::internal::CaptureStdout();
  Position origin = Position{.head = Coordinate{.x = 0, .y = 0},
                             .tail = Coordinate{.x = 0, .y = 0}};

  auto state = absl::make_unique<State>(origin);

  state->DoMove(Move{RIGHT, 4});
  EXPECT_EQ(state->TailVisitedCount(), 4);

  state->DoMove(Move{UP, 4});
  EXPECT_EQ(state->TailVisitedCount(), 4 + 3);

  state->DoMove(Move{LEFT, 3});
  EXPECT_EQ(state->TailVisitedCount(), 4 + 3 + 2);

  state->DoMove(Move{DOWN, 1});
  EXPECT_EQ(state->TailVisitedCount(), 4 + 3 + 2 + 0);

  state->DoMove(Move{RIGHT, 4});
  EXPECT_EQ(state->TailVisitedCount(), 4 + 3 + 2 + 0 + 1);
  state->DoMove(Move{DOWN, 1});
  state->DoMove(Move{LEFT, 5});
  state->DoMove(Move{RIGHT, 2});

  EXPECT_EQ(state->TailVisitedCount(), 13);
}

TEST(Day9Test, DeserializeMoveWorks) {
  Move expected = Move{UP, 10};
  Move actual = Move::DeserializeMove("U 10");
  EXPECT_EQ(actual, expected);
}

} // namespace AdventOfCode