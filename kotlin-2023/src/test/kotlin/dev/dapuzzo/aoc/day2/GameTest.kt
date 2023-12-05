package dev.dapuzzo.aoc.day2

import dev.dapuzzo.aoc.findNumberPreceding
import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test

class GameTest {
    @Test
    fun `should parse a game`() {
        val game = Game.parse("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")
        assertThat(game.id).isEqualTo(1)

        assertThat(game.turns).hasSize(3)

        assertThat(game.turns[0].blue).isEqualTo(3)
        assertThat(game.turns[0].red).isEqualTo(4)
        assertThat(game.turns[0].green).isEqualTo(0)

        assertThat(game.turns[2].blue).isEqualTo(0)
        assertThat(game.turns[2].red).isEqualTo(0)
        assertThat(game.turns[2].green).isEqualTo(2)
    }

    @Test
    fun `should parse a game with double digit id`() {
        val game = Game.parse("Game 13: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")
        assertThat(game.id).isEqualTo(13)
    }



    @Test
    fun `should get max of each color`() {
        val game = Game.parse("Game 1: 3 blue; 2 blue 10 red; 12 green")

        val expectedMax = Turn(red = 10, green = 12, blue = 3)

        assertThat(game.maxTurn).isEqualTo(expectedMax)
    }

    @Test
    fun `should get power of a game`() {
        assertThat(Game.parse("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green").power)
            .isEqualTo(48)
        assertThat(Game.parse("Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue").power)
            .isEqualTo(12)
        assertThat(Game.parse("Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red").power)
            .isEqualTo(1560)
        assertThat(Game.parse("Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red").power)
            .isEqualTo(630)
        assertThat(Game.parse("Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green").power)
            .isEqualTo(36)
    }
}