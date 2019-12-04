package com.dapuzzo.devon.adventOfCode._2018

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Nested
import org.junit.jupiter.api.Test

class Day5KtTest {

    @Nested
    inner class PassOnAPolymer {
        @Test
        fun shouldHandleReactionWithOnePair() {
            val polymer = "aagbBcde"
            val reactedPolymer = polymer.react()

            assertThat(reactedPolymer).isEqualTo("aagcde")
        }


        @Test
        fun shouldHandleReactionWithRectionAtEndOfString() {
            val polymer = "adbB"
            val reactedPolymer = polymer.react()

            assertThat(reactedPolymer).isEqualTo("ad")
        }


        @Test
        fun shouldHandleReactionWithTrippleAndOnlyTakeOutTwo() {
            val polymer = "aAabc"
            val reactedPolymer = polymer.react()

            assertThat(reactedPolymer).isEqualTo("abc")
        }
    }

    @Nested
    inner class ReducePolymer {
        @Test
        fun shouldReducePolymerUntilDone() {
            val polymer = "abBAc"
            val reduced = reducePolymer(polymer)

            assertThat(reduced).isEqualTo("c")
        }
    }
}
