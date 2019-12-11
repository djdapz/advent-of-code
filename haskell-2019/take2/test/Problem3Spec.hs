module Problem3Spec where

import           Test.Tasty
import           Test.Tasty.HUnit

import           Problem3
import           Assertions

problem3Tests :: TestTree
problem3Tests = testGroup "Problem3" [wireReaderTest, wireIntersectionTest, manhattanDistanceTest, stepCalculatorTest]

wireReaderTest :: TestTree
wireReaderTest =
  testGroup
    "wireReader"
    [ testCase
        "should turn a simple right line into a list of points"
        (assertEquals [((0, 0), (2, 0))] (readWire ["R2"]))
    , testCase
        "should turn a simple left line into a list of points"
        (assertEquals [((0, 0), (-2, 0))] (readWire ["L2"]))
    , testCase
        "should turn a simple up line into a list of points"
        (assertEquals [((0, 0), (0, 3))] (readWire ["U3"]))
    , testCase
        "should turn a simple down line into a list of points"
        (assertEquals [((0, 0), (0, -3))] (readWire ["D3"]))
    , testCase
        "should combine two commands"
        (assertEquals [((0, 0), (2, 0)), ((2, 0), (2, 2))] (readWire ["R2", "U2"]))
    , testCase
        "should combine a bunch of commands"
        (assertEqual
           ":("
           [ ((0, 0), (1, 0))
           , ((1, 0), (1, -5))
           , ((1, -5), (-2, -5))
           , ((-2, -5), (1, -5))
           , ((1, -5), (1, 7))
           , ((1, 7), (-69, 7))
           ]
           (readWire ["R1", "D5", "L3", "R3", "U12", "L70"]))
    ]

wireIntersectionTest :: TestTree
wireIntersectionTest =
  testGroup
    "wireIntersection"
    [ testCase
        "should tell me where wires intersect"
        (assertEqual
           ":("
           [(0, 0), (6, 5), (3, 3)]
           (intersectionPoints (readWire ["R8", "U5", "L5", "D3"]) (readWire ["U7", "R6", "D4", "L4"])))
    , testCase
        "should tell me where wires intersect"
        (assertEqual
           ":("
           [(0, 0), (10, 4)]
           (intersectionPoints (readWire ["U4", "R14", "U6"]) (readWire ["R10", "U13", "R3", "D5"])))
    , testGroup
        "intersects"
        [ testCase
            "should tell me if a pair intersects"
            (assertEquals True (intersects ((0, 1), (5, 1)) ((2, 0), (2, 3))))
        , testCase
            "should tell me  vertical lines do not intersect"
            (assertEquals False (intersects ((5, 1), (5, 3)) ((1, 0), (1, -3))))
        , testCase
            "should tell me horizontal  lines do not intersect"
            (assertEquals False (intersects ((5, 1), (3, 1)) ((1, 0), (5, 0))))
        , testCase
            "should tell me false if the intersection point is out of bounds"
            (assertEquals False (intersects ((0, 0), (0, 5)) ((1, 0), (3, 0))))
        , testCase
            "should tell me false if the intersection point is out of bounds"
            (assertEquals False (intersects ((0, 4), (13, 4)) ((13, 13), (13, 8))))
        ]
    , testGroup
        "intersectionPoint"
        [ testCase
            "should tell me unbounded intersection point"
            (assertEquals (0, 0) (unboundedIntersectionPoint ((0, 0), (0, 5)) ((1, 0), (3, 0))))
        , testCase
            "should tell me unbounded intersection point"
            (assertEquals (0, 0) (unboundedIntersectionPoint ((1, 0), (3, 0)) ((0, 0), (0, 5))))
        , testCase
            "REG should tell me false if the intersection point is out of bounds"
            (assertEquals (13, 4) (unboundedIntersectionPoint ((0, 4), (13, 4)) ((13, 13), (13, 8))))
        ]
    , testGroup
        "pointInBounds"
        [ testCase
            "should tell me a point on a vertical line is in bounds"
            (assertEquals True (pointIsOnLine (0, 3) ((0, 0), (0, 6))))
        , testCase
            "should tell me a point on a vertical line is out of bounds"
            (assertEquals False (pointIsOnLine (0, -1) ((0, 0), (0, 6))))
        , testCase
            "should tell me a point on a vertical line is out of bounds"
            (assertEquals False (pointIsOnLine (0, 7) ((0, 0), (0, 6))))
        , testCase
            "should tell me a point on a horizontal line is in bounds"
            (assertEquals True (pointIsOnLine (3, 0) ((0, 0), (6, 0))))
        , testCase
            "should tell me a point on a horizontal line out of bounds"
            (assertEquals False (pointIsOnLine (-1, 0) ((0, 0), (6, 0))))
        , testCase
            "should tell me a point on a horizontal line out of bounds"
            (assertEquals False (pointIsOnLine (7, 0) ((0, 0), (6, 0))))
        , testCase
            "should tell me a point on a horizontal line is in bounds when dawn r -> l "
            (assertEquals True (pointIsOnLine (3, 0) ((6, 0), (0, 0))))
        , testCase
            "should tell me a point on a vertical line is in bounds when dawn u -> d "
            (assertEquals True (pointIsOnLine (0, 3) ((0, 6), (0, 0))))
        , testCase
            "should tell me a point on a vertical line when the x is wrong"
            (assertEquals False (pointIsOnLine (4, 4) ((0, 0), (0, 4))))
        , testCase
            "should tell me a point on a vertical line when the x is wrong and drawn downward"
            (assertEquals False (pointIsOnLine (4, 4) ((0, 4), (0, 0))))
        , testCase
            "should tell me a point on a horizontal line when the x is wrong "
            (assertEquals False (pointIsOnLine (4, 4) ((0, 0), (4, 0))))
        , testCase
            "should tell me a point on a horizontal line when the x is wrong r -> l"
            (assertEquals False (pointIsOnLine (4, 4) ((4, 0), (0, 0))))
        ]
    ]

