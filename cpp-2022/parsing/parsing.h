//
// Created by Devon D'Apuzzo on 5/6/22.
//

#include "absl/strings/ascii.h"
#include <string>
#include <vector>

#ifndef CPP_2022_PARSING_H
#define CPP_2022_PARSING_H
using absl::string_view;

namespace AdventOfCode {
namespace Parsing {

std::vector<int> InputToInts(const absl::string_view &input);
std::vector<std::string> InputToStrings(const absl::string_view &input);
std::vector<std::vector<int>> InputToGroupedInts(const std::string &input);
int StringToInt(absl::string_view input);
std::vector<std::vector<std::string>>
InputToGroupedStrings(const std::string &input);
std::vector<std::vector<int>>
InputToIntListsNoSeparator(const std::string &input);
std::vector<int> StringToIntsNoSeparator(const absl::string_view &input);

} // namespace Parsing
} // namespace AdventOfCode

#endif // CPP_2022_PARSING_H
