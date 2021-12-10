import {costForPosition, findLowestCost} from './day7';

describe('day7', function () {
    it('should tell me the heuristic', function () {
        let whales = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]
        let cost = costForPosition(whales, 2);
        expect(cost).toEqual(37);
    });

    it('find lowest cost', function () {
        let whales = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]
        expect(findLowestCost('LINEAR')(whales)).toEqual(37)
    });

    it('should tell me the heuristic', function () {
        let whales = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]
        let cost = costForPosition(whales, 5, 'CRAB');
        expect(cost).toEqual(168);
    });
});