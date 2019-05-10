package com.dapuzzo.devon.adventOfCode._2018

import java.time.LocalDateTime
import java.time.format.DateTimeFormatter


enum class GuardAction {
    START, SLEEP, WAKE
}

class Observation(s: String) {
    val time = LocalDateTime.parse(
        """\[(.*?)]"""
            .toRegex()
            .find(s)!!
            .groups[1]!!
            .value,
        DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")
    )

    val guardId: Int? = """Guard #(.*?) begins shift"""
        .toRegex()
        .find(s)
        ?.groups
        ?.get(1)
        ?.value
        ?.toInt()

    val action = if (guardId != null) {
        GuardAction.START
    } else {
        if (s.contains("sleep")) {
            GuardAction.SLEEP
        } else {
            GuardAction.WAKE
        }
    }

}

class Timeline(rawObservations: List<String>) {

    val observations = rawObservations.map { Observation(it) }
    val guardsThatWorked = observations.map { it.guardId }.filterNotNull().toSet()

    fun daysGuardWorked(id: Int): Int = observations.filter { it.guardId == id }.size

}


class Night(val observation: List<Observation>) {
    val guardId = observation[0].guardId
    val numberOfMinutesAsleep: Int = 12


}
