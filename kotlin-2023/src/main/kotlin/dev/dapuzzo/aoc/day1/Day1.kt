package dev.dapuzzo.aoc.day1

import dev.dapuzzo.aoc.Day

class Day1(val callibrationValues: List<String>) : Day<Int>(1) {
    override fun part1() =
        callibrationValues.sumOf {
            it.calculateCalibrationValue()
        }


    override fun part2(): Int = callibrationValues
        .map { it.replaceVerbalNumbers() }
        .sumOf {
            it.calculateCalibrationValue()
        }
}

fun String.calculateCalibrationValue(): Int =
    toCharArray()
        .filter { char -> char.isDigit() }
        .run {
            first().digitToInt() * 10 + last().digitToInt()
        }

fun String.replaceVerbalNumbers() = replace("one", "o1e")
    .replace("two", "t2o")
    .replace("three", "t3e")
    .replace("four", "4")
    .replace("five", "5e")
    .replace("six", "6")
    .replace("seven", "7n")
    .replace("eight", "e8t")
    .replace("nine", "n9e")
    .replace("zero", "0o")