import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Nested
import org.junit.jupiter.api.Test

class Day2KtTest {

    @Nested
    inner class ChecksumTest {
        @Test
        fun shouldTellMeHowManyInMyListHaveTwo() {
            val list = listOf(
                "AABC",
                "ABC",
                "ABAC",
                "ABACCA"
            )

            val flattenedList = Checksum.fromList(list)

            assertThat(flattenedList.numberOfDoubles).isEqualTo(3)
        }

        @Test
        fun shouldTellMeHowManyInMyListHaveThree() {
            val list = listOf(
                "AABC",
                "ABC",
                "ABAC",
                "ABACCA"
            )

            val flattenedList = Checksum.fromList(list)

            assertThat(flattenedList.numberOfTriples).isEqualTo(1)
        }

        @Test
        fun shouldGiveMeCorrectChecksum() {
            val checksum = Checksum(1, 1)

            assertThat(checksum.checksum).isEqualTo(1)
        }

        @Test
        fun shouldGiveMeCorrectChecksum2() {
            val checksum = Checksum(4, 3)

            assertThat(checksum.checksum).isEqualTo(12)
        }

        @Test
        fun shouldGiveMeCorrectChecksum3() {
            val checksum = Checksum(5, 12)

            assertThat(checksum.checksum).isEqualTo(60)
        }
    }


    @Nested
    inner class FindingTwo {
        @Test
        fun shouldReturnFalseWhenNoLettersMatch() {
            val answer = "ABCDE".hasExactlyTwoLetters()
            assertThat(answer).isEqualTo(false)
        }

        @Test
        fun shouldReturnTrueWhenTwoLettersMatch() {
            val answer = "ABCDEE".hasExactlyTwoLetters()
            assertThat(answer).isEqualTo(true)
        }
    }

    @Nested
    inner class FindingThree {

        @Test
        fun shouldReturnTrueForThreeLetters() {
            val answer = "ABCCCDEE".hasExactlyThreeLetters()
            assertThat(answer).isEqualTo(true)
        }

        @Test
        fun shouldReturnFalseForTwoLetters() {
            val answer = "ABCDEE".hasExactlyThreeLetters()
            assertThat(answer).isEqualTo(false)
        }
    }

    @Nested
    inner class FindingIdsOffByOne {
        @Test
        fun shouldFindCombinationOfStrings() {
            val simmilarities = "abcde".findSimilarities("abcdd")
            assertThat(simmilarities).isEqualTo("abcd")
        }

        @Test
        fun shouldFindThatIsOffByOne() {
            val offByOne = isOffByOne("abcde", "abcdd")
            assertThat(offByOne).isTrue()
        }

        @Test
        fun shouldFindThatIsNotOffByOne() {
            val offByOne = isOffByOne("abcee", "abcdd")
            assertThat(offByOne).isFalse()
        }

        @Test
        fun shouldFindPairThatIsOffByOneUsingBruteForce() {
            val list = listOf(
                "abcde",
                "fghij",
                "klmno",
                "pqrst",
                "fguij",
                "axcye",
                "wvxyz"
            )

            val shorterList = findSimilaritiesOfFirstOffByOne(list)
            assertThat(shorterList).isEqualTo("fgij")

        }
    }

    @Test
    fun shouldSortStrings() {
        val sorted = "abedc".sorted()
        assertThat(sorted).isEqualTo("abcde")
    }

    @Test
    fun shouldSolveDailyPuzzle() {
        main()
    }
}