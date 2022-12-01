//
// Created by Devon D'Apuzzo on 5/6/22.
//

#include <string>
#include <vector>
#include "absl/strings/ascii.h"

#ifndef CPP_TUTORIAL_PARSING_H
#define CPP_TUTORIAL_PARSING_H

namespace AdventOfCode {
namespace Parsing {
std::vector<int> InputToInts(std::string input);
int StringToInt(absl::string_view input);
} // namespace Parsing
} // namespace AdventOfCode

#endif // CPP_TUTORIAL_PARSING_H
