data class Checksum(val numberOfDoubles: Int, val numberOfTriples: Int) {
    companion object {
        fun fromList(list: List<String>): Checksum = list.fold(Checksum(0, 0)) { acc, string -> acc.next(string) }
    }

    val checksum = this.numberOfDoubles * this.numberOfTriples

    fun next(s: String): Checksum = Checksum(nextNumDoubles(s), nextNumTriples(s))

    private fun nextNumTriples(s: String) =
        if (s.hasExactlyThreeLetters()) this.numberOfTriples + 1 else this.numberOfTriples

    private fun nextNumDoubles(s: String) =
        if (s.hasExactlyTwoLetters()) this.numberOfDoubles + 1 else this.numberOfDoubles
}

private fun HashMap<Char, Int>.addOrIncrement(c: Char): HashMap<Char, Int> {
    this[c] = this[c]?.plus(1) ?: 1
    return this
}

private fun String.toMapOfLetterCount(): HashMap<Char, Int> =
    this.sorted().fold(HashMap(), HashMap<Char, Int>::addOrIncrement)

internal fun String.hasExactlyTwoLetters(): Boolean = this.toMapOfLetterCount().values.contains(2)
internal fun String.hasExactlyThreeLetters(): Boolean = this.toMapOfLetterCount().values.contains(3)

fun String.sorted(): String {
    return toCharArray().sorted().joinToString("")
}

fun String.findSimmilarities(other: String) = this.toCharArray()
    .zip(other.toCharArray())
    .fold("") { similarities, pair ->
        if (pair.first == pair.second) similarities + pair.first else similarities
    }

fun isOffByOne(s: String, s1: String): Boolean {
    return s.findSimmilarities(s1).length == s.length - 1
}

fun findSimilaritiesOfFirstOffByOne(list: List<String>): Any {
    for (string1 in list) {
        for (string2 in list) {
            val similarities = string1.findSimmilarities(string2)
            if (similarities.length == string1.length - 1) {
                return similarities
            }
        }
    }
    throw Exception("Nothing Found")
}


class Day2(private val input: List<String>) {
    fun part1() {
        val checksum = Checksum.fromList(input).checksum
        println("Part 1: Checksum = $checksum")
    }

    fun part2() {
        val simmilarities = findSimilaritiesOfFirstOffByOne(input)
        println("Part 2: Checksum = $simmilarities")
    }
}


fun main() {
    Day2(day2Input).part1()
    Day2(day2Input).part2()
}
