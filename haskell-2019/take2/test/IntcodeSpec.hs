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
        [ testCase
            "both versions should be equivalent"
            (intcodeCompile 0 problem2Input `assertEquals` intcodeCompile 0 problem2Input)
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
    , testGroup
        "processInstruction"
        [ testCase
            "readWord figures out multiply command"
            (assertEquals [1102 , 36, 4, 1, 9, 0, 0, 0] (processInstruction 0 [1102, 9, 4, 1, 9, 0, 0, 0]))
        , testCase
            "readWord figures out add command"
            (assertEquals [1001, 1005, 4, 1, 9, 0, 0, 0] (processInstruction 0 [1001, 0, 4, 1, 9, 0, 0, 0]))
        , testCase
            "readWord figures out add command later on"
            (assertEquals [18, 0, 4, 1, 1102, 9, 2, 0] (processInstruction 1 [3, 0, 4, 1, 1102, 9, 2, 0]))
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
    ]
