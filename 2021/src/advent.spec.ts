import { input, part1, part2 } from './day1';
import { readNumberList } from './read';

describe("do it", () => {
  it('should do it', () => {
    console.log(part1(readNumberList(input)));
    console.log(part2(readNumberList(input)));
  });
})
