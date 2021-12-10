import {DayConfig} from '../Day';
import {sum} from '../day5/day5';

type Entry = {
    signalPattern: string[]
    output: string[]
}

type UnscrambledEntry = {
    signalPattern: number[]
    output: number[]
}
const lengthToDigits: Record<number, number> = {
    2: 1,
    3: 7,
    7: 8,
    4: 4
}

export const countDigits = (entry: string[]): number[] => {
    let result = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    entry.forEach(it => {
        let digit = lengthToDigits[it.length];
        if (digit != undefined) {
            result[digit]++
        }
    })
    return result

}

export const parseEntry = (input: string): Entry => {
    const [signalString, outputString] = input.split('|')
    return {
        signalPattern: signalString.trim().split(' '),
        output: outputString.trim().split(' ')
    }
}

export const Day8: DayConfig<Entry[]> = {
    dayNumber: 8,
    parseInput: (rawInput) => rawInput.split('\n').map(parseEntry),
    part1(input: Entry[]): number {
        return input.map(it => countDigits(it.output).reduce(sum, 0)).reduce(sum, 0)
    }, part2(input: Entry[]): number {
        return input.map(solve).map(it => parseInt(it.output.join(''))).reduce(sum, 0)
    }
}
export const containsSameCharsAs = (chars: string[], s: string[]) => chars
    .map(it => s.indexOf(it) > -1)
    .reduce((a, b) => a && b, true)

export const solve = ({signalPattern, output}: Entry): UnscrambledEntry => {
    const key: Record<string, number> = {}
    const reverseKey: Record<number, string[]> = {}
    const len5: string[][] = []
    const len6: string[][] = []
    const addToKey = (val: string[], number: number) => {
        key[sortString(val)] = number
        reverseKey[number] = val;
    }

    signalPattern.map(it => it.split('')).forEach(it => {
        let digit = lengthToDigits[it.length];
        if (digit != undefined) {
            addToKey(it, digit)
        } else if (it.length === 5) {
            len5.push(it)
        } else if (it.length === 6) {
            len6.push(it)
        }
    })

    const addToKeyWhenMatches = (contents: string[][], matchTo: string[], number: number): string[][] => {
        return contents.filter(it => {
            let matches = containsSameCharsAs(matchTo, it);
            if (matches) {
                addToKey(it, number)
            }
            return !matches;
        })
    }
    const splitByMatching = (contents: string[][], matchTo: string[], vals: { matching: number, notMatching: number }) => {
        if (containsSameCharsAs(matchTo, contents[0])) {
            addToKey(contents[0], vals.matching)
            addToKey(contents[1], vals.notMatching)
        } else if (containsSameCharsAs(matchTo, contents[1])) {
            addToKey(contents[1], vals.matching)
            addToKey(contents[0], vals.notMatching)
        }
    }


    let remainingLen6 = addToKeyWhenMatches(len6, reverseKey[4], 9);
    splitByMatching(remainingLen6, reverseKey[1], {matching: 0, notMatching: 6});

    let remainingLen5 = addToKeyWhenMatches(len5, reverseKey[1], 3);
    let charsOverlappingWith5 = reverseKey[4].filter(it => reverseKey[1].indexOf(it) == -1);
    splitByMatching(remainingLen5, charsOverlappingWith5, {matching: 5, notMatching: 2});

    return {
        signalPattern: signalPattern.map(it => key[sortString(it.split(''))]),
        output: output.map(it => key[sortString(it.split(''))]),
    }
}


const sortString = (text: string[]) => text.sort().join('');