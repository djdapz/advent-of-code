
fun String.toMapOfLetterCount(): HashMap<Char, Int> =
    this.sorted().fold(HashMap()) { acc, c ->
        return acc.addOrIncrement(c)
    }

internal fun String.hasExactlyTwoLetters(): Boolean = this.toMapOfLetterCount().values.contains(2)
internal fun String.hasExactlyThreeLetters(): Boolean = this.toMapOfLetterCount().values.contains(3)

fun String.sorted(): String {
    return toCharArray().sorted().joinToString("")
}

fun String.findSimilarities(other: String) = this.toCharArray()
    .zip(other.toCharArray())
    .fold("") { similarities, pair ->
        if (pair.first == pair.second) similarities + pair.first else similarities
    }