package dev.dapuzzo.aoc.day7

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test

class Day7KtTest {
    @Test
    fun `should id hand types`() {
        assertThat(Hand("K21AQ").type).isEqualTo(HandType.HIGH)
        assertThat(Hand("K21AA").type).isEqualTo(HandType.PAIR)
        assertThat(Hand("KK1AA").type).isEqualTo(HandType.TWO)
        assertThat(Hand("AAAAA").type).isEqualTo(HandType.FIVE)
        assertThat(Hand("AAKAA").type).isEqualTo(HandType.FOUR)
        assertThat(Hand("AKKAA").type).isEqualTo(HandType.FULL)
        assertThat(Hand("AK1AA").type).isEqualTo(HandType.THREE)
    }

    @Test
    fun `should id hand with a joker`() {
        assertThat(Hand("AAJAA", HandTypeMode.JOKER).type).isEqualTo(HandType.FIVE)
        assertThat(Hand("AKJAA", HandTypeMode.JOKER).type).isEqualTo(HandType.FOUR)
        assertThat(Hand("AKJKA", HandTypeMode.JOKER).type).isEqualTo(HandType.FULL)
        assertThat(Hand("QKJKA", HandTypeMode.JOKER).type).isEqualTo(HandType.THREE)
        assertThat(Hand("AQKTJ", HandTypeMode.JOKER).type).isEqualTo(HandType.PAIR)


        assertThat(Hand("AJJAA", HandTypeMode.JOKER).type).isEqualTo(HandType.FIVE)
        assertThat(Hand("AJJJA", HandTypeMode.JOKER).type).isEqualTo(HandType.FIVE)
    }

    @Test
    fun `should id hand with joker REGRESSION TESTING`() {
        assertThat(Hand("TTJ9J", HandTypeMode.JOKER).type).isEqualTo(HandType.FOUR)
        assertThat(Hand("523JJ", HandTypeMode.JOKER).type).isEqualTo(HandType.THREE)
        assertThat(Hand("JJJJJ", HandTypeMode.JOKER).type).isEqualTo(HandType.FIVE)
    }

    @Test
    fun `should return positive value when first hand is bigger`() {
        assertThat(Hand("AAAAA")).isGreaterThan(Hand("KK1AA"))
    }

    @Test
    fun `should return negative value when second hand is bigger`() {
        assertThat(Hand("AKJQ2")).isLessThan(Hand("KK1AA"))
    }

    @Test
    fun `should return positive value when first hand winds on a tie`() {
        assertThat(Hand("AAAAK")).isGreaterThan(Hand("AAAA9"))
        assertThat(Hand("AAAAT")).isGreaterThan(Hand("AAAA9"))

        assertThat(Hand("AAAAK")).isGreaterThan(Hand("AAAAQ"))
        assertThat(Hand("AAAAQ")).isGreaterThan(Hand("AAAAJ"))
        assertThat(Hand("AAAAJ")).isGreaterThan(Hand("AAAAT"))
        assertThat(Hand("AAAAT")).isGreaterThan(Hand("AAAA9"))
        assertThat(Hand("AAAA9")).isGreaterThan(Hand("AAAA8"))
        assertThat(Hand("AAAA8")).isGreaterThan(Hand("AAAA7"))
        assertThat(Hand("AAAA7")).isGreaterThan(Hand("AAAA6"))
        assertThat(Hand("AAAA6")).isGreaterThan(Hand("AAAA5"))
        assertThat(Hand("AAAA5")).isGreaterThan(Hand("AAAA4"))
        assertThat(Hand("AAAA4")).isGreaterThan(Hand("AAAA3"))
        assertThat(Hand("AAAA3")).isGreaterThan(Hand("AAAA2"))
        assertThat(Hand("AAAA2")).isGreaterThan(Hand("AAAA1"))
    }


    @Test
    fun `should return positive value when first hand winds on a tie = JOKER MODE`() {
        assertThat(Hand("A1AA1", HandTypeMode.JOKER)).isGreaterThan(Hand("AJA11", HandTypeMode.JOKER))

        assertThat(Hand("AAAAK", HandTypeMode.JOKER)).isGreaterThan(Hand("AAAAQ", HandTypeMode.JOKER))
        assertThat(Hand("AAAAQ", HandTypeMode.JOKER)).isGreaterThan(Hand("AAAAT", HandTypeMode.JOKER))
        assertThat(Hand("AAAAT", HandTypeMode.JOKER)).isGreaterThan(Hand("AAAA9", HandTypeMode.JOKER))
        assertThat(Hand("AAAA9", HandTypeMode.JOKER)).isGreaterThan(Hand("AAAA8", HandTypeMode.JOKER))
        assertThat(Hand("AAAA8", HandTypeMode.JOKER)).isGreaterThan(Hand("AAAA7", HandTypeMode.JOKER))
        assertThat(Hand("AAAA7", HandTypeMode.JOKER)).isGreaterThan(Hand("AAAA6", HandTypeMode.JOKER))
        assertThat(Hand("AAAA6", HandTypeMode.JOKER)).isGreaterThan(Hand("AAAA5", HandTypeMode.JOKER))
        assertThat(Hand("AAAA5", HandTypeMode.JOKER)).isGreaterThan(Hand("AAAA4", HandTypeMode.JOKER))
        assertThat(Hand("AAAA4", HandTypeMode.JOKER)).isGreaterThan(Hand("AAAA3", HandTypeMode.JOKER))
        assertThat(Hand("AAAA3", HandTypeMode.JOKER)).isGreaterThan(Hand("AAAA2", HandTypeMode.JOKER))
        assertThat(Hand("AAAA2", HandTypeMode.JOKER)).isGreaterThan(Hand("AAAA1", HandTypeMode.JOKER))
    }
}

