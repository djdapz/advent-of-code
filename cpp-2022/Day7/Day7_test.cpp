//
// Created by Devon D'Apuzzo on 5/5/22.
//

#include "Day7.h"
#include <vector>

#include "gtest/gtest.h"

#include "input/input.h"
#include "parsing/parsing.h"
using std::vector;
namespace AdventOfCode {
//
// TEST(Day7Test, SumUpFlatDirectory) {
//  vector<std::string> input{"$ cd /", "$ ls", "14848514 b.txt",
//                            "8504156 c.dat"};
//
//  auto subject = Day7(input);
//  int result = subject.SizeRoot();
//  EXPECT_EQ(result, 14848514 + 8504156);
//}
//
// TEST(Day7Test, SumUpNestedDirectory) {
//  vector<std::string> input{
//      "$ cd /", "$ ls",     "14848514 b.txt", "8504156 c.dat",
//      "dir a",  "$ cd dir", "11223344 e.dat",
//  };
//
//  auto subject = Day7(input);
//  int result = subject.SizeRoot();
//  EXPECT_EQ(result, 14848514 + 8504156 + 11223344);
//}
//
// TEST(Day7Test, SumUpTwoNestedDirectories) {
//  vector<std::string> input{
//      "$ cd /",  "$ ls",    "14848514 b.txt", "8504156 c.dat",
//      "dir ab",  "dir ac",  "$ cd ab",        "11223344 e.dat",
//      "$ cd ..", "$ cd ac", "8899 f.dat",
//  };
//
//  auto subject = Day7(input);
//  int result = subject.SizeRoot();
//  EXPECT_EQ(result, 14848514 + 8504156 + 11223344 + 8899);
//}

TEST(Day7Test, AocExample) {
  vector<std::string> input{
      "$ cd /",        "$ ls",          "dir a",    "14848514 b.txt",
      "8504156 c.dat", "dir d",         "$ cd a",   "$ ls",
      "dir e",         "29116 f",       "2557 g",   "62596 h.lst",
      "$ cd e",        "$ ls",          "584 i",    "$ cd ..",
      "$ cd ..",       "$ cd d",        "$ ls",     "4060174 j",
      "8033020 d.log", "5626152 d.ext", "7214296 k"};

  auto subject = Day7(input);

  auto root = subject.GetRoot();

  EXPECT_EQ(root->size, 48381165);
  //  EXPECT_EQ(root->children.size(), 2);

  std::shared_ptr<Directory> top = root->children["/"];
  EXPECT_EQ(top->children.size(), 2);
  EXPECT_EQ(top->size, 48381165);

  std::shared_ptr<Directory> a = top->children["a"];
  EXPECT_EQ(a->children.size(), 1);
  EXPECT_EQ(a->size, 584 + 29116 + 2557 + 62596);

  std::shared_ptr<Directory> e = a->children["e"];
  EXPECT_EQ(e->children.size(), 0);
  EXPECT_EQ(e->size, 584);

  std::shared_ptr<Directory> d = top->children["d"];
  EXPECT_EQ(d->children.size(), 0);
  EXPECT_EQ(d->size, 4060174 + 8033020 + 5626152 + 7214296);

  EXPECT_EQ(subject.Part1(), 95437);
}

TEST(Day7Test, SmallestDirectoryToFreeUpDiskSpace) {
  vector<std::string> input{
      "$ cd /",        "$ ls",          "dir a",    "14848514 b.txt",
      "8504156 c.dat", "dir d",         "$ cd a",   "$ ls",
      "dir e",         "29116 f",       "2557 g",   "62596 h.lst",
      "$ cd e",        "$ ls",          "584 i",    "$ cd ..",
      "$ cd ..",       "$ cd d",        "$ ls",     "4060174 j",
      "8033020 d.log", "5626152 d.ext", "7214296 k"};

  auto subject = Day7(input);

  auto root = subject.GetRoot();

  EXPECT_EQ(root->size, 48381165);
  std::shared_ptr<Directory> d = root->children["/"]->children["d"];
  EXPECT_EQ(d->size, 24933642);

  EXPECT_EQ(subject.Part2(), 24933642);
}

// TEST(Day7Test, TODO2) {
//   vector<std::string> input{};
//
//   auto subject = Day7(input);
//   int result = subject.Part2();
//   EXPECT_EQ("TODO", "WRITE TESTS");
// }

} // namespace AdventOfCode