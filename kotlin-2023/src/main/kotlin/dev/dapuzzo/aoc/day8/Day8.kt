package dev.dapuzzo.aoc.day8

import dev.dapuzzo.aoc.Day

fun <T> Sequence<T>.whileTrue() = sequence { while (true) yieldAll(this@whileTrue) }

class Day8(val input: List<String>) : Day<Long>(8) {

    private val instructions = input[0]
    private val nodeMap = input.drop(2)
        .associateBy({ it.substring(0, 3) }) {
            it.substring(7, 10) to it.substring(12, 15)
        }

    private fun traverseMap(startingPoint: String, endingCondition: (String) -> Boolean): Int {
        return instructions
            .asSequence()
            .whileTrue()
            .scan(startingPoint) { nodeId: String, instruction: Char ->
                nodeId.nextNode(instruction)
            }.indexOfFirst(endingCondition)
    }

    override fun part1(): Long =
        traverseMap("AAA") { it == "ZZZ" }.toLong()


    override fun part2(): Long {
        return nodeMap.keys
            .filter { it.endsWith("A") }
            .map { id -> traverseMap(id) { it.endsWith("Z") } }
            .lcm()
    }

    private fun String.nextNode(instruction: Char): String {
        return when (instruction) {
            'R' -> nodeMap[this]!!.second
            'L' -> nodeMap[this]!!.first
            else -> {
                throw Exception("instruction $instruction not found")
            }
        }
    }
}

fun List<Int>.lcm(): Long = map { it.toLong() }.reduceRight { a, b -> lcm(a, b) }

fun lcm(a: Long, b: Long): Long = a / gcd(a, b) * b

fun gcd(a: Long, b: Long): Long = if (b == 0L) a else gcd(b, a % b)