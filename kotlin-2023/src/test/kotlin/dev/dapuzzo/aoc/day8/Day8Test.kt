package dev.dapuzzo.aoc.day8

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test

class Day8Test {

    @Test
    fun `should work with canned input`() {
        val result = Day8(
            listOf(
                "RL",
                "",
                "AAA = (BBB, CCC)",
                "BBB = (DDD, EEE)",
                "CCC = (ZZZ, GGG)",
                "DDD = (DDD, DDD)",
                "EEE = (EEE, EEE)",
                "GGG = (GGG, GGG)",
                "ZZZ = (ZZZ, ZZZ)",
            )
        ).part1()
        assertThat(result).isEqualTo(2)
    }

    @Test
    fun `should work with canned repeating`() {
        val result = Day8(
            listOf(
                "LLR",
                "",
                "AAA = (BBB, BBB)",
                "BBB = (AAA, ZZZ)",
                "ZZZ = (ZZZ, ZZZ)",
            )
        ).part1()
        assertThat(result).isEqualTo(6)
    }

    @Test
    fun `should do ghost traversal`() {
        val result = Day8(
            listOf(
                "LR",
                "",
                "11A = (11B, XXX)",
                "11B = (XXX, 11Z)",
                "11Z = (11B, XXX)",
                "22A = (22B, XXX)",
                "22B = (22C, 22C)",
                "22C = (22Z, 22Z)",
                "22Z = (22B, 22B)",
                "XXX = (XXX, XXX)"
            )
        ).part2()
        assertThat(result).isEqualTo(6)
    }
}