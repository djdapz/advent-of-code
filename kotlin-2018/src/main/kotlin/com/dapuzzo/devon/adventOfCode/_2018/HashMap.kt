fun <T> HashMap<T, Int>.addOrInitialize(key: T, value: Int): HashMap<T, Int> {
    this[key] = this[key]?.plus(value) ?: value
    return this
}

fun <T, U> HashMap<T, List<U>>.addOrInitialize(
    key: T,
    valueInList: U
): HashMap<T, List<U>> {
    this[key] = this[key]?.plus(valueInList) ?: listOf(valueInList)
    return this
}


fun <T> HashMap<T, Int>.addOrIncrement(c: T): HashMap<T, Int> {
    this[c] = this[c]?.plus(1) ?: 1
    return this
}