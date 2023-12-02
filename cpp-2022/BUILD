cc_library(
    name = "aoc_lib",
    srcs = ["aoc.cpp"],
    hdrs = ["aoc.h"],
    deps = [
        "//day1",
        "//day2",
        "//day3:Day3",
        "//day4:Day4",
        "//day5:Day5",
        "//day6:Day6",
        "//Day7",
        "//Day8",
        "//Day9",
        "//input",
        "//parsing"
    ]
)

cc_binary(
    name = "aoc",
    srcs = ["main.cpp"],
    deps = [":aoc_lib"],
)