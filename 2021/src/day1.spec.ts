import {  part1, part2 } from './day1';
import { readNumberList } from './read';

describe('day1', () => {
  it('should parse input', () => {
    const input = `
    1
    2
    3
    400`;
    const expected = [1, 2, 3, 400];
    let actual = readNumberList(input);
    expect(actual).toEqual(expected);
  });

  it('say how many increasess there are', () => {
    const input = [1, 2, 3, 4, 5, 4, 6];
    const actual = part1(input);
    expect(actual).toEqual(5);
  });

  it('should say how many window increaeses happen', () => {
    const input = [
      199,
      200,
      208,
      210,
      200,
      207,
      240,
      269,
      260,
      263];

    const acutal = part2(input)
    expect(acutal).toEqual(5)
  });
});
