package dev.dapuzzo.aoc

fun String.findNumberPreceding(key: String): Int? = Regex("\\d+(?=$key)").find(this)?.value?.toInt()
fun String.findNumberFollowing(key: String): Int? = Regex("(?<=$key )\\d+").find(this)?.value?.toInt()