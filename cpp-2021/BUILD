cc_library(
    name = "aoc_lib",
    srcs = ["aoc.cpp"],
    hdrs = ["aoc.h"],
    deps = [
        "//day1",
        "//input",
        "//parsing"
    ]
)

cc_binary(
    name = "aoc",
    srcs = ["main.cpp"],
    deps = [":aoc_lib"],
)