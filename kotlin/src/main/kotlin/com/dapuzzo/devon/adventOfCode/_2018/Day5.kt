package com.dapuzzo.devon.adventOfCode._2018

import com.dapuzzo.devon.adventOfCode.AdventOfCodeDay

class Day5(input: String) : AdventOfCodeDay(5) {

    private val reduced = reducePolymer(input)
    private val minimised = ('a'..'z')
        .map { it.toString() }
        .map { input.replace(it, "").replace(it.toUpperCase(), "") }
        .map { reducePolymer(it) }
        .minBy { it.length }

    override fun part1() = reduced.length
    override fun part2() = minimised!!.length
}

private fun Char.reactsWith(l: Char) = this != l && l.toLowerCase() == this.toLowerCase()

internal fun String.react(): String {
    var nextPolymer = this

    ((nextPolymer.length - 2) downTo 0).forEach { i ->
        if (nextPolymer[i].reactsWith(nextPolymer.getOrElse(i + 1) { ' ' })) {
            nextPolymer = nextPolymer.removeRange(i..i + 1)
        }
    }

    return nextPolymer

}

fun reducePolymer(polymer: String): String {
    var prevPolymer = polymer
    var nextPolymer = polymer.react()

    while (nextPolymer.length != prevPolymer.length) {
        prevPolymer = nextPolymer
        nextPolymer = nextPolymer.react()
    }

    return nextPolymer
}