package com.dapuzzo.devon.adventOfCode._2018

import com.dapuzzo.devon.adventOfCode.AdventOfCodeDay

class Day3(private val input: List<String>) : AdventOfCodeDay(3) {
    override fun part1() = Fabric(1000)
        .apply {
            input
                .map { Claim(it) }
                .forEach { this.claim(it) }
        }.numberOfDoubles
}

class Claim(ticket: String) {
    private val parameters = ticket
        .replace("#", "")
        .replace("x", " ")
        .replace(",", " ")
        .replace("@ ", "")
        .replace(":", "")
        .split(" ")
        .map { it.toInt() }

    val id = parameters[0]
    val xOrigin = parameters[1]
    val yOrigin = parameters[2]
    val width = parameters[3]
    val height = parameters[4]

    val coordinates: List<Pair<Int, Int>> = (xOrigin until (xOrigin + width)).flatMap { x ->
        (yOrigin until (yOrigin + height)).map { y ->
            Pair(x, y)
        }
    }
}

class Fabric(private val squares: List<MutableList<Int>>) {

    constructor(dimension: Int) : this(
        (0 until dimension).map {
            (0 until dimension).map {
                0
            }.toMutableList()
        })

    val numberOfDoubles: Int
        get() = squares.map { mutableList ->
            mutableList.reduce { rowSum, i ->
                if (i > 1) rowSum + 1 else rowSum
            }
        }.sum()

    fun claim(claim: Claim): Fabric {
        claim.coordinates.forEach {
            squares[it.second][it.first]++
        }
        return this
    }

    override fun toString(): String = squares.joinToString("\n") { row -> row.joinToString("") }
}