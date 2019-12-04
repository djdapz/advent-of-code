package com.dapuzzo.devon.adventOfCode._2018

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Nested
import org.junit.jupiter.api.Test
import java.time.LocalDate

class Day4KtTest {

    @Nested
    inner class ReadingInBeginningOfShift {

        private val subject = Observation("[1518-11-01 00:00] Guard #10 begins shift")

        @Test
        fun shouldReadInTime() {
            assertThat(subject.time.month.value).isEqualTo(11)
            assertThat(subject.time.year).isEqualTo(1518)
            assertThat(subject.time.hour).isEqualTo(0)
            assertThat(subject.time.minute).isEqualTo(0)
            assertThat(subject.time.dayOfMonth).isEqualTo(1)
        }

        @Test
        fun shouldReadGuardId() {
            assertThat(subject.guardId).isEqualTo(10)
        }

        @Test
        fun shouldCaptureDateThatShiftHappensOnEvenIfStartsBeforeMidnight() {
            val subject = Observation("[1518-11-01 12:58] Guard #10 begins shift")
            assertThat(subject.date).isEqualTo(LocalDate.parse("1518-11-02"))
        }

        @Test
        fun shouldNotIncrementDateIfWorkerStartsAfterMidnight() {
            val subject = Observation("[1518-11-01 00:00] Guard #10 begins shift")
            assertThat(subject.date).isEqualTo(LocalDate.parse("1518-11-01"))
        }


    }

    @Nested
    inner class CreatingTimeline {
        private val subject = Timeline(
            listOf(
                "[1518-11-01 00:00] Guard #10 begins shift",
                "[1518-11-01 00:05] falls asleep",
                "[1518-11-01 00:25] wakes up",
                "[1518-11-01 00:30] falls asleep",
                "[1518-11-01 00:55] wakes up",
                "[1518-11-01 23:58] Guard #99 begins shift",
                "[1518-11-02 00:40] falls asleep",
                "[1518-11-02 00:50] wakes up",
                "[1518-11-03 00:05] Guard #10 begins shift",
                "[1518-11-03 00:24] falls asleep",
                "[1518-11-03 00:29] wakes up",
                "[1518-11-04 00:02] Guard #99 begins shift",
                "[1518-11-04 00:36] falls asleep",
                "[1518-11-04 00:46] wakes up",
                "[1518-11-05 00:03] Guard #99 begins shift",
                "[1518-11-05 00:45] falls asleep",
                "[1518-11-05 00:55] wakes up"
            )
        )

        @Test
        fun shouldTellMeHowManyMinutesGuard10SleptFor() {
            assertThat(subject.minutesGuardSlept(10)).isEqualTo(50)
        }

        @Test
        fun shouldTellMeWhichGuardSleptTheMost() {
            assertThat(subject.sleepiestGuard).isEqualTo(10)
        }

        @Test
        fun shouldTellMeWhichMinutesTheSleepiestGuardSleptForTheMost() {
            assertThat(subject.sleepiestGuardsSleepiestMinute).isEqualTo(24)
        }

        @Test
        fun shouldTellMeAGuardsMostCommonlySleptMinutes(){
            assertThat(subject.mostCommonMinute(99)).isEqualTo(45)
        }

        @Test
        fun shouldTellMeTheGuardThatSleptTheMostAtAGivenMinute() {
            assertThat(subject.mostCommonGuardMinute.guardId).isEqualTo(99)
            assertThat(subject.mostCommonGuardMinute.sleepiestMinute.minute).isEqualTo(45)
        }
    }

    @Nested
    inner class NightTest {
        private val subject = Night(
            listOf(
                Observation("[1518-11-01 00:00] Guard #10 begins shift"),
                Observation("[1518-11-01 00:05] falls asleep"),
                Observation("[1518-11-01 00:25] wakes up"),
                Observation("[1518-11-01 00:30] falls asleep"),
                Observation("[1518-11-01 00:55] wakes up")
            )
        )

        @Test
        fun shouldTellMeHowManyMinutesGuardSleptFor() {
            assertThat(subject.numberOfMinutesAsleep).isEqualTo(45)
        }
    }
}
