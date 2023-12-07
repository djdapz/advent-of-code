import dev.dapuzzo.aoc.day1.Day1
import dev.dapuzzo.aoc.FileReader
import dev.dapuzzo.aoc.day2.Day2
import dev.dapuzzo.aoc.day3.Day3
import dev.dapuzzo.aoc.day4.Day4
import dev.dapuzzo.aoc.day5.Day5
import dev.dapuzzo.aoc.day6.Day6
import dev.dapuzzo.aoc.day7.Day7

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
//    Day5(
//        FileReader("day5.txt").read()
//    ).run()
    Day6(
        FileReader("day6.txt").readAsList()
    ).run()
    Day7(
        FileReader("day7.txt").readAsList()
    ).run()
}