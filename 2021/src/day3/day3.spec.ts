import {bitCounts, findCo2Scrubber, findOxygenScrubber, genEpsilon, genGamma} from './day3';


describe('Day3', () => {
    it('should find bitcounts', () => {
        let result = bitCounts([
            '1100',
            '1000',
            '1100',
            '1010',
            '1101',
            '1001',
            '1101',
        ]);

        let expected = [7, 1, -5, -1];
        expect(result).toEqual(expected);
    });

    it('gen gamma should use most common bit', () => {
        let bitCounts = [4, -5, 6, 12, -7];
        let gamma = genGamma(bitCounts);
        expect(gamma).toEqual(22)
    });

    it('gen epsilong should use least common bit', () => {
        let bitCounts = [4, -5, 6, 12, -7];
        let gamma = genEpsilon(bitCounts);
        expect(gamma).toEqual(9)
    });

    it('should find oxygen rating', function () {
        let input = ['00100',
            '11110',
            '10110',
            '10111',
            '10101',
            '01111',
            '00111',
            '11100',
            '10000',
            '11001',
            '00010',
            '01010'];

        let result = findOxygenScrubber(input);
        expect(result).toEqual(23);
    });

    it('should find the co2 scrubber rating', function () {
        let input = ['00100',
            '11110',
            '10110',
            '10111',
            '10101',
            '01111',
            '00111',
            '11100',
            '10000',
            '11001',
            '00010',
            '01010'];

        let result = findCo2Scrubber(input);
        expect(result).toEqual(10);
    });
});
