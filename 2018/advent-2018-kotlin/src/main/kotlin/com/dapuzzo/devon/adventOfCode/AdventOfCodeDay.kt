package com.dapuzzo.devon.adventOfCode

abstract class AdventOfCodeDay(private val dayNumber: Int) {
    open fun part1(): Any {
        return "NOTHING YET"
    }

    open fun part2(): Any {
        return "NOTHING YET"
    }

    fun run() {
        part1().also { printResult(1, it) }
        part2().also { printResult(2, it) }
    }

    private fun printResult(partNumber: Int, value: Any) =
        println("Day $dayNumber | Part $partNumber:  $value")
}