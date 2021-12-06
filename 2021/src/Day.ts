import { readFile } from './fileReader/fileReader';

export type DayConfig<T> = {
  dayNumber: number,
  parseInput: (rawInput: string) => T,
  part1: (input: T) => number,
  part2: (input: T) => number,
}

type DayResults = {
  part1: number,
  part2: number
}


const runDay = <T>(config: DayConfig<T>): DayResults => {
  const rawInput = readFile(`day${config.dayNumber}.txt`);
  const input = config.parseInput(rawInput);
  return {
    part1: config.part1(input),
    part2: config.part2(input),
  };
};

export const printDay = <T>(config: DayConfig<T>): void => {
  const results = runDay(config);

  console.log(`
Day ${config.dayNumber}
  part1: ${results.part1}
  part2: ${results.part2}`);
};
