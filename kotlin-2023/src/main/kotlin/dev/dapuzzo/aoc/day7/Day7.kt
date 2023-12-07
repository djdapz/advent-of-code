package dev.dapuzzo.aoc.day7

import dev.dapuzzo.aoc.Day

class Day7(input: List<String>) : Day(7) {
    val hands = input.map { it.split(" ") }.map { it[0] to it[1].toInt() }
    override fun part1(): Int {
        return hands
            .sortedWith { a, b ->
                compareHands(a.first, b.first, HandTypeMode.NORMAL)
            }
            .mapIndexed { index, it -> Triple(it.first, it.second, index + 1) }
            .sumOf { it.second * it.third }
    }

    override fun part2(): Int {
        return hands
            .sortedWith { a, b ->
                compareHands(a.first, b.first, HandTypeMode.JOKER)
            }
            .mapIndexed { index, it ->
                Triple(
                    it.first to it.first.getHandType(HandTypeMode.JOKER),
                    it.second,
                    index + 1
                )
            }
            .sumOf { it.second * it.third }
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

enum class HandTypeMode {
    NORMAL,
    JOKER
}

fun String.getCharCounts(handTypeMode: HandTypeMode): List<Int> {
    val realCards: List<Char> = when (handTypeMode) {
        HandTypeMode.JOKER -> this.toCharArray().filter { it != 'J' }
        HandTypeMode.NORMAL -> this.toCharArray().toList()
    }
    val jokerCount = 5 - realCards.count()
    var charCounts = realCards.groupBy { it }.map { it.value.count() }.sorted().toMutableList()
    if (jokerCount == 5) {
        return listOf(5)
    }
    charCounts[charCounts.lastIndex] += jokerCount

    while (charCounts.sum() > 5) {
        charCounts[0] -= 1
        if (charCounts[0] == 0) {
            charCounts = charCounts.drop(1).toMutableList()
        }
    }
    return charCounts
}

fun String.getHandType(handType: HandTypeMode = HandTypeMode.JOKER): HandType {
    val charCounts = getCharCounts(handType)
    val maxes = charCounts.max()
    return when (maxes) {
        5 -> HandType.FIVE
        4 -> HandType.FOUR
        3 ->
            if (charCounts == listOf(2, 3)) {
                HandType.FULL
            } else {
                HandType.THREE
            }

        2 ->
            if (charCounts == listOf(1, 2, 2)) {
                HandType.TWO
            } else {
                HandType.PAIR
            }

        1 -> HandType.HIGH
        else -> throw Exception("wut")
    }
}

fun compareHands(hand1: String, hand2: String, mode: HandTypeMode = HandTypeMode.NORMAL): Int {

    val difference = hand2.getHandType(mode).rank - hand1.getHandType(mode).rank
    if (difference != 0) {
        return difference
    }

    val firstDifference = hand1.zip(hand2).first {
        it.first != it.second
    }

    return firstDifference.second.toRank(mode) - firstDifference.first.toRank(mode)
}

private fun Char.toRank(mode: HandTypeMode): Int {
    return when {
        this == 'A' -> 1
        this == 'K' -> 2
        this == 'Q' -> 3
        this == 'J' -> when (mode) {
            HandTypeMode.NORMAL -> 4
            HandTypeMode.JOKER -> 15
        }

        this == 'T' -> 5
        else -> {
            15 - this.digitToInt()
        }
    }
}
