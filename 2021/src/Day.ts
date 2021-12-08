import {readFile} from './fileReader/fileReader';

export type DayConfig<T> = {
    dayNumber: number,
    parseInput: (rawInput: string) => T,
    part1: (input: T) => number,
    part2: (input: T) => number,
}

type DayResults = {
    part1: number,
    part2: number,
    part1Time: number,
    part2Time: number,
}


export const runDay = <T>(config: DayConfig<T>): DayResults => {
    const rawInput = readFile(`day${config.dayNumber}.txt`);
    const input = config.parseInput(rawInput);
    let part1start = new Date();
    let part1 = config.part1(input);
    let part1Time = new Date().getTime() - part1start.getTime();
    let part2start = new Date();
    let part2 = config.part2(input);
    let part2Time = new Date().getTime() - part2start.getTime();
    return {
        part1,
        part2,
        part1Time,
        part2Time,
    };
};

export const printDay = <T>(config: DayConfig<T>): void => {
    const results = runDay(config);

    console.log(`
Day ${config.dayNumber}
 part1: ${results.part1.toString().padEnd(15, '.')}..time: ${results.part1Time}
 part2: ${results.part2.toString().padEnd(15, '.')}..time: ${results.part2Time}`);
};

// part1: 46920............time: 18
