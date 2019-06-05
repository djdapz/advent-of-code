package com.dapuzzo.devon.adventOfCode._2018

import addOrInitialize
import com.dapuzzo.devon.adventOfCode.AdventOfCodeDay
import java.time.Duration.between
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

class Day4(input: List<String>) : AdventOfCodeDay(4) {
    private val timeline = Timeline(input)
    override fun part1() = timeline.sleepiestGuard * timeline.sleepiestGuardsSleepiestMinute
    override fun part2() = timeline.mostCommonGuardMinute.run { this.guardId * this.sleepiestMinute.minute }
}

class Observation(s: String) {
    val time = LocalDateTime.parse(
        """\[(.*?)]"""
            .toRegex()
            .find(s)!!
            .groups[1]!!
            .value,
        DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")
    )!!

    val date: LocalDate = if (time.hour > 6) time.toLocalDate().plusDays(1) else time.toLocalDate()
    val guardId: Int? = """Guard #(.*?) begins shift"""
        .toRegex()
        .find(s)
        ?.groups
        ?.get(1)
        ?.value
        ?.toInt()
}

class Timeline(rawObservations: List<String>) {

    data class SleepiestGuardMinute(val guardId: Int, val sleepiestMinute: SleepiestMinute)
    data class SleepiestMinute(val minute: Int, val occurrence: Int)

    private val nights = rawObservations
        .map { Observation(it) }
        .sortedBy { it.time }
        .fold(HashMap<LocalDate, List<Observation>>()) { acc, next ->
            acc.addOrInitialize(next.date, next)
        }.values
        .map { Night(it) }

    private val sleepiestMinutes: Map<Int, SleepiestMinute> = nights
        .groupBy { it.guardId }
        .mapValues { timelineToSleepiestMinute(it.value) }

    private fun timelineToSleepiestMinute(nights: List<Night>): SleepiestMinute =
        nights
            .flatMap { it.naps }
            .fold(IntArray(60) { 0 }) { acc, nap: Pair<Observation, Observation> ->
                (nap.first.time.minute..nap.second.time.minute).forEach { acc[it]++ }
                acc
            }.run { SleepiestMinute(indexOf(this.max()!!), this.max()!!) }


    private val totalTimeCards: HashMap<Int, Int> = nights
        .fold(HashMap()) { acc, next ->
            acc.addOrInitialize(next.guardId, next.numberOfMinutesAsleep)
        }
    val sleepiestGuard = totalTimeCards.entries.maxBy { it.value }!!.key

    val sleepiestGuardsSleepiestMinute: Int = (sleepiestMinutes[sleepiestGuard] ?: error("")).minute

    val mostCommonGuardMinute = sleepiestMinutes.maxBy { entry -> entry.value.occurrence }!!.run {
        SleepiestGuardMinute(this.key, this.value)
    }

    fun minutesGuardSlept(id: Int): Int = totalTimeCards[id]!!

    fun mostCommonMinute(i: Int): Int = (sleepiestMinutes[i] ?: error("")).minute

}

class Night(observation: List<Observation>) {
    val guardId = observation[0].guardId!!

    val naps: List<Pair<Observation, Observation>> = (1 until observation.size step 2)
        .map { Pair(observation[it], observation[it + 1]) }

    val numberOfMinutesAsleep: Int = naps
        .map { between(it.first.time, it.second.time) }
        .sumBy { it.toMinutes().toInt() }
}
