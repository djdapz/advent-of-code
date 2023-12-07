package dev.dapuzzo.aoc.day5

import dev.dapuzzo.aoc.Day
import java.util.stream.Collectors

class Day5(input: String) : Day(5) {
    val seeds = input.split("\n")[0].split(" ").drop(1).map { it.toLong() }
    val almanac = Almanac.parse(input.split("\n").drop(2).joinToString("\n"))
    val seedRanges = seeds.chunked(2).map { it[0]..(it[0] + it[1]) }

    override fun part1(): Int {
        return seeds.minOf { almanac.locationForSeed(it) }.toInt()
    }

    override fun part2(): Int {
        return seedRanges.parallelStream().map {
            it.minOf { seed ->
                almanac.locationForSeed(seed)
            }
        }.collect(Collectors.minBy(Long::compareTo)).get().toInt()
    }

}
