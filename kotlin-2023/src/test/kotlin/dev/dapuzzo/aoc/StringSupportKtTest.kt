package dev.dapuzzo.aoc

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test

class StringSupportKtTest {
    @Test
    fun `should get a number following a target`() {
        val result = "Game 4: 123".findNumberFollowing("Game")
        assertThat(result).isEqualTo(4)
    }

    @Test
    fun `should find preceding number`() {
        assertThat("5 green, 4 potato".findNumberPreceding(" potato")).isEqualTo(4)
        assertThat("5 green, 14 orange".findNumberPreceding(" orange")).isEqualTo(14)
    }
}