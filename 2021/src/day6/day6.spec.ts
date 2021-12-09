import {populationAfterDays, simulateSchoolOfFishBreeding} from './day6';


describe('Population finder', () => {
    it('should tell me the population of a single ', function () {
        expect(populationAfterDays(0, 0)).toEqual(1);
        expect(populationAfterDays(0, 1)).toEqual(2);
        expect(populationAfterDays(0, 7)).toEqual(2);
        expect(populationAfterDays(0, 8)).toEqual(3);
        expect(populationAfterDays(0, 9)).toEqual(3);
        expect(populationAfterDays(0, 10)).toEqual(4);
        expect(populationAfterDays(0, 13)).toEqual(4);
        expect(populationAfterDays(0, 14)).toEqual(4);
        expect(populationAfterDays(0, 15)).toEqual(5);
        expect(populationAfterDays(0, 16)).toEqual(5);
        expect(populationAfterDays(0, 17)).toEqual(7);
        expect(populationAfterDays(0, 18)).toEqual(7);
        expect(populationAfterDays(0, 19)).toEqual(8);


        expect(populationAfterDays(1, 0)).toEqual(1);
        expect(populationAfterDays(1, 1)).toEqual(1);
        expect(populationAfterDays(1, 10)).toEqual(3);
        expect(populationAfterDays(1, 11)).toEqual(4);
        expect(populationAfterDays(1, 17)).toEqual(5);
        expect(populationAfterDays(1, 18)).toEqual(7);
    })

    it('should simulate a school', function () {
        let result = simulateSchoolOfFishBreeding([3, 4, 3, 1, 2], 80)
        expect(result).toEqual(5934)
    });
});
