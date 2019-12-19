module Problem5Spec where

import           Test.Tasty
import           Test.Tasty.HUnit

import           Assertions
import           Intcode
import           Problem2
import           Problem5

problem5Tests :: TestTree
problem5Tests = testGroup "Problem5" [modeTest]

modeTest :: TestTree
modeTest =
  testGroup
    "mode"
    [ testGroup
        "command to modes"
        [ testCase "convert normal to codes" ((0, 0, 0) `assertEquals` instructionToModes 2)
        , testCase "should convert 001 to codes" ((0, 0, 1) `assertEquals` instructionToModes 102)
        , testCase "should convert 010 to codes" ((0, 1, 0) `assertEquals` instructionToModes 1002)
        , testCase "should convert 100 to codes" ((1, 0, 0) `assertEquals` instructionToModes 10002)
        ]
    , testCase
        "should multiply with mode 000 "
        ([2, 4, 6, 4, 15, 100, 5] `assertEquals` processInstruction 0 [2, 4, 6, 4, 3, 100, 5])
    , testCase
        "should multiply with mode 010 (immediate read)"
        ([1002, 4, 6, 4, 18, 100, 5] `assertEquals` processInstruction 0 [1002, 4, 6, 4, 3, 100, 5])
    , testCase
        "should multiply with mode 100 (immediate read)"
        ([10002, 4, 6, 4, 20, 100, 5] `assertEquals` processInstruction 0 [10002, 4, 6, 4, 3, 100, 5])
    ]
