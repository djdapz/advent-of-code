package dev.dapuzzo.aoc.day6

import dev.dapuzzo.aoc.Day
import kotlin.math.ceil
import kotlin.math.floor
import kotlin.math.round

class Day6(val input: List<String>) : Day(6) {
    val times = input[0].split(":")[1].trim().split(" ").filter { it.isNotEmpty() }.map { it.toDouble() }
    val distances = input[1].split(":")[1].trim().split(" ").filter { it.isNotEmpty() }.map { it.toDouble() }

    override fun part1(): Int {
        return times.zip(distances).map { (timeLimit, distance) ->
            getRangeOfWinnableTimes(timeLimit, distance)
        }
            .also { println(it) }
            .map { it.second - it.first + 1 }
            .also { println(it) }
            .fold(1, Math::multiplyExact)
    }

    override fun part2(): Int {
        val bigTime = input[0].split(":")[1].replace(" ", "").toDouble()
        val bigDistance = input[1].split(":")[1].replace(" ", "").toDouble()

        val result = getRangeOfWinnableTimes(bigTime, bigDistance)
        return result.second - result.first + 1
    }


}

fun getRangeOfWinnableTimes(timeLimit: Double, distance: Double): Pair<Int, Int> {
    val root = findRootsOfQuadraticEquation(-1.0, timeLimit, -1.0 * distance)
    return ceil(root.first).toInt() to floor(root.second).toInt()
}

fun findRootsOfQuadraticEquation(a: Double, b: Double, c: Double): Pair<Double, Double> {
    val sqr = Math.sqrt(b * b - 4 * a * c)
    val big = -b + sqr
    val small = -b - sqr
    return big / (2 * a) to small / (2 * a)
}