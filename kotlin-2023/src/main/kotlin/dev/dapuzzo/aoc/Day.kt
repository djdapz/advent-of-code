package dev.dapuzzo.aoc

import java.time.Clock
import java.util.Timer
import kotlin.time.measureTimedValue

abstract class Day(private val number: Int) {

    abstract fun part1(): Int
    abstract fun part2(): Int

    fun run() {
        val (part1Result, part1Time) = measureTimedValue {
            part1()
        }

        val (part2Result, part2Time) = measureTimedValue {
            part2()
        }
        println("Day $number")
        println(" Part 1: %8d|%5sms".format(part1Result, part1Time.inWholeMicroseconds))
        println(" Part 2: %8d|%5sms".format(part2Result, part2Time.inWholeMicroseconds))
    }
}