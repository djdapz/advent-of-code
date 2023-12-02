import dev.dapuzzo.aoc.day1.Day1
import dev.dapuzzo.aoc.FileReader
import dev.dapuzzo.aoc.day2.Day2

fun main(args: Array<String>) {
    Day1(
        FileReader("day1.txt").readAsList()
    ).run()
    Day2(
        FileReader("day2.txt").readAsList()
    ).run()
}