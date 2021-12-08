import {DayConfig} from '../Day';

type Coordinate = { row: number, col: number, called: boolean }

export class BingoBoard {
    readonly coordinates: Map<number, Coordinate> = new Map<number, Coordinate>()
    readonly called: boolean[][]

    constructor(boardAsString: string) {
        let board = boardAsString
            .split('\n')
            .map((row) => row
                .trim()
                .split(/ +/)
            );

        board.forEach((row, rowNumber) =>
            row.forEach((cell, colNumber) => {
                let contents = parseInt(cell);
                this.coordinates.set(contents, {row: rowNumber, col: colNumber, called: false});
            }))

        this.called = board.map(row => row.map(() => false));
    }

    callNumber(it: number): BingoBoard {
        const coordinate = this.coordinates.get(it);
        if (coordinate == null) return this;
        const {row, col} = coordinate
        coordinate.called = true;
        this.called[row][col] = true;
        return this;
    }

    hasBingo(): boolean {
        const areAllTrue = (list: boolean[]): boolean => list.reduce((a, b) => a && b, true);
        for (const calledRow of this.called) {
            if (areAllTrue(calledRow)) {
                return true;
            }
        }

        for (let col = 0; col < this.called.length; col++) {
            if (areAllTrue(this.getIndeceesOfCalledMatrix().map(row => this.called[row][col]))) {
                return true;
            }
        }

        let topLeftToBottomRight = this.getIndeceesOfCalledMatrix().map(i => this.called[i][i]);
        let topRightToBottomLeft = this.getIndeceesOfCalledMatrix().map(i => this.called[i][this.called.length - 1 - i]);
        return areAllTrue(topLeftToBottomRight) || areAllTrue(topRightToBottomLeft);
    }

    private getIndeceesOfCalledMatrix = () => [...Array(this.called[0].length).keys()]

    getScore(lastCalled: number) {
        const sumOfUncalled = [...this.coordinates.entries()]
            .filter(it => !it[1].called)
            .reduce((a, b) => a + b[0], 0);
        return sumOfUncalled * lastCalled;
    }
}

type BingoBoardPuzzleInput =
    { boards: BingoBoard[], numbersToCall: number[] }

export const Day4: DayConfig<BingoBoardPuzzleInput> = {
    dayNumber: 4,
    parseInput(rawInput: string): BingoBoardPuzzleInput {
        let [input, ...rawBoards] = rawInput.split('\n\n');

        let numbersToCall = input.split(',').map(it => parseInt(it));
        let boards = rawBoards.map(it => new BingoBoard(it));

        return {
            numbersToCall,
            boards
        };
    },
    part1(input: BingoBoardPuzzleInput): number {
        for (const number of input.numbersToCall) {
            for (const board of input.boards) {
                board.callNumber(number);
                if (board.hasBingo()) return board.getScore(number)
            }
        }
        return 0;
    },
    part2(input: BingoBoardPuzzleInput): number {
        let boards = input.boards;
        for (const number of input.numbersToCall) {
            boards = boards
                .map(it => it.callNumber(number))
                .filter(it => !it.hasBingo());
            if (boards.length === 1) {
                break;
            }
        }
        const board = boards[0]
        for (const number of input.numbersToCall) {
            board.callNumber(number);
            if (board.hasBingo()) return board.getScore(number)
        }
        return 0;
    }
}