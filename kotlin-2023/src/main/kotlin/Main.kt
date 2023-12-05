import dev.dapuzzo.aoc.day1.Day1
import dev.dapuzzo.aoc.FileReader
import dev.dapuzzo.aoc.day2.Day2
import dev.dapuzzo.aoc.day3.Day3
import dev.dapuzzo.aoc.day4.Day4

fun main(args: Array<String>) {
    Day1(
        FileReader("day1.txt").readAsList()
    ).run()
    Day2(
        FileReader("day2.txt").readAsList()
    ).run()
    Day3(
        FileReader("day3.txt").readAsList()
    ).run()
    Day4(
        FileReader("day4.txt").readAsList()
    ).run()
}