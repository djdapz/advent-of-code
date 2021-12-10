import { DayConfig } from '../Day';
import { readMultilineNumberList } from '../read';

function countIncreasingSteps(input: number[]) {
  let counter = 0;
  let prev = input[0];
  for (let i = 1; i < input.length; i++) {
    const next = input[i];
    if (next > prev) {
      counter++;
    }
    prev = next;
  }
  return counter;
}

const part1 = (input: number[]): number => {
  return countIncreasingSteps(input);
};

const part2 = (input: number[]): number => {
  let windows = listToWindows(input);
  return countIncreasingSteps(windows);
};


const listToWindows = (input: number[]): number[] => {
  let windows = [input[0] + input[1] + input[3]];
  for (let i = 3; i < input.length; i++) {
    let nextNum = input[i];
    let removedNum = input[i - 3];
    let prevSum = windows[windows.length - 1];
    windows.push(prevSum + nextNum - removedNum);
  }
  return windows;
};


export const Day1: DayConfig<number[]> = {
  dayNumber: 1,
  parseInput: readMultilineNumberList,
  part1,
  part2,
};
