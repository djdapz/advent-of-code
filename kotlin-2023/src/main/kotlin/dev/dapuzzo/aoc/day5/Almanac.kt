package dev.dapuzzo.aoc.day5

typealias MapRange = Pair<LongRange, Long>

val MapRange.source: LongRange
    get() = this.first
val MapRange.amount: Long
    get() = this.second

fun MapRange.mapValue(value: Long): Long {
    return value + amount
}

class Mapping(val ranges: List<MapRange>){
}

class Almanac(val mapTransformations: List<Mapping>) {
    fun locationForSeed(seedNumber: Long): Long {
        return mapTransformations.fold(seedNumber) { currentNumber, map ->
            val sourceRange = map.ranges.find { it.source.contains(currentNumber) }
            sourceRange?.mapValue(currentNumber) ?: currentNumber
        }
    }


    companion object {
        fun parse(input: String): Almanac {
            val transformations = input.split("\n\n").map { section ->
                val rows = section.split("\n")
                return@map rows.subList(1, rows.size).map buildRow@{ row ->
                    val numbers = row.split(" ");
                    val destinationStart = numbers[0].toLong()
                    val sourceStart = numbers[1].toLong()
                    val count = numbers[2].toLong()

                    return@buildRow (
                            sourceStart..<(count + sourceStart) to
                                    destinationStart - sourceStart
                            )
                }
            }.map { Mapping(it) }
            return Almanac(transformations)
        }
    }

}
