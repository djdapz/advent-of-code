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
            (intcodeCompile 0 (problem2Input, "") `assertEquals` intcodeCompile 0 (problem2Input, ""))
        ]
    , testCase "should read direct when in mode 1" (6 `assertEquals` readFromIndex [8, 4, 3, 5, 12, 6] (5, 1))
    ]
