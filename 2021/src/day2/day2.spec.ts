import { part1, part2 } from './day2';

describe('day2', () => {
  it('should work for example', () => {
    let commands = [
      'forward 5'
      , 'down 5'
      , 'forward 8'
      , 'up 3'
      , 'down 8'
      , 'forward 2',
    ];
    let result = part1(commands);
    expect(result).toEqual(150)
  });

  it('should work with aim', () => {
    let commands = [
      'forward 5'
      , 'down 5'
      , 'forward 8'
      , 'up 3'
      , 'down 8'
      , 'forward 2',
    ];
    let result = part2(commands);
    expect(result).toEqual(900)
  });
});
