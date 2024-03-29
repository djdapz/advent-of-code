package dev.dapuzzo.aoc.day4

import dev.dapuzzo.aoc.FileReader
import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test

class Day4Test {
    @Test
    fun `should get sum of scores`() {
        val result = Day4(listOf("Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53")).part1()
        assertThat(result).isEqualTo(8)
    }

    @Test
    fun `should set score to zero when no matches`() {
        val result = Day4(listOf("Card 1: 1 2 3 4 | 83 86  6 31 17  9 48 53")).part1()
        assertThat(result).isEqualTo(0)
    }

    @Test
    fun `should work with copy rules`() {
        val result = Day4(
            listOf(
                "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53",
                "Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19",
                "Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1",
                "Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83",
                "Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36",
                "Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11",
            )
        ).part2()
        assertThat(result).isEqualTo(30)
    }

    @Test
    fun `should work for real input`() {
        val result = Day4(
            FileReader("day4.txt").readAsList()
        ).part2()

        assertThat(result).isEqualTo(13114317)
    }
}