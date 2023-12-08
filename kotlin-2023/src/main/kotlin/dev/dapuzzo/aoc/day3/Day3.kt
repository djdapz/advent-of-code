package dev.dapuzzo.aoc.day3

import dev.dapuzzo.aoc.Day

class Day3(val input: List<String>) : Day<Int>(3) {
    override fun part1(): Int {
        return input.getAllNumbers().filter {
            input.isValidNumber(it)
        }.sumOf { it.value }
    }

    override fun part2(): Int {
        return input.getAll('*').mapNotNull {
            input.getGearRatio(it)
        }.sum()
    }
}

private fun List<String>.extractNumbersFromRowCenteredOn(coordinate: Coordinate): Collection<Int> {
    val mapNotNull = listOf(
        coordinate.copy(col = coordinate.col - 1),
        coordinate,
        coordinate.copy(col = coordinate.col + 1),
    ).mapNotNull { this.extractNumber(it) }

    return if (this.safeGet(coordinate)?.isDigit() == true) {
        mapNotNull.toSet()
    } else {
        mapNotNull
    }
}


private fun List<String>.getGearRatio(coordinate: Coordinate): Int? {
    val topNumbers = extractNumbersFromRowCenteredOn(coordinate.copy(row = coordinate.row - 1))
    val bottomNumbers = extractNumbersFromRowCenteredOn(coordinate.copy(row = coordinate.row + 1))

    val sideNumbers = listOf(
        coordinate.copy(col = coordinate.col + 1),
        coordinate.copy(col = coordinate.col - 1),
    ).mapNotNull { this.extractNumber(it) }

    val numbers = bottomNumbers + sideNumbers + topNumbers

    if (numbers.size != 2) {
        if (numbers.size > 2) throw Exception("Did not expect more than 2 numbers. Coordinate: ${coordinate}. Numbers: $numbers")
        return null
    }

    return numbers.reduce { acc, i -> acc * i }
}


private fun List<String>.extractNumber(coordinate: Coordinate): Int? {
    val char = this.safeGet(coordinate)
    if (char?.isDigit() != true) return null
    var endIndex = this.first().lastIndex
    var startIndex = 0
    for (index in coordinate.col + 1..this.first().lastIndex) {
        if (this.safeGet(coordinate.copy(col = index))?.isDigit() != true) {
            endIndex = index - 1
            break
        }
    }
    for (index in (coordinate.col - 1) downTo 0) {
        if (this.safeGet(coordinate.copy(col = index))?.isDigit() != true) {
            startIndex = index + 1
            break
        }
    }
    return this[coordinate.row].substring(startIndex, endIndex + 1).toInt()
}

private fun List<String>.getAll(targetChar: Char): List<Coordinate> = this.flatMapIndexed { rowNum, row ->
    row.mapIndexed { colNum, char ->
        if (char == targetChar) {
            return@mapIndexed Coordinate(rowNum, colNum)
        }
        return@mapIndexed null
    }
}.filterNotNull()


data class NextNumber(val value: Int, val row: Int, val colStart: Int, val colEnd: Int)
data class Coordinate(val row: Int, val col: Int)

fun List<String>.getAllNumbers(): List<NextNumber> {
    var startIndex: Int = -1
    var number = 0
    fun reset() {
        number = 0
        startIndex = -1
    }
    return this.flatMapIndexed { rowNum, row ->
        row.mapIndexed { colNum, char ->
            if (char.isDigit()) {
                number = number * 10 + char.digitToInt()
                if (startIndex == -1) startIndex = colNum
                if (colNum == row.lastIndex) {
                    return@mapIndexed NextNumber(number, rowNum, startIndex, colNum - 1).also { reset() }
                }
            } else {
                if (number > 0) {
                    return@mapIndexed NextNumber(number, rowNum, startIndex, colNum - 1).also { reset() }
                }
            }
            return@mapIndexed null
        }
    }.filterNotNull()
}


private fun Char.isSymbol() = !isDigit() && !this.isPeriod()
private fun Char.isPeriod() = this == '.'
fun List<String>.safeGet(coordinate: Coordinate): Char? =
    this.getOrNull(coordinate.row)?.getOrNull(coordinate.col)

private fun List<String>.isValidNumber(nextNumber: NextNumber): Boolean {

    val verticalChars = listOf(
        Coordinate(nextNumber.row, nextNumber.colStart - 1),
        Coordinate(nextNumber.row - 1, nextNumber.colStart - 1),
        Coordinate(nextNumber.row + 1, nextNumber.colStart - 1),

        Coordinate(nextNumber.row, nextNumber.colEnd + 1),
        Coordinate(nextNumber.row - 1, nextNumber.colEnd + 1),
        Coordinate(nextNumber.row + 1, nextNumber.colEnd + 1)
    )
    val horizontalChars = (nextNumber.colStart..nextNumber.colEnd).flatMap { colNumber ->
        listOf(
            Coordinate(nextNumber.row - 1, colNumber),
            Coordinate(nextNumber.row + 1, colNumber)
        )
    }

    return (verticalChars + horizontalChars)
        .mapNotNull { this.safeGet(it) }.any { it.isSymbol() }
}
