#include "Day5.h"
#include "absl/memory/memory.h"
#include "absl/strings/ascii.h"
#include "absl/strings/str_split.h"
#include "parsing/parsing.h"
#include <initializer_list>
#include <stack>
#include <vector>

using absl::string_view;
using AdventOfCode::Parsing::StringToInt;
using std::stack;
using std::string;
using std::unique_ptr;
using std::vector;
namespace AdventOfCode {

string Day5::Part1() {
  auto stacks = MakeCrates();
  for (auto &command : this->commands) {
    auto &startStack = stacks.at(command->startColumn - 1);
    auto &endStack = stacks.at(command->endColumn - 1);
    for (int i = 0; i < command->count; i++) {
      char element = startStack->top();
      endStack->push(element);
      startStack->pop();
    }
  }

  string result = "";
  for (auto &stack : stacks) {
    result.push_back(stack->top());
  }
  return result;
}
string Day5::Part2() {
  auto stacks = MakeCrates();
  for (auto &command : this->commands) {
    auto &startStack = stacks.at(command->startColumn - 1);
    auto &endStack = stacks.at(command->endColumn - 1);
    vector<char> tmp = {};
    for (int i = 0; i < command->count; i++) {
      char element = startStack->top();
      tmp.push_back(element);
      startStack->pop();
    }
    for (int i = tmp.size() - 1; i >= 0; i--) {
      endStack->push(tmp.at(i));
    }
  }

  string result = "";
  for (auto &stack : stacks) {
    result.push_back(stack->top());
  }
  return result;
}

Day5::Day5(vector<vector<string>> input) : input(input) { MakeCommands(input); }

void Day5::MakeCommands(const vector<vector<string>> &input) {
  commands = vector<unique_ptr<Command>>{};
  auto commandsInput = input.at(1);

  for (const auto &line : input.at(1)) {
    vector<string_view> words = absl::StrSplit(line, ' ');

    int start = StringToInt(words.at(3));
    int end = StringToInt(words.at(5));
    int count = StringToInt(words.at(1));

    unique_ptr<Command> a = absl::make_unique<Command>(count, start, end);
    commands.push_back(std::move(a));
  }
}

vector<unique_ptr<stack<char>>> Day5::MakeCrates() {
  vector<unique_ptr<stack<char>>> stacks = vector<unique_ptr<stack<char>>>{};

  auto cratesInput = input.at(0);
  int count_stacks = (cratesInput.at(0).size() + 1) / 4;
  for (int i = 0; i < count_stacks; i++) {
    unique_ptr<std::stack<char>> a = absl::make_unique<stack<char>>();
    stacks.push_back(std::move(a));
  }

  for (int stackNumber = 0; stackNumber < count_stacks; stackNumber++) {
    int numLevels = cratesInput.size() - 1;
    auto &stack = stacks.at(stackNumber);
    int i = stackNumber * 4 + 1;
    for (int level = 0; level < numLevels; level++) {
      string row = cratesInput.at(numLevels - level - 1);
      char crateLetter = row.at(i);
      if (crateLetter == ' ') {
        break;
      }
      stack->push(crateLetter);
    }
  }
  return stacks;
}

Command::Command(int count, int startColumn, int endColumn)
    : count(count), startColumn(startColumn), endColumn(endColumn) {}
} // namespace AdventOfCode