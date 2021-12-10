import {containsSameCharsAs, countDigits, Day8, parseEntry, solve} from './day8';
import {runDay} from '../Day';


describe('day8', () => {

    it('should count output digits (1,7,8)', () => {
        const entry = parseEntry('edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc')
        const digits = countDigits(entry.output)
        const expected = [0, 1, 0, 0, 0, 0, 0, 1, 1, 0]
        expect(digits).toEqual(expected)
    })

    it('should count output digits (4,8)', () => {
        const entry = parseEntry('dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe')
        const digits = countDigits(entry.output)
        const expected = [0, 0, 0, 0, 2, 0, 0, 0, 1, 0]
        expect(digits).toEqual(expected)
    })

    it('should solve an entry', function () {
        const entry = parseEntry('acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf')
        const unscrambledEntry = solve(entry);
        expect(unscrambledEntry).toEqual({
            signalPattern: [8, 5, 2, 3, 7, 9, 6, 4, 0, 1],
            output: [5, 3, 5, 3]
        })
    });

    it('should tell me when characters overlap', function () {
        expect(containsSameCharsAs(['a', 'b', 'c'], 'abc'.split(''))).toBeTruthy()
        expect(containsSameCharsAs([
            'e',
            'a',
            'f',
            'b'
        ], 'adfbe'.split(''))).toBeTruthy()
    });

    it('should get the correct answer', function () {
        let dayResults = runDay(Day8);
        expect(dayResults.part2).toEqual(983030)
        expect(dayResults.part1).toEqual(355)
    });


})