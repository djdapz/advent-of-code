import {countOverlaps, findPoints, notEmpty, parseVent} from './day5';

describe('Day5', function () {
    it('should count overlaps', function () {
        const vents = ['0,9 -> 5,9',
            '8,0 -> 0,8',
            '9,4 -> 3,4',
            '2,2 -> 2,1',
            '7,0 -> 7,4',
            '6,4 -> 2,0',
            '0,9 -> 2,9',
            '3,4 -> 1,4',
            '0,0 -> 8,8',
            '5,5 -> 8,2',]

        const numOverlaps = countOverlaps(vents.map(parseVent).filter(it => it.direction == 'HORIZONTAL' || it.direction == 'VERTICAL'), 15)
        expect(numOverlaps).toEqual(5);
    });

    it('should count overlaps with diagonals', function () {
        const vents = ['0,9 -> 5,9',
            '8,0 -> 0,8',
            '9,4 -> 3,4',
            '2,2 -> 2,1',
            '7,0 -> 7,4',
            '6,4 -> 2,0',
            '0,9 -> 2,9',
            '3,4 -> 1,4',
            '0,0 -> 8,8',
            '5,5 -> 8,2',]

        const numOverlaps = countOverlaps(vents.map(parseVent), 15)
        expect(numOverlaps).toEqual(12);
    });

    it('should parse vents', function () {
        expect(parseVent('1,5 -> 1,4')).toEqual({
            start: {x: 1, y: 4},
            end: {x: 1, y: 5},
            direction: 'VERTICAL',
            length: 2
        })
        expect(parseVent('0,9 -> 3,9')).toEqual({
            start: {x: 0, y: 9},
            end: {x: 3, y: 9},
            direction: 'HORIZONTAL',
            length: 4
        })

        // ..........
        // ..........
        // ..........
        // ..........
        // ..........
        // ....x.....
        // ...x......
        // ..x.......
        // .x........
        // x.........
        expect(parseVent('0,9 -> 4,5')).toEqual({
            start: {x: 0, y: 9},
            end: {x: 4, y: 5},
            direction: 'DIAGONAL_UPWARDS',
            length: 5
        })

        // ..........
        // ...x......
        // ....x.....
        // .....x....
        // ......x...
        // ..........
        // ..........
        expect(parseVent('7,4 -> 3,1')).toEqual({
            start: {x: 3, y: 1},
            end: {x: 7, y: 4},
            direction: 'DIAGONAL_DOWNWARDS',
            length: 4
        })
    });

    it('should generate points for a vent', function () {
        let vent = parseVent('0,8 -> 8,0');
        let points = findPoints(vent);
        let expectedPoints = [
            {x: 0, y: 8},
            {x: 1, y: 7},
            {x: 2, y: 6},
            {x: 3, y: 5},
            {x: 4, y: 4},
            {x: 5, y: 3},
            {x: 6, y: 2},
            {x: 7, y: 1},
            {x: 8, y: 0},
        ]

        expect(points).toEqual(expectedPoints);
    });
});
