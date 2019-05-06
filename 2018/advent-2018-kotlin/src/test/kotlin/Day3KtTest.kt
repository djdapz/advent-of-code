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
        fun shouldReadDistanceFromOriginFromString(){
            val claim = Claim("#123 @ 3,2: 5x4")
            assertThat(claim.xOrigin).isEqualTo(3)
            assertThat(claim.yOrigin).isEqualTo(2)
        }
        
        @Test
        fun shouldPrintFabricRepresentation(){
            val claim = Claim("#123 @ 3,2: 5x4")
            assertThat(claim.toString()).isEqualTo(
                """
                    ..........
                    ..........
                    ...#####..
                    ...#####..
                    ...#####..
                    ...#####..
                    ..........
                    ..........
                    ..........
                    ..........

                """.trimIndent()
            )
        }
    }
}