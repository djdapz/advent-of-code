package dev.dapuzzo.aoc.day1

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test

class Day1Test {
    @Test
    fun shouldCalculateCalibrationValue() {
        assertThat("a1b2c".calculateCalibrationValue()).isEqualTo(12)
        assertThat("a1bc".calculateCalibrationValue()).isEqualTo(11)
    }

    @Test
    fun shouldCalculateCalibrationValueUsingNames() {
        assertThat("one2three".replaceVerbalNumbers().calculateCalibrationValue()).isEqualTo(13)
        assertThat("two1nine".replaceVerbalNumbers().calculateCalibrationValue()).isEqualTo(29)
        assertThat("eightwothree".replaceVerbalNumbers().calculateCalibrationValue()).isEqualTo(83)
        assertThat("abcone2threexyz".replaceVerbalNumbers().calculateCalibrationValue()).isEqualTo(13)
        assertThat("xtwone3four".replaceVerbalNumbers().calculateCalibrationValue()).isEqualTo(24)
        assertThat("4nineeightseven2".replaceVerbalNumbers().calculateCalibrationValue()).isEqualTo(42)
        assertThat("zoneight234".replaceVerbalNumbers().calculateCalibrationValue()).isEqualTo(14)
        assertThat("7pqrstsixteen".replaceVerbalNumbers().calculateCalibrationValue()).isEqualTo(76)
    }
}