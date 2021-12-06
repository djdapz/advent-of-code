import { match } from 'ts-pattern';
import { DayConfig } from '../Day';
import { readStringList } from '../read';

export const part1 = (commands: string[]): number => {
  let final = commands.map(wordToCommand)
    .reduce((prev: Position, command: Command) =>
        match(command)
          .with({ direction: 'up' }, ({ amount }) => ({ ...prev, vertical: prev.vertical + amount }))
          .with({ direction: 'down' }, ({ amount }) => ({ ...prev, vertical: prev.vertical - amount }))
          .with({ direction: 'forward' }, ({ amount }) => ({ ...prev, horizontal: prev.horizontal + amount }))
          .exhaustive()
      , { vertical: 0, horizontal: 0, aim: 0 });

  return Math.abs(final.horizontal * final.vertical);
};

export const part2 = (commands: string[]): number => {
  let final = commands.map(wordToCommand)
    .reduce((prev: Position, command: Command) =>
        match(command)
          .with({ direction: 'up' }, ({ amount }) => ({ ...prev, aim: prev.aim + amount }))
          .with({ direction: 'down' }, ({ amount }) => ({ ...prev, aim: prev.aim - amount }))
          .with({ direction: 'forward' }, ({ amount }) => ({
            ...prev,
            horizontal: prev.horizontal + amount,
            vertical: prev.aim * amount + prev.vertical,
          }))
          .exhaustive()
      , { vertical: 0, horizontal: 0, aim: 0 });

  return Math.abs(final.horizontal * final.vertical);
};

const wordToCommand = (word: string): Command => {
  let parts = word.split(' ');
  return {
    direction: parts[0] as direction,
    amount: parseInt(parts[1]),
  };
};

interface Command {
  direction: direction,
  amount: number
}

interface Position {
  vertical: number,
  horizontal: number,
  aim: number
}

type direction = 'forward' | 'down' | 'up'

export const Day2: DayConfig<string[]> = {
  dayNumber: 2,
  parseInput: readStringList,
  part1,
  part2,
};

