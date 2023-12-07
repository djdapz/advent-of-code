package dev.dapuzzo.aoc.day6

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test

class Day6Test {
    @Test
    fun `should work for example`() {
        val part1 = Day6(
            listOf("Time:      7  15   30", "Distance:  9  40  200")
        ).part1()
    }

    @Test
    fun `should get range of winnable times`() {
        assertThat(getRangeOfWinnableTimes(7.0, 9.0)).isEqualTo(2 to 5)
        assertThat(getRangeOfWinnableTimes(15.0, 40.0)).isEqualTo(4 to 11)
    }

}