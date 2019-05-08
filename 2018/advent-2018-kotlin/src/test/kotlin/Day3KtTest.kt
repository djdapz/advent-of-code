import com.dapuzzo.devon.adventOfCode._2018.Claim
import com.dapuzzo.devon.adventOfCode._2018.Coordinate
import com.dapuzzo.devon.adventOfCode._2018.Day3
import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Nested
import org.junit.jupiter.api.Test

class Day3KtTest {

    @Test
    fun shouldCombineClaimsAndSayHowManyDuplicates() {
        val claim1 = "#1 @ 1,3: 4x4"
        val claim2 = "#2 @ 3,1: 4x4"
        val claim3 = "#3 @ 5,5: 2x2"
        val claim4 = "#4 @ 3,3: 5x2"

        val claimResult = Day3(listOf(claim1, claim2, claim3, claim4)).part1()

        assertThat(claimResult).isEqualTo(8)
    }

    @Test
    fun shouldReportIdsThatDontOverlap() {
        val claim1 = "#1 @ 1,3: 4x4"
        val claim2 = "#2 @ 3,1: 4x4"
        val claim3 = "#3 @ 5,5: 2x2"

        val claimResult = Day3(listOf(claim1, claim2, claim3)).part2()

        assertThat(claimResult).isEqualTo(listOf(3))


    }

    @Nested
    inner class CreatingClaimFromTicket {

        @Test
        fun shouldReadIdFromFirstString() {
            val claim = Claim("#123 @ 3,2: 5x4")
            assertThat(claim.id).isEqualTo(123)
        }

        @Test
        fun shouldReadWidthAndHeightFromString() {
            val claim = Claim("#123 @ 3,2: 5x4")
            assertThat(claim.width).isEqualTo(5)
            assertThat(claim.height).isEqualTo(4)
        }

        @Test
        fun shouldReadDistanceFromOriginFromString() {
            val claim = Claim("#123 @ 3,2: 5x4")
            assertThat(claim.xOrigin).isEqualTo(3)
            assertThat(claim.yOrigin).isEqualTo(2)
        }

        @Test
        fun shouldCreateListOfClaimedSquares() {
            val claim = Claim("#123 @ 3,2: 3x2")

            val expectedCoordinates = listOf(
                Coordinate(3, 2, 123),
                Coordinate(3, 3, 123),
                Coordinate(4, 2, 123),
                Coordinate(4, 3, 123),
                Coordinate(5, 2, 123),
                Coordinate(5, 3, 123)
            )
            assertThat(claim.coordinates).containsExactlyElementsOf(expectedCoordinates)

        }
    }
//
//    @Nested
//    inner class FabricTest {
//        @Test
//        fun shouldClaimFabric() {
//            val claim = Claim("#123 @ 3,2: 5x4")
//            val subject = Fabric(10)
//            assertThat(subject.claim(claim).toString()).isEqualTo(
//                """
//                    0000000000
//                    0000000000
//                    0001111100
//                    0001111100
//                    0001111100
//                    0001111100
//                    0000000000
//                    0000000000
//                    0000000000
//                    0000000000
//                """.trimIndent()
//            )
//        }
//
//
//        @Nested
//        inner class TestClaimingDouble {
//            private val claim1 = Claim("#1 @ 1,3: 4x4")
//            private val claim2 = Claim("#2 @ 3,1: 4x4")
//
//            private val subject = Fabric(8)
//                .claim(claim1)
//                .claim(claim2)
//
//            @Test
//            fun shouldClaimFabricTwice() {
//
//                assertThat(
//                    subject.toString()
//                ).isEqualTo(
//                    """
//                    00000000
//                    00011110
//                    00011110
//                    01122110
//                    01122110
//                    01111000
//                    01111000
//                    00000000
//                """.trimIndent()
//                )
//            }
//
//            @Test
//            fun shouldCreateScoreForFabricBasedOnDoubles() {
//                assertThat(subject.numberOfDoubles).isEqualTo(4)
//            }
//        }
//
//        @Nested
//        inner class TestClaimingTriple {
//            private val claim1 = Claim("#1 @ 1,3: 4x4")
//            private val claim2 = Claim("#2 @ 3,1: 4x4")
//            private val claim3 = Claim("#3 @ 5,5: 2x2")
//            private val claim4 = Claim("#4 @ 3,3: 5x2")
//
//            private val subject = Fabric(8)
//                .claim(claim1)
//                .claim(claim2)
//                .claim(claim3)
//                .claim(claim4)
//
//            @Test
//            fun shouldClaimFabricTwice() {
//
//                assertThat(
//                    subject.toString()
//                ).isEqualTo(
//                    """
//                    00000000
//                    00011110
//                    00011110
//                    01133221
//                    01133221
//                    01111110
//                    01111110
//                    00000000
//                """.trimIndent()
//                )
//            }
//
//            @Test
//            fun shouldCreateScoreForFabricBasedOnDoubles() {
//                assertThat(subject.numberOfDoubles).isEqualTo(8)
//            }
//        }
//
//
//    }
}