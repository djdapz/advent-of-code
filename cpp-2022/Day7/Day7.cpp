#include "Day7.h"
#include "absl/container/flat_hash_map.h"
#include "absl/memory/memory.h"
#include "absl/strings/ascii.h"
#include "absl/strings/str_split.h"
#include "absl/strings/strip.h"
#include "parsing/parsing.h"
#include <memory>
#include <stack>
#include <vector>

using absl::string_view;
using AdventOfCode::Parsing::StringToInt;
using std::unique_ptr;
namespace AdventOfCode {

const int TOTAL_FILESPACE = 70000000;
const int REQUIRED_SPACE = 30000000;

int Day7::Part1() const {
  std::stack<std::shared_ptr<Directory>> toVisit = {};
  toVisit.push(root);

  int sizeOfSmallDirs = 0;

  while (!toVisit.empty()) {
    auto current = toVisit.top();
    toVisit.pop();
    if (current->size < 100000) {
      sizeOfSmallDirs += current->size;
    }

    for (auto const &child : current->children) {
      toVisit.push(child.second);
    }
  }

  return sizeOfSmallDirs;
}
int Day7::Part2() const {
  int freeSpace = TOTAL_FILESPACE - root->size;
  int spaceNeededToFree = REQUIRED_SPACE - freeSpace;

  std::stack<std::shared_ptr<Directory>> toVisit = {};
  toVisit.push(root);

  int sizeOfDirectoryToDelete = INT32_MAX;

  while (!toVisit.empty()) {
    auto current = toVisit.top();
    toVisit.pop();
    if (current->size > spaceNeededToFree &&
        current->size < sizeOfDirectoryToDelete) {
      sizeOfDirectoryToDelete = current->size;
    }

    for (auto const &child : current->children) {
      toVisit.push(child.second);
    }
  }

  return sizeOfDirectoryToDelete;
}

Day7::Day7(std::vector<std::string> input) : input(input) {
  std::shared_ptr<Directory> currentDirectory = std::make_shared<Directory>();
  for (int i = 0; i < input.size(); i++) {
    std::string line = input.at(i);
    std::vector<string_view> lineComponents = absl::StrSplit(line, " ");

    if (lineComponents.at(0) == "$") {
      if (lineComponents.at(1) == "ls") {
        continue;
      }

      if (lineComponents.at(1) == "cd") {
        string_view cdArgs = lineComponents.at(2);
        if (cdArgs == "..") {
          int s = currentDirectory->size;
          currentDirectory = currentDirectory->parent;
          currentDirectory->size += s;
        } else {
          std::shared_ptr<Directory> newD = std::make_shared<Directory>();
          newD->parent = currentDirectory;
          currentDirectory->children[cdArgs] = newD;
          currentDirectory = newD;
        }
      }
    } else {
      currentDirectory->size += StringToInt(lineComponents.at(0));
    }
  }

  while (currentDirectory->parent != nullptr) {
    int s = currentDirectory->size;
    currentDirectory = currentDirectory->parent;
    currentDirectory->size += s;
  }

  root = currentDirectory;
}
int Day7::SizeRoot() { return this->root->size; }
const std::shared_ptr<Directory> &Day7::GetRoot() const { return root; }

} // namespace AdventOfCode