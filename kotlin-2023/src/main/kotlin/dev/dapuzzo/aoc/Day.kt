package dev.dapuzzo.aoc

import java.time.Clock
import java.util.Timer
import kotlin.time.measureTimedValue

abstract class Day(private val number: Int, private val slow: Boolean = false) {

    abstract fun part1(): Int
    abstract fun part2(): Int

    fun run(runEvenIfSlow: Boolean = false) {
        println("----------------------------------".format())
        if (slow && !runEvenIfSlow) {
            println("Day %2d |  __TOO SLOW".format(number))
            return
        }

        val (part1Result, part1Time) = measureTimedValue {
            part1()
        }

        val (part2Result, part2Time) = measureTimedValue {
            part2()
        }
        println("Day %2d |  Part 1: %8d | %5sms".format(number, part1Result, part1Time.inWholeMicroseconds))
        println("       |  Part 2: %8d | %5sms".format(part2Result, part2Time.inWholeMicroseconds))

    }
}