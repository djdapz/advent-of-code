import {rangeFrom0} from '../helpers';
import {match} from 'ts-pattern';
import {DayConfig} from '../Day';
import {readStringList} from '../read';

export const countOverlaps = (vents: Vent[], mapSize: number = 1000): number => {
    let map: number[][] = new Array(mapSize).fill(undefined).map(() => new Array(mapSize).fill(0))

    const replaceOrIncrement = ({x, y}: Point) => {
        map[y][x]++;
    }
    vents.forEach(it => {
        findPoints(it).forEach(replaceOrIncrement)
    })

    return map.map(row =>
        row.filter(notEmpty)
            .filter(it => it > 1)
            .reduce(count, 0)
    ).reduce(sum, 0)
}


type Direction = 'VERTICAL' | 'HORIZONTAL' | 'DIAGONAL_UPWARDS' | 'DIAGONAL_DOWNWARDS';
type Point = { x: number, y: number };
type Vent = {
    start: Point,
    end: Point,
    direction: Direction,
    length: number
}

export const findPoints = (vent: Vent): Point[] =>
    match(vent.direction)
        .with('VERTICAL', () =>
            rangeFrom0(vent.length).map(i => ({x: vent.start.x, y: vent.start.y + i}))
        )
        .with('HORIZONTAL', () =>
            rangeFrom0(vent.length).map(i => ({x: vent.start.x + i, y: vent.start.y}))
        )
        .with('DIAGONAL_UPWARDS', () =>
            rangeFrom0(vent.length).map(i => ({x: vent.start.x + i, y: vent.start.y - i}))
        )
        .with('DIAGONAL_DOWNWARDS', () =>
            rangeFrom0(vent.length).map(i => ({x: vent.start.x + i, y: vent.start.y + i}))
        )
        .exhaustive()

export const parseVent = (vent: string): Vent => {
    let [start, end] = vent.split('->').map(it => it.trim()).map(it => {
        let components = it.split(',').map(it => parseInt(it));
        return {x: components[0], y: components[1]};
    }).sort((a, b) => a.x - b.x)

    if (start.x == end.x) {
        return {
            direction: 'VERTICAL',
            length: Math.abs(start.y - end.y) + 1,
            start: {x: start.x, y: Math.min(end.y, start.y)},
            end: {x: start.x, y: Math.max(end.y, start.y)}
        }
    }

    if (start.y == end.y) {
        return {
            direction: 'HORIZONTAL',
            length: Math.abs(start.x - end.x) + 1,
            start,
            end
        }
    }

    let distance = end.y - start.y
    return {
        start,
        end,
        length: Math.abs(distance) + 1,
        direction: distance < 0 ? 'DIAGONAL_UPWARDS' : 'DIAGONAL_DOWNWARDS'
    }


}

export function notEmpty<TValue>(value: TValue | null | undefined): value is TValue {
    return value !== null && value !== undefined;
}

export const sum = (a: number, b: number) => a + b;
export const count = (a: number) => a + 1;

export const Day5: DayConfig<Vent[]> = {
    dayNumber: 5,
    parseInput(rawInput: string): Vent[] {
        return readStringList(rawInput).map(parseVent);
    },
    part2: countOverlaps,
    part1(input: Vent[]): number {
        let nonDiagonalVents = input.filter(it => it.direction == 'VERTICAL' || it.direction == 'HORIZONTAL');
        return countOverlaps(nonDiagonalVents);
    }

}