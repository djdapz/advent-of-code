//
// Created by Devon D'Apuzzo on 5/6/22.
//

#include "parsing.h"
#include "absl/strings/ascii.h"
#include "absl/strings/numbers.h"
#include "absl/strings/str_split.h"
#include <iostream>

#include "iostream"

using absl::string_view;
using absl::StripAsciiWhitespace;
using std::string;
using std::vector;

namespace AdventOfCode {
namespace Parsing {

std::vector<int> InputToInts(const string_view &input) {
  auto result = vector<int>();

  std::vector<string_view> split = absl::StrSplit(input, '\n');

  for (auto row : split) {
    string_view stripped_input = absl::StripAsciiWhitespace(row);
    if (stripped_input.empty()) {
      continue;
    }
    int num = 10;
    int parsed = absl::SimpleAtoi(stripped_input, &num);
    result.push_back(num);
  }
  return result;
}

vector<vector<int>> InputToGroupedInts(const string &input) {
  auto result = vector<vector<int>>();

  std::vector<string_view> split = absl::StrSplit(input, "\n\n");

  for (auto group : split) {
    result.push_back(InputToInts(group));
  }
  return result;
}

std::vector<std::string> InputToStrings(const absl::string_view &input) {
  auto result = std::vector<std::string>();

  std::vector<string_view> split = absl::StrSplit(input, '\n');

  for (int i = 0; i < split.size(); ++i) {
    string_view row = split[i];
    std::string stripped{StripAsciiWhitespace(row)};
    if (stripped.empty())
      continue;
    result.push_back(stripped);
  }
  return result;
}

int StringToInt(string_view input) {
  string_view stripped_input = absl::StripAsciiWhitespace(input);
  int num = 10;
  int parsed = absl::SimpleAtoi(stripped_input, &num);
  return num;
}
} // namespace Parsing
} // namespace AdventOfCode
