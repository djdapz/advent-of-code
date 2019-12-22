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
        [testCase "both versions should be equivalent" (compile problem2Input `assertEquals` compile problem2Input)]
    , testCase "should read direct when in mode 1" (6 `assertEquals` readFromIndex [8, 4, 3, 5, 12, 6] (5, 1))
    , testGroup
        "command to modes"
        [ testCase "convert normal to codes" ((0, 0, 0) `assertEquals` instructionToModes 2)
        , testCase "should convert 001 to codes" ((0, 0, 1) `assertEquals` instructionToModes 102)
        , testCase "should convert 010 to codes" ((0, 1, 0) `assertEquals` instructionToModes 1002)
        , testCase "should convert 100 to codes" ((1, 0, 0) `assertEquals` instructionToModes 10002)
        ]
    , testCase
        "should multiply with mode 000 "
        ([2, 4, 6, 4, 15, 100, 5] `assertEquals` multiply [2, 4, 6, 4, 3, 100, 5] 0)
    , testCase
        "should multiply with mode 010 (immediate read)"
        ([1002, 4, 6, 4, 18, 100, 5] `assertEquals` multiply [1002, 4, 6, 4, 3, 100, 5] 0)
    , testCase
        "should multiply with mode 100 (immediate read)"
        ([102, 4, 6, 4, 20, 100, 5] `assertEquals` multiply [102, 4, 6, 4, 3, 100, 5] 0)
    ]
