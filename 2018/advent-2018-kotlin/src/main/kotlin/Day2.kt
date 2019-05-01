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

fun HashMap<Char, Int>.addOrIncrement(c: Char): HashMap<Char, Int> {
    this[c] = this[c]?.plus(1) ?: 1
    return this
}

private fun String.toMapOfLetterCount(): HashMap<Char, Int> =
    this.sorted().fold(HashMap(), HashMap<Char, Int>::addOrIncrement)

fun String.hasExactlyTwoLetters(): Boolean = this.toMapOfLetterCount().values.contains(2)
fun String.hasExactlyThreeLetters(): Boolean = this.toMapOfLetterCount().values.contains(3)


internal fun String.sorted(): String {
    return toCharArray().sorted().joinToString("")
}
