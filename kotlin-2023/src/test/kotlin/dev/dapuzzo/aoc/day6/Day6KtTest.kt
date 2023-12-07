package dev.dapuzzo.aoc.day6

import org.assertj.core.api.Assertions.assertThat
import org.assertj.core.data.Percentage
import org.junit.jupiter.api.Test

class Day6KtTest {
    @Test
    fun `should find roots of quadratic`() {
        val roots = findRootsOfQuadraticEquation(-1.0, 7.0, -9.0)
        assertThat(roots.first).isCloseTo(1.69, Percentage.withPercentage(1.0))
        assertThat(roots.second).isCloseTo(5.3, Percentage.withPercentage(1.0))
    }
}