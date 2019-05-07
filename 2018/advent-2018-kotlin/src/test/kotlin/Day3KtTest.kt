import com.dapuzzo.devon.adventOfCode._2018.Claim
import com.dapuzzo.devon.adventOfCode._2018.Fabric
import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Nested
import org.junit.jupiter.api.Test

class Day3KtTest {

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
                Pair(3, 2),
                Pair(3, 3),
                Pair(4, 2),
                Pair(4, 3),
                Pair(5, 2),
                Pair(5, 3)
            )
            assertThat(claim.coordinates).containsExactlyElementsOf(expectedCoordinates)

        }
    }

    @Nested
    inner class FabricTest {
        @Test
        fun shouldClaimFabric() {
            val claim = Claim("#123 @ 3,2: 5x4")
            val subject = Fabric(10)
            assertThat(subject.claim(claim).toString()).isEqualTo(
                """
                    0000000000
                    0000000000
                    0001111100
                    0001111100
                    0001111100
                    0001111100
                    0000000000
                    0000000000
                    0000000000
                    0000000000
                """.trimIndent()
            )
        }


        @Nested
        inner class TestClaimingDouble {
            private val claim1 = Claim("#1 @ 1,3: 4x4")
            private val claim2 = Claim("#2 @ 3,1: 4x4")

            private val subject = Fabric(8)
                .claim(claim1)
                .claim(claim2)

            @Test
            fun shouldClaimFabricTwice() {

                assertThat(
                    subject.toString()
                ).isEqualTo(
                    """
                    00000000
                    00011110
                    00011110
                    01122110
                    01122110
                    01111000
                    01111000
                    00000000
                """.trimIndent()
                )
            }

            @Test
            fun shouldCreateScoreForFabricBasedOnDoubles() {
                assertThat(subject.numberOfDoubles).isEqualTo(4)
            }
        }

        @Nested
        inner class TestClaimingTriple {
            private val claim1 = Claim("#1 @ 1,3: 4x4")
            private val claim2 = Claim("#2 @ 3,1: 4x4")
            private val claim3 = Claim("#3 @ 5,5: 2x2")
            private val claim4 = Claim("#4 @ 3,3: 5x2")

            private val subject = Fabric(8)
                .claim(claim1)
                .claim(claim2)
                .claim(claim3)
                .claim(claim4)

            @Test
            fun shouldClaimFabricTwice() {

                assertThat(
                    subject.toString()
                ).isEqualTo(
                    """
                    00000000
                    00011110
                    00011110
                    01133221
                    01133221
                    01111110
                    01111110
                    00000000
                """.trimIndent()
                )
            }

            @Test
            fun shouldCreateScoreForFabricBasedOnDoubles() {
                assertThat(subject.numberOfDoubles).isEqualTo(8)
            }
        }
    }
}