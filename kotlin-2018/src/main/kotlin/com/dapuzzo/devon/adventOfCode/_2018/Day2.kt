package com.dapuzzo.devon.adventOfCode._2018

import com.dapuzzo.devon.adventOfCode.AdventOfCodeDay
import findSimilarities
import hasExactlyThreeLetters
import hasExactlyTwoLetters


class Day2(private val input: List<String>) : AdventOfCodeDay(2) {
    override fun part1(): Int = Checksum.fromList(input).checksum

    override fun part2(): String = findSimilaritiesOfFirstOffByOne(input)
}

data class Checksum(val numberOfDoubles: Int, val numberOfTriples: Int) {
    companion object {
        fun fromList(list: List<String>): Checksum = list.fold(
            Checksum(
                0,
                0
            )
        ) { acc, string -> acc.next(string) }
    }

    val checksum = this.numberOfDoubles * this.numberOfTriples

    private fun next(s: String): Checksum =
        Checksum(nextNumDoubles(s), nextNumTriples(s))

    private fun nextNumTriples(s: String) =
        if (s.hasExactlyThreeLetters()) this.numberOfTriples + 1 else this.numberOfTriples

    private fun nextNumDoubles(s: String) =
        if (s.hasExactlyTwoLetters()) this.numberOfDoubles + 1 else this.numberOfDoubles
}


fun findSimilaritiesOfFirstOffByOne(list: List<String>): String {
    for (string1 in list) {
        for (string2 in list) {
            val similarities: String = string1.findSimilarities(string2)
            if (similarities.length == string1.length - 1) {
                return similarities
            }
        }
    }
    throw Exception("Nothing Found")
}