package dev.dapuzzo.aoc.day4

import dev.dapuzzo.aoc.Day
import dev.dapuzzo.aoc.findNumberPreceding
import kotlin.math.pow

class Day4(input: List<String>) : Day(4) {
    private val cards: List<ScratchCard> = input.map { ScratchCard.parse(it) }
    override fun part1(): Int =
        cards.sumOf { it.score }

    override fun part2(): Int {
        val cardCounts: MutableList<Int> = MutableList(cards.size) { 1 }
        cards
            .filter { it.winningNumbersCount > 0 }
            .forEach { card ->
                val winningTotal = cardCounts[card.id - 1]
                (1..card.winningNumbersCount).map { it + card.id }
                    .filter { it <= cardCounts.size }
                    .forEach { bonusCardId ->
                        cardCounts[bonusCardId - 1] = winningTotal + cardCounts[bonusCardId - 1]
                    }
            }
        return cardCounts.sum()
    }
}

infix fun Int.`^`(exponent: Int): Int = toDouble().pow(exponent).toInt()

data class ScratchCard(val id: Int, val winningNumbers: Set<Int>, val myNumbers: Set<Int>) {
    val score: Int by lazy {
        winningNumbersCount.run { 2 `^` this - 1 }
    }

    val winningNumbersCount: Int by lazy {
        winningNumbers.count {
            myNumbers.contains(it)
        }
    }

    companion object {
        fun parse(string: String): ScratchCard {
            val clauses = string.split(":")
            val id = string.findNumberPreceding(":")!!

            val numbers = clauses[1].split("|")

            val winningNumbers = numbers[0].split(" ").mapNotNull { it.toIntOrNull() }
            val myNumbers = numbers[1].split(" ").mapNotNull { it.toIntOrNull() }

            if (myNumbers.count() != 25) {
                println("bad")
            }
            return ScratchCard(
                id, winningNumbers.toSet(), myNumbers.toSet()
            )
        }
    }
}
