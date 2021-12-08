import {BingoBoard, Day4} from './day4';
import {runDay} from '../Day';

describe('Day4', function () {
    let board: BingoBoard;

    beforeEach(function () {
        board = new BingoBoard(
            '22 13 17 11  0\n' +
            ' 8  2 23  4 24\n' +
            '21  9 14 16  7\n' +
            ' 6 10  3 18  5\n' +
            ' 1 12 20 15 19'
        );
    });
    describe('Validating a Bingo', function () {
        it('should not give a bingo when no number has been called', function () {
            const numbers: number[] = [];
            expect(checkBingo(board, numbers)).toBeFalsy()
        });
        it('should not give a bingo when a smattering of numbers are called', function () {
            const numbers: number[] = [13, 11, 8, 23, 24, 9, 16, 6, 3, 5, 12, 15];
            expect(checkBingo(board, numbers)).toBeFalsy()
        });

        it('should call a bingo for horizontal lines', function () {
            expect(checkBingo(board, [22, 13, 17, 11, 0])).toBeTruthy()
            expect(checkBingo(board, [6, 10, 14, 1, 20, 15, 19])).toBeTruthy()
        });

        it('should call a bingo for vertical lines', function () {
            expect(checkBingo(board, [22, 8, 21, 6, 1])).toBeTruthy()
            expect(checkBingo(board, [17, 2, 23, 14, 3, 20])).toBeTruthy()
        });

        it('should call bingo for both diagonals', function () {
            expect(checkBingo(board, [1, 10, 14, 4, 0])).toBeTruthy()
            expect(checkBingo(board, [22, 2, 14, 18, 19])).toBeTruthy()
        });
    });

    it('should give me the score', function () {
        [22, 13, 17, 11, 0,
            8, 2, 23, 4, 24,
            21, 9, 14, 16, 7,
            6, 10, 3, 18, 5,
            1, 12, 20].forEach(number => board.callNumber(number));

        expect(board.getScore(20)).toEqual((19 + 15) * 20)
    });

    it('should be correct', function () {
        let result = runDay(Day4)
        expect(result.part1).toEqual(46920)
        expect(result.part2).toEqual(12635)
    });
});


export const checkBingo = (board: BingoBoard, numbers: number[]): boolean => {
    numbers.forEach(it => board.callNumber(it));
    return board.hasBingo();
}