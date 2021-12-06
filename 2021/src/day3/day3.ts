import { match } from 'ts-pattern';
import { DayConfig } from '../Day';
import { readStringList } from '../read';

export const Day3: DayConfig<string[]> = {
  dayNumber: 3,
  parseInput: readStringList,
  part1(input: string[]): number {
    let bits = bitCounts(input);
    return genEpsilon(bits) * genGamma(bits);
  },
  part2(input: string[]): number {
    return 0;
  },
};
type Bit = '0' | '1'
export const bitCounts = (input: string[]): number[] => {
  let bitCountz: number[] = new Array(input[0].length).fill(0);

  input.forEach(it => {

    it.split('').forEach((val, i) => {
      match(val as Bit)
        .with('0', () => bitCountz[i]--)
        .with('1', () => bitCountz[i]++)
        .exhaustive();
    });
  });

  return bitCountz;
};

export const genGamma = (bitCounts: number[]): number => {
  return parseInt(bitCounts.map(it => it > 0 ? 1 : 0).join(''), 2);
};


export const genEpsilon = (bitCounts: number[]): number => {
  return parseInt(bitCounts.map(it => it < 0 ? 1 : 0).join(''), 2);
};
