package dev.dapuzzo.aoc.day7

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test

class Day7Test {
    val mainExample = Day7(
        listOf("32T3K 765", "T55J5 684", "KK677 28", "KTJJT 220", "QQQJA 483")
    )

    @Test
    fun `should work on example`() {
        assertThat(mainExample.part1()).isEqualTo(6440)
    }

    @Test
    fun `should work on example part 2`() {
        assertThat(mainExample.part2()).isEqualTo(5905)
    }
}