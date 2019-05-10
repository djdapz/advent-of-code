package com.dapuzzo.devon.adventOfCode._2018

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Nested
import org.junit.jupiter.api.Test

class Day4KtTest {

    @Nested
    inner class ReadingInBeginningOfShift {

        val subject = Observation("[1518-11-01 00:00] Guard #10 begins shift")

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
    }

    @Nested
    inner class ReadingInGuardChangesState {

        @Test
        fun shouldReadGuardSleeps() {
            val subject = Observation("[1518-11-01 00:05] falls asleep")
            assertThat(subject.action).isEqualTo(GuardAction.SLEEP)
        }

        @Test
        fun shouldReadGuardWakes() {
            val subject = Observation("[1518-11-01 00:05] wakes up")
            assertThat(subject.action).isEqualTo(GuardAction.WAKE)
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
        fun shouldTellMeWhichGuardsWorked() {
            assertThat(subject.guardsThatWorked).isEqualTo(setOf(10, 99))
        }

        @Test
        fun shouldTellMeHowManyDaysGuard10Worked() {
            assertThat(subject.daysGuardWorked(10)).isEqualTo(2)
        }
    }

    @Nested
    inner class CreatingNight {
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
        fun shouldTellMeHowManyMinutesGuardSleptFor(){
            assertThat(subject.numberOfMinutesAsleep).isEqualTo(35)
        }
    }
}
