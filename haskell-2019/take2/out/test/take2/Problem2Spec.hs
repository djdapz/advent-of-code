module Problem2Spec
  ( problem2Tests
  ) where

import           Test.Tasty
import           Test.Tasty.HUnit

import           Problem2

problem2Tests :: TestTree
problem2Tests =
  testGroup "Problem2" [listUtilityTests, addCommandTests, multiplyCommandTests, intcodeCompileTest, processWordAtTest]

intcodeCompileTest :: TestTree
intcodeCompileTest =
  testGroup
    "intcodeCompile"
    [ testCase
        "shouldComplieList"
        (assertEqual ":(" [1, 2, 4, 13, 2, 2, 2, 2, 99] (intcodeCompile [1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 12, 3, 99]))
    ]

processWordAtTest :: TestTree
processWordAtTest =
  testGroup
    "processWordAt"
    [ testCase
        "should process word at position"
        (assertEqual ":(" [1, 54, 4, 5, 2, 6, 9, 1] (processWordAt 1 [1, 2, 4, 5, 2, 6, 9, 1]))
    ]

addCommandTests :: TestTree
addCommandTests =
  testGroup
    "addCommand"
    [ testCase "add in place" (assertEqual ":(" [1, 4, 4, 1] (addCommand 0 [1, 0, 4, 1]))
    , testCase
        "add in place works for large arrays"
        (assertEqual ":(" [1, 0, 4, 5, 0, 4, 0, 0] (addCommand 0 [1, 0, 4, 5, 0, 0, 0, 0]))
    , testCase
        "add in place works for second word"
        (assertEqual ":(" [1, 2, 4, 5, 1, 1, 1, 1] (addCommand 1 [1, 2, 4, 5, 1, 1, 1, 1]))
    ]

multiplyCommandTests :: TestTree
multiplyCommandTests =
  testGroup
    "multiplyCommand"
    [ testCase "multiply in place" (assertEqual ":(" [2, 8, 4, 1] (multiplyCommand 0 [2, 2, 4, 1]))
    , testCase
        "multiply can happen as the second word"
        (assertEqual ":(" [1, 54, 4, 5, 2, 6, 9, 1] (multiplyCommand 1 [1, 2, 4, 5, 2, 6, 9, 1]))
    ]

listUtilityTests :: TestTree
listUtilityTests =
  testGroup "listUtility" [testCase "replace replaces index" (assertEqual ":(" [0, 2, 0, 0] (replace [0, 0, 0, 0] 1 2))]
