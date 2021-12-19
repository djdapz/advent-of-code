import {sum} from '../day5/day5';
import {DayConfig} from '../Day';

export const sumOfLowpoints = (map: number[][]): number => {
    const lowponits: number[] = []
    const isLowpoint = curryIsLowpoint(map);
    map.forEach((row, rowNum) => {
        row.forEach((cell, colNum) => {
            if (isLowpoint(rowNum, colNum)) {
                lowponits.push(cell + 1)
            }
        })
    })

    return lowponits.reduce(sum, 0)
}

const curryIsLowpoint = (map: number[][]): (rowNum: number, colNum: number) => boolean => {
    const getOrMax = curryGetOrMax(map);
    return (rowNum: number, colNum: number): boolean => {
        const cell = getOrMax(rowNum, colNum);
        return cell < getOrMax(rowNum - 1, colNum - 1)
            && cell < getOrMax(rowNum - 1, colNum)
            && cell < getOrMax(rowNum - 1, colNum + 1)
            && cell < getOrMax(rowNum, colNum + 1)
            && cell < getOrMax(rowNum, colNum - 1)
            && cell < getOrMax(rowNum + 1, colNum - 1)
            && cell < getOrMax(rowNum + 1, colNum)
            && cell < getOrMax(rowNum + 1, colNum + 1)
    }
}

const curryGetOrMax = (map: number[][]) => (rowNum: number, colNum: number): number => {
    return (map[rowNum] ?? [])[colNum] ?? Number.MAX_SAFE_INTEGER
}

export const Day9: DayConfig<number[][]> = {
    dayNumber: 9,
    parseInput(rawInput: string): number[][] {
        return rawInput.split('\n').map(it => it.split('').map(it => parseInt(it)));
    },
    part1: sumOfLowpoints,
    part2(input: number[][]): number {
        return 0;
    }

}