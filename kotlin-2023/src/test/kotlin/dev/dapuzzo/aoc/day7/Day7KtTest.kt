package dev.dapuzzo.aoc.day7

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test

class Day7KtTest {
    @Test
    fun `should id hand types`() {
        assertThat("K21AQ".getHandType()).isEqualTo(HandType.HIGH)
        assertThat("K21AA".getHandType()).isEqualTo(HandType.PAIR)
        assertThat("KK1AA".getHandType()).isEqualTo(HandType.TWO)
        assertThat("AAAAA".getHandType()).isEqualTo(HandType.FIVE)
        assertThat("AAKAA".getHandType()).isEqualTo(HandType.FOUR)
        assertThat("AKKAA".getHandType()).isEqualTo(HandType.FULL)
        assertThat("AK1AA".getHandType()).isEqualTo(HandType.THREE)
    }

    @Test
    fun `should id hand with a joker`() {
        assertThat("AAJAA".getHandType(HandTypeMode.JOKER)).isEqualTo(HandType.FIVE)
        assertThat("AKJAA".getHandType(HandTypeMode.JOKER)).isEqualTo(HandType.FOUR)
        assertThat("AKJKA".getHandType(HandTypeMode.JOKER)).isEqualTo(HandType.FULL)
        assertThat("QKJKA".getHandType(HandTypeMode.JOKER)).isEqualTo(HandType.THREE)
        assertThat("AQKTJ".getHandType(HandTypeMode.JOKER)).isEqualTo(HandType.PAIR)


        assertThat("AJJAA".getHandType(HandTypeMode.JOKER)).isEqualTo(HandType.FIVE)
        assertThat("AJJJA".getHandType(HandTypeMode.JOKER)).isEqualTo(HandType.FIVE)
    }

    @Test
    fun `should id hand with joker REGRESSION TESTING`() {
        assertThat("TTJ9J".getHandType(HandTypeMode.JOKER)).isEqualTo(HandType.FOUR)
        assertThat("523JJ".getHandType(HandTypeMode.JOKER)).isEqualTo(HandType.THREE)
        assertThat("JJJJJ".getHandType(HandTypeMode.JOKER)).isEqualTo(HandType.FIVE)
    }

    @Test
    fun `should return positive value when first hand is bigger`() {
        assertThat(compareHands("AAAAA", "KK1AA")).isGreaterThan(0)
    }

    @Test
    fun `should return negative value when second hand is bigger`() {
        assertThat(compareHands("AKJQ2", "KK1AA")).isLessThan(0)
    }

    @Test
    fun `should return positive value when first hand winds on a tie`() {
        assertThat(compareHands("AAAAK", "AAAA9")).isGreaterThan(0)
        assertThat(compareHands("AAAAT", "AAAA9")).isGreaterThan(0)

        assertThat(compareHands("AAAAK", "AAAAQ")).isGreaterThan(0)
        assertThat(compareHands("AAAAQ", "AAAAJ")).isGreaterThan(0)
        assertThat(compareHands("AAAAJ", "AAAAT")).isGreaterThan(0)
        assertThat(compareHands("AAAAT", "AAAA9")).isGreaterThan(0)
        assertThat(compareHands("AAAA9", "AAAA8")).isGreaterThan(0)
        assertThat(compareHands("AAAA8", "AAAA7")).isGreaterThan(0)
        assertThat(compareHands("AAAA7", "AAAA6")).isGreaterThan(0)
        assertThat(compareHands("AAAA6", "AAAA5")).isGreaterThan(0)
        assertThat(compareHands("AAAA5", "AAAA4")).isGreaterThan(0)
        assertThat(compareHands("AAAA4", "AAAA3")).isGreaterThan(0)
        assertThat(compareHands("AAAA3", "AAAA2")).isGreaterThan(0)
        assertThat(compareHands("AAAA2", "AAAA1")).isGreaterThan(0)
    }


    @Test
    fun `should return positive value when first hand winds on a tie = JOKER MODE`() {
        assertThat(compareHands("A1AA1", "AJA11", HandTypeMode.JOKER)).isGreaterThan(0)

        assertThat(compareHands("AAAAK", "AAAAQ", HandTypeMode.JOKER)).isGreaterThan(0)
        assertThat(compareHands("AAAAQ", "AAAAT", HandTypeMode.JOKER)).isGreaterThan(0)
        assertThat(compareHands("AAAAT", "AAAA9", HandTypeMode.JOKER)).isGreaterThan(0)
        assertThat(compareHands("AAAA9", "AAAA8", HandTypeMode.JOKER)).isGreaterThan(0)
        assertThat(compareHands("AAAA8", "AAAA7", HandTypeMode.JOKER)).isGreaterThan(0)
        assertThat(compareHands("AAAA7", "AAAA6", HandTypeMode.JOKER)).isGreaterThan(0)
        assertThat(compareHands("AAAA6", "AAAA5", HandTypeMode.JOKER)).isGreaterThan(0)
        assertThat(compareHands("AAAA5", "AAAA4", HandTypeMode.JOKER)).isGreaterThan(0)
        assertThat(compareHands("AAAA4", "AAAA3", HandTypeMode.JOKER)).isGreaterThan(0)
        assertThat(compareHands("AAAA3", "AAAA2", HandTypeMode.JOKER)).isGreaterThan(0)
        assertThat(compareHands("AAAA2", "AAAA1", HandTypeMode.JOKER)).isGreaterThan(0)
    }
}

