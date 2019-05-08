package com.dapuzzo.devon.adventOfCode._2018

import com.dapuzzo.devon.adventOfCode.AdventOfCodeDay

class Day3(input: List<String>) : AdventOfCodeDay(3) {

    private val claims = input
        .map { Claim(it) }

    private val overlappingSquares: List<List<Coordinate>> = claims
        .flatMap { it.coordinates }
        .groupingBy { it.location }
        .foldTo(mutableMapOf(), emptyList()) { acc: List<Coordinate>, e: Coordinate -> acc + listOf(e) }
        .values
        .filter { it.size > 1 }

    private val overlappingClaimIds: Set<Int> = overlappingSquares
        .flatten()
        .map { it.id }
        .toSet()

    private val nonOverlappingClaimIds: List<Int> = claims
        .map { it.id }
        .filter { !overlappingClaimIds.contains(it) }

    override fun part1() = overlappingSquares.size
    override fun part2() = nonOverlappingClaimIds

}

class Coordinate(x: Int, y: Int, val id: Int = 0) {
    val location = x * 10000 + y
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

    val coordinates: List<Coordinate> = (xOrigin until (xOrigin + width)).flatMap { x ->
        (yOrigin until (yOrigin + height)).map { y ->
            Coordinate(x, y, id)
        }
    }
}