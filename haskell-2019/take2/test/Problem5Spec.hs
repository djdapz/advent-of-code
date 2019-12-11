module Problem5Spec where

import           Test.Tasty
import           Test.Tasty.HUnit

import           Assertions
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
        [ testCase "convert normal to codes" ([0, 0, 0, 2] `assertEquals` instructionToModes 2)
        , testCase "should convert 001 to codes" ([0, 0, 1, 2] `assertEquals` instructionToModes 102)
        , testCase "should convert 010 to codes" ([0, 1, 0, 2] `assertEquals` instructionToModes 1002)
        , testCase "should convert 100 to codes" ([1, 0, 0, 2] `assertEquals` instructionToModes 10002)
        ]
    , testCase
        "should multiply with mode 000 "
        ([10000, 4, 6, 0, 10, 100, 1000] `assertEquals` processInstruction 0 [2, 4, 6, 0, 10, 100, 1000])
    , testCase
        "should multiply with mode 001 (immediate write)"
        ([102, 4, 6, 10000, 10, 100, 1000] `assertEquals` processInstruction 0 [102, 4, 6, 0, 10, 100, 1000])
    , testCase
        "should multiply with mode 010 (immediate read)"
        ([60, 4, 6, 0, 10, 100, 1000] `assertEquals` processInstruction 0 [1002, 4, 6, 0, 10, 100, 1000])
    , testCase
        "should multiply with mode 100 (immediate read)"
        ([400, 4, 6, 0, 10, 100, 1000] `assertEquals` processInstruction 0 [1002, 4, 6, 0, 10, 100, 1000])
    ]
