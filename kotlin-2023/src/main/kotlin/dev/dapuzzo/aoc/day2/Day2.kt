package dev.dapuzzo.aoc.day2

import dev.dapuzzo.aoc.Day

class Day2(input: List<String>) : Day<Int>(2) {
    private val games = input.map { Game.parse(it) }
    override fun part1() =
        games.filter {
            it.maxTurn.blue <= 14
                    && it.maxTurn.red <= 12
                    && it.maxTurn.green <= 13
        }.sumOf { it.id }

    override fun part2() =
        games.sumOf { it.power }
}

