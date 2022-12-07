cc_library(
    name = "aoc_lib",
    srcs = ["aoc.cpp"],
    hdrs = ["aoc.h"],
    deps = [
        "//day1",
        "//day2",
        "//day3:Day3",
        "//input",
        "//parsing"
    ]
)

cc_binary(
    name = "aoc",
    srcs = ["main.cpp"],
    deps = [":aoc_lib"],
)