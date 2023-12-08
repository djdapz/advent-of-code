package dev.dapuzzo.aoc.day7

import dev.dapuzzo.aoc.Day

class Day7(input: List<String>) : Day<Int>(7) {
    val hands = input.map { it.split(" ") }.map { it[0] to it[1].toInt() }

    override fun part1(): Int {
        return hands
            .map { Hand(it.first) to it.second }
            .sortedBy { it.first }
            .mapIndexed { index, it -> it.second * (index + 1) }
            .sum()
    }

    override fun part2(): Int {
        return hands
            .map { Hand(it.first, HandTypeMode.JOKER) to it.second }
            .sortedBy { it.first }
            .mapIndexed { index, it -> it.second * (index + 1) }
            .sum()
    }
}

enum class HandType(val rank: Int) {
    FIVE(1),
    FOUR(2),
    FULL(3),
    THREE(4),
    TWO(5),
    PAIR(6),
    HIGH(7)
}

enum class HandTypeMode() {
    NORMAL,
    JOKER
}

class Hand(val cards: String, val mode: HandTypeMode = HandTypeMode.NORMAL) : Comparable<Hand> {
    val type: HandType = run {
        val (max, size) = cards.getCharCounts()
        when (max) {
            5 -> HandType.FIVE
            4 -> HandType.FOUR
            3 ->
                if (size == 2) {
                    HandType.FULL
                } else {
                    HandType.THREE
                }

            2 ->
                if (size == 3) {
                    HandType.TWO
                } else {
                    HandType.PAIR
                }

            1 -> HandType.HIGH
            else -> throw Exception("wut")
        }
    }


    fun String.getCharCounts(): Pair<Int, Int> {
        val realCards: String = when (mode) {
            HandTypeMode.JOKER -> this.replace("J", "")
            HandTypeMode.NORMAL -> this
        }

        val countMap = realCards.fold(mutableMapOf<Char, Int>()) { map, it ->
            map.apply { put(it, map[it]?.plus(1) ?: 1) }
        }

        var charCounts = countMap.map { it.value }.toMutableList()
        if (mode == HandTypeMode.JOKER) {
            if (realCards.isEmpty()) return 5 to 1
            val jokerCount = 5 - realCards.length
            charCounts = charCounts.sorted().toMutableList()
            charCounts[charCounts.lastIndex] += jokerCount
            while (charCounts.sum() > 5) {
                charCounts[0] -= 1
                if (charCounts[0] == 0) {
                    charCounts = charCounts.drop(1).toMutableList()
                }
            }
        }
        return charCounts.max() to charCounts.size
    }

    override fun compareTo(
        other: Hand
    ): Int {
        val difference = other.type.rank - this.type.rank
        if (difference != 0) {
            return difference
        }

        val firstDifference = this.cards.zip(other.cards).first {
            it.first != it.second
        }

        return firstDifference.second.toRank(mode) - firstDifference.first.toRank(mode)
    }
}


private fun Char.toRank(mode: HandTypeMode): Int {
    return when {
        this.isDigit() -> 15 - this.digitToInt()
        this == 'A' -> 1
        this == 'K' -> 2
        this == 'Q' -> 3
        this == 'T' -> 5
        this == 'J' -> when (mode) {
            HandTypeMode.JOKER -> 15
            HandTypeMode.NORMAL -> 4
        }

        else -> throw Exception("invalid card type $this")
    }
}