manhattanDistanceTest :: TestTree
manhattanDistanceTest =
  testGroup
    "manhattanDistance"
    [ testCase
        "should find manhattan distance"
        (assertEquals [3, 6, 12, 9] (pointsToManhattan [(1, 2), (4, 2), (4, 8), (-4, 5)]))
    , testCase
        "should give me the shortest manhattan distance"
        (assertEquals 3 (shortestManhattan [(4, 2), (1, 2), (4, 8)]))
    , testCase
        "should give me the shortest manhattan distance when its negative"
        (assertEquals 2 (shortestManhattan [(4, 2), (1, 2), (4, 8), (-1, -1)]))
    , testCase
        "should give me the shortest manhattan for two wires"
        (assertEquals 6 (closestCross ["R8", "U5", "L5", "D3"] ["U7", "R6", "D4", "L4"]))
    , testCase
        "should give me the shortest manhattan for two in input format"
        (assertEquals 6 (closestCross (splitOnCommas "R8,U5,L5,D3") (splitOnCommas "U7,R6,D4,L4")))
    ]

stepCalculatorTest =
  testGroup
    "stepCalculator"
    [ testCase
        "should find the number of steps to a point on a line"
        (assertEquals 8 (numberOfSteps (4, 4) (readWire ["U4", "R10"])))
    , testCase
        "should find the number of steps to a point on a line"
        (assertEquals 20 (numberOfSteps (3, 3) (readWire ["U7", "R6", "D4", "L4"])))
    , testCase
        "should find combined number of steps for both intersection points"
        (assertEqual
           ":("
           [30, 40]
           (zipIntersections
              [(6, 5), (3, 3)]
              (readWire (splitOnCommas "U7,R6,D4,L4"))
              (readWire (splitOnCommas "R8,U5,L5,D3"))))
    , testCase
        "should find distance in a point is on a line"
        (assertEquals 3 (distanceTillPoint (1, 5) ((1, 2), (1, 8))))
    , testCase
        "should find distance in a point is on a line"
        (assertEquals 6 (distanceTillPoint (7, 2) ((1, 2), (8, 2))))
    , testCase
        "should find distance in a point is on a line when drawn downwards"
        (assertEquals 3 (distanceTillPoint (1, 5) ((1, 8), (1, 2))))
    , testCase
        "should find distance in a point is on a line when drawn r -> l"
        (assertEquals 1 (distanceTillPoint (7, 2) ((8, 2), (1, 2))))
    , testCase "should tell me the length of a vertical line" (assertEquals 3 (segmentLength ((0, 0), (0, 3))))
    , testCase
        "should tell me the length of a vertical line drawn downward"
        (assertEquals 3 (segmentLength ((0, 3), (0, 0))))
    , testCase "should tell me the lenght of a horizontal line" (assertEquals 3 (segmentLength ((0, 0), (3, 0))))
    , testCase
        "should tell me the lenght of a horizontal line drawn r -> l"
        (assertEquals 3 (segmentLength ((3, 0), (0, 0))))
    , testCase
        "REG should tell lengths of a few segments"
        (assertEquals [7, 6, 4, 4] (map ((segmentLength . head) . readWire) [["U7"], ["R6"], ["D4"], ["L4"]]))
    , testCase
        "REG should tell lengths of a few segments"
        (assertEquals [7, 6, 4, 4] (map segmentLength (readWire ["U7", "R6", "D4", "L4"])))
    ]
