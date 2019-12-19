module IntcodeSpec where

import           Test.Tasty
import           Test.Tasty.HUnit

import           Assertions
import           Intcode
import           Problem2

intcodeTest :: TestTree
intcodeTest =
  testGroup
    "intcode"
    [ testGroup
        "newVersion"
        [ testCase "both versions should be equivalent" (intcodeCompile 0  problem2Input `assertEquals` intcodeCompile 0  problem2Input)
        ]
    , testGroup
        "readParameter"
        [ testCase "should read reference when in mode 0" (4 `assertEquals` readParameter [8, 4, 3, 5, 12, 6] (1, 0))
        , testCase "should read direct when in mode 1" (1 `assertEquals` readParameter [8, 4, 3, 5, 12, 6] (1, 1))
        , testCase
            "should read reference when in mode 0"
            (6 `assertEquals` readParameter [8, 4, 3, 5, 12, 6, 99] (5, 0))
        , testCase "should read direct when in mode 1" (5 `assertEquals` readParameter [8, 4, 3, 5, 12, 6] (5, 1))
        ]
--    , testGroup
--        "addCommand"
--        [ testCase "returns sum given a word all in mode 0 " (assertEquals 8 (addCommand [1, 5, 3, 8] (1, 0) (2, 0)))
--        , testCase
--            "returns sum given a word all in mode 1s"
--            (assertEquals 110 (addCommand [3, 0, 4, 12, 9, 0, 0, 0] (99, 1) (11, 1)))
--        , testCase "add  works for large arrays" (assertEquals 3 (addCommand [3, 0, 4, 12, 9, 0, 0, 0] (0, 0) (1, 0)))
--        , testCase
--            "add direct works for large arrays"
--            (assertEquals 1 (addCommand [3, 0, 4, 12, 9, 0, 0, 0] (0, 1) (1, 1)))
--        ]
--    , testGroup
--        "multiplyCommand"
--        [ testCase
--            "returns sum given a word all in mode 0 "
--            (assertEquals 0 (multiplyCommand [1, 0, 2, 1] (1, 0) (2, 0)))
--        , testCase
--            "returns sum given a word all in mode 1 "
--            (assertEquals 2 (multiplyCommand [1, 0, 2, 1] (1, 1) (2, 1)))
--        , testCase
--            "add  works for large arrays"
--            (assertEquals 36 (multiplyCommand [3, 0, 4, 12, 9, 0, 0, 0] (0, 0) (3, 0)))
--        , testCase
--            "add direct works for large arrays"
--            (assertEquals 18 (multiplyCommand [3, 0, 4, 12, 9, 0, 0, 0] (2, 1) (9, 1)))
--        ]
    , testGroup
        "processInstruction"
        [ testCase
            "readWord figures out multiply command"
            (assertEquals [11002, 36, 4, 1, 9, 0, 0, 0] (processInstruction 0 [11002, 9, 4, 1, 9, 0, 0, 0]))
        , testCase
            "readWord figures out add command"
            (assertEquals [1001, 1005, 4, 1, 9, 0, 0, 0] (processInstruction 0 [1001, 0, 4, 1, 9, 0, 0, 0]))
        , testCase
            "readWord figures out add command later on"
            (assertEquals [18, 0, 4, 1, 11002, 9, 2, 0] (processInstruction 1 [3, 0, 4, 1, 11002, 9, 2, 0]))
        ]
    , testGroup
        "readInstruction"
        [ testCase
            "readInstruction parses out wrod"
            (assertEquals (2, 0, 4, 1, (1, 1, 1)) (readInstruction 0 [11102, 0, 4, 1, 9, 0, 0, 0]))
        , testCase
            "readInstruction parses out wrod"
            (assertEquals (9, 0, 0, 0, (0, 0, 1)) (readInstruction 1 [11102, 0, 4, 1, 109, 0, 0, 0]))
        ]
