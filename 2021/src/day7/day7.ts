import {sum} from '../day5/day5';
import {DayConfig} from '../Day';
import {readNumberArray} from '../read';
import {match} from 'ts-pattern';

type Mode = 'CRAB' | 'LINEAR'

const crabCache = [0, 1]
const crabCost = (distance: number): number => {
    if (crabCache[distance] === undefined) {
        crabCache[distance] = crabCost(distance - 1) + distance
    }
    return crabCache[distance]
}

export const costForPosition = (whales: number[], position: number, mode: Mode = 'LINEAR') => {
    const heurisitc: (crabHeight: number) => number = match(mode)
        .with('LINEAR', () => (it: number) => Math.abs(it - position))
        .with('CRAB', () => (it: number) => crabCost(Math.abs(it - position)))
        .exhaustive();

    return whales.map(heurisitc).reduce(sum);
}


export const findLowestCost = (mode: Mode) => (whales: number[]): number => {
    let max = Math.max(...whales);
    let min = Math.min(...whales);
    let costs = range(min, max).map(it => costForPosition(whales, it, mode));
    return Math.min(...costs)
}

export const Day7: DayConfig<number[]> = {
    dayNumber: 7,
    parseInput: readNumberArray,
    part1: findLowestCost('LINEAR'),
    part2: findLowestCost('CRAB'),
}

const range = (from: number, to: number) => {
    if (from < to) {
        let array = [];
        for (let i = from; i <= to; i++) {
            array.push(i)
        }
        return array;
    }
    throw  Error('Range doesn\'t support downard ranges yet')
}