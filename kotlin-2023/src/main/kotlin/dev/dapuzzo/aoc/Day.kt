package dev.dapuzzo.aoc

import kotlin.time.measureTimedValue

abstract class Day<T>(private val number: Int, private val slow: Boolean = false) {

    abstract fun part1(): T
    abstract fun part2(): T

    fun run(runEvenIfSlow: Boolean = false) {
        println("-------------------------------------------".format())
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
        println("Day %2d |  %5sμs | Part 1: %14d  ".format(number, part1Time.inWholeMicroseconds, part1Result))
        println("       |  %5sμs | Part 2: %14d  ".format(part2Time.inWholeMicroseconds, part2Result))
    }
}