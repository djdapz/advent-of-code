//
// Created by Devon D'Apuzzo on 5/6/22.
//

#include "parsing.h"
#include "absl/strings/ascii.h"
#include "absl/strings/numbers.h"
#include "absl/strings/str_split.h"
#include <iostream>

#include "iostream"

using std::string;
using std::vector;

namespace AdventOfCode {
namespace Parsing {

vector<int> InputToInts(string input) {
  auto result = vector<int>();

  std::vector<absl::string_view> split = absl::StrSplit(input, '\n');

  for (int i = 0; i < split.size(); ++i) {
    absl::string_view row = split[i];
    absl::string_view stripped_input = absl::StripAsciiWhitespace(row);
    if (stripped_input.size() == 0) {
      continue;
    }
    int num = 10;
    int parsed = absl::SimpleAtoi(stripped_input, &num);
    result.push_back(num);
  }
  return result;
}

vector<std::string> InputToStrings(string input) {
  auto result = vector<std::string>();

  std::vector<absl::string_view> split = absl::StrSplit(input, '\n');

  for (int i = 0; i < split.size(); ++i) {
    absl::string_view row = split[i];
    absl::string_view stripped_input = absl::StripAsciiWhitespace(row);
    result.push_back(num);
  }
  return result;
}


int StringToInt(absl::string_view input) {
  absl::string_view stripped_input = absl::StripAsciiWhitespace(input);
  int num = 10;
  int parsed = absl::SimpleAtoi(stripped_input, &num);
  return num;
}
} // namespace Parsing
} // namespace AdventOfCode
