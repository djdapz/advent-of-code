package dev.dapuzzo.aoc.day3

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test

class Day3Test {
    @Test
    fun `should consider numbers with symbol at the end`() {
        val input = listOf(
            "..12%."
        )

        val result = Day3(input).part1()

        assertThat(result).isEqualTo(12)
    }

    @Test
    fun `should not consider numbers with no symbols`() {
        val input = listOf(
            "..12.."
        )

        val result = Day3(input).part1()

        assertThat(result).isEqualTo(0)
    }

    @Test
    fun `should consider with symbol in beginning`() {
        val input = listOf(
            "..%12.."
        )

        val result = Day3(input).part1()

        assertThat(result).isEqualTo(12)
    }

    @Test
    fun `should handle a number at the end`() {
        val input = listOf(
            "..%12"
        )

        val result = Day3(input).part1()

        assertThat(result).isEqualTo(12)
    }

    @Test
    fun `should evaluate rows below`() {
        val input = listOf(
            "..12..",
            "...$.."
        )

        val result = Day3(input).part1()

        assertThat(result).isEqualTo(12)
    }

    @Test
    fun `should evaluate diagonals`() {
        val input = listOf(
            "..12..",
            "....$."
        )

        val result = Day3(input).part1()

        assertThat(result).isEqualTo(12)
    }

    @Test
    fun `should calculate sums of valid numbers on test case`() {
        val input = listOf(
            "467..114..",
            "...*......",
            "..35..633.",
            "......#...",
            "617*......",
            ".....+.58.",
            "..592.....",
            "......755.",
            "...$.*....",
            ".664.598..",
        )

        val result = Day3(input).part1()

        assertThat(result).isEqualTo(4361)
    }

    @Test
    fun `should calculate sum of gear ratios of valid numbers on test case`() {
        val input = listOf(
            "467..114..",
            "...*......",
            "..35..633.",
            "......#...",
            "617*......",
            ".....+.58.",
            "..592.....",
            "......755.",
            "...$.*....",
            ".664.598..",
        )

        val result = Day3(input).part2()

        assertThat(result).isEqualTo(35 * 467 + 598 * 755)
    }


    @Test
    fun `should count vertical numbers once`() {
        val input = listOf(
            ".467......",
            "...*......",
            "...1......",
        )

        val result = Day3(input).part2()

        assertThat(result).isEqualTo(467)
    }

    @Test
    fun `should count vertical numbers twice if they're actually unique`() {
        val input = listOf(
            "467.467...",
            "...*......",
            "..........",
        )

        val result = Day3(input).part2()

        assertThat(result).isEqualTo(467 * 467)
    }

    @Test
    fun `should count vertical diagnoal numbers`() {
        val input = listOf(
            "467.......",
            "...*......",
            "...1......",
        )

        val result = Day3(input).part2()

        assertThat(result).isEqualTo(467)
    }

}