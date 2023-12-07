package dev.dapuzzo.aoc.day2

import dev.dapuzzo.aoc.findNumberPreceding
import java.lang.Exception

data class Turn(val red: Int, val green: Int, val blue: Int) {
    companion object {
        fun parse(it: String): Turn =
            Turn(
                it.findNumberPreceding(" red") ?: 0,
                it.findNumberPreceding(" green") ?: 0,
                it.findNumberPreceding(" blue") ?: 0,
            )
    }
}

class Game(val id: Int, val turns: List<Turn>) {
    val power: Int by lazy {
        maxTurn.blue * maxTurn.red * maxTurn.green
    }
    val maxTurn: Turn by lazy {
        Turn(
            red = turns.maxOf { it.red },
            green = turns.maxOf { it.green },
            blue = turns.maxOf { it.blue },
        )
    }

    companion object {
        fun parse(s: String): Game {
            try {
                val clauses = s.split(":")
                val id = clauses[0].toCharArray().filter { char -> char.isDigit() }.joinToString("").toInt()

                val turns = clauses[1].split(";").map { Turn.parse(it) }
                return Game(id, turns)
            } catch (e: Exception) {
                println(s)
                throw e;
            }
        }
    }
}
