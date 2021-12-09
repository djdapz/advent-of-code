import {DayConfig} from '../Day';
import {sum} from '../day5/day5';


const cache = [
    [1, 0, 0, 0, 0, 0, 0, 0, 0],
]

export const populationAfterDays = (score: number, days: number): number => {
    if (days < score) return 1
    return simulateFor(days - score).reduce(sum);
}
const simulateFor = (days: number): number[] => {
    let cachedValue = cache[days];
    if (cachedValue != undefined) {
        return cachedValue;
    }

    let yesterday = simulateFor(days - 1);
    let today = [...yesterday]
    let numFishGivingBirth = today.shift()!;

    today.push(numFishGivingBirth)
    today[6] += numFishGivingBirth;

    Object.freeze(today);
    cache[days] = today;

    return today;
}

export const simulateSchoolOfFishBreeding = (scores: number[], forDays: number): number => {
    return scores.map(it => populationAfterDays(it, forDays)).reduce(sum)
}

export const Day6: DayConfig<number[]> = {
    dayNumber: 6,
    parseInput(rawInput: string): number[] {
        return rawInput.split(',').map(it => parseInt(it))
    },
    part1(input: number[]): number {
        return simulateSchoolOfFishBreeding(input, 80)
    },
    part2(input: number[]): number {
        return simulateSchoolOfFishBreeding(input, 256)
    }

}