import {match} from 'ts-pattern';
import {DayConfig} from '../Day';
import {readStringList} from '../read';

export const Day3: DayConfig<string[]> = {
    dayNumber: 3,
    parseInput: readStringList,
    part1(input: string[]): number {
        let bits = bitCounts(input);
        return genEpsilon(bits) * genGamma(bits);
    },
    part2(input: string[]): number {
        return findCo2Scrubber(input) * findOxygenScrubber(input)
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
    return readBinaryNumber(bitCounts.map(it => it > 0 ? 1 : 0).join(''));
};


export const genEpsilon = (bitCounts: number[]): number => {
    return readBinaryNumber(bitCounts.map(it => it < 0 ? 1 : 0).join(''));
};

const readBinaryNumber = (numberAsString: string): number => {
    return parseInt(numberAsString, 2);
}

export const findOxygenScrubber = (input: string[], index: number = 0): number => {
    let score = bitScoreAtPosition(input, index)
    let matchingChar = score >= 0 ? '1' : '0';
    let matching = input.filter(it => it[index] === matchingChar);

    if (matching.length === 1) {
        return readBinaryNumber(matching[0])
    }

    return findOxygenScrubber(matching, index + 1)
}

export const findCo2Scrubber = (input: string[], index: number = 0): number => {
    let score = bitScoreAtPosition(input, index)
    let matchingBit = score < 0 ? '1' : '0';
    let matching = input.filter(it => it[index] === matchingBit);

    if (matching.length === 1) {
        return readBinaryNumber(matching[0])
    }

    return findCo2Scrubber(matching, index + 1)
}

export const bitScoreAtPosition = (input: string[], position: number): number => {
    let score = 0;

    input.forEach(it => {
        let val = it[position]
        match(val as Bit)
            .with('0', () => score--)
            .with('1', () => score++)
            .exhaustive();
    });

    return score;
};
