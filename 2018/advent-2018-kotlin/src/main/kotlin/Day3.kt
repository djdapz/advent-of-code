class Day3 {

}


class Claim(ticket: String) {
    private val parameters = ticket
        .replace("#", "")
        .replace("x", " ")
        .replace(",", " ")
        .replace("@ ", "")
        .replace(":", "")
        .split(" ")
        .map { it.toInt() }

    val id = parameters[0]
    val width = parameters[3]
    val height = parameters[4]
    val xOrigin = parameters[1]
    val yOrigin = parameters[2]

    companion object {
        val overalSize = 10
    }

    override fun toString(): String {
        var output = ""
        for (y in 0 until overalSize) {
            for (x in 0 until overalSize) {
                output += printCoordinate(x, y)
            }
            output += '\n'
        }
        return output

    }

    private fun printCoordinate(x: Int, y: Int): String =
        if (xInRange(x) && y >= yOrigin && y < height + yOrigin) "#" else "."

    private fun xInRange(x: Int) = x >= xOrigin && x < xOrigin + width
}
