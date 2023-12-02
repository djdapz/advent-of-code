//
// Created by Devon D'Apuzzo on 12/12/22.
//

#ifndef CPP_TUTORIAL_DAY7_H
#define CPP_TUTORIAL_DAY7_H

#include "absl/container/flat_hash_map.h"
#include "absl/memory/memory.h"
#include <memory>
#include <string>
#include <vector>
using std::unique_ptr;

namespace AdventOfCode {

class Directory {
public:
  absl::flat_hash_map<std::string, std::shared_ptr<Directory>> children;
  int size = 0;
  std::shared_ptr<Directory> parent;
};

class Day7 {
private:
  std::vector<std::string> input;
  std::shared_ptr<Directory> root;

public:
  Day7(std::vector<std::string> input);
  int Part1() const;
  int Part2() const;

  int SizeRoot();

  const std::shared_ptr<Directory> &GetRoot() const;
};

} // namespace AdventOfCode

#endif // CPP_TUTORIAL_DAY7_H
