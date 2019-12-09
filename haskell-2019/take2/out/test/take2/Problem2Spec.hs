module Problem2Spec
  ( problem2Tests
  ) where

import           Test.Tasty
import           Test.Tasty.HUnit

import           Problem2

problem2Tests :: TestTree
problem2Tests =
  testGroup "Problem2" [listUtilityTests, addCommandTests, multiplyCommandTests, nounVerbFinderTest, intcodeCompileTest] --, processWordAtTest]

nounVerbFinderTest :: TestTree
nounVerbFinderTest =
  testGroup
    "nounVerbFinder"
    [ testCase
        "shouldreturn expected result"
        (assertEqual ":(" 4462686 (runIntcode (problem2Input `withNoun` 12 `withVerb` 2)))
    , testCase
        "should convert pairs to a actual value"
        (assertEqual
           ":("
           [ (runIntcode (problem2Input `withNoun` 1 `withVerb` 1), 101)
           , (runIntcode (problem2Input `withNoun` 1 `withVerb` 2), 102)
           , (runIntcode (problem2Input `withNoun` 2 `withVerb` 1), 201)
           , (runIntcode (problem2Input `withNoun` 2 `withVerb` 2), 202)
           ]
           (pairsToIntcode problem2Input 2))
    , testCase
        "should tell me which noun verb give me the desired output"
        (assertEqual ":(" 102 (searchForValue problem2Input 100 1222685))
    ]

intcodeCompileTest :: TestTree
intcodeCompileTest =
  testGroup
    "intcodeCompile"
    [ testCase
        "shouldComplieList"
        (assertEqual
           ":("
           [1, 2, 1, 101, 2, 2, 3, 2, 1, 1, 12, 3, 99]
           (intcodeCompile 0 [1, 1, 1, 1, 2, 2, 3, 2, 1, 1, 12, 3, 99]))
    , testCase "shouldComplieList2" (assertEqual ":(" [4, 0, 0, 0, 99] (intcodeCompile 0 [2, 0, 0, 0, 99]))
    ]

processWordAtTest :: TestTree
processWordAtTest =
  testGroup
    "processWordAt"
    [ testCase
        "should process word at position"
        (assertEqual ":(" [1, 54, 4, 5, 2, 6, 9, 1] (processInstruction 1 [1, 2, 4, 5, 2, 6, 9, 1]))
    ]

addCommandTests :: TestTree
addCommandTests =
  testGroup
    "addCommand"
    [ testCase "add in place" (assertEqual ":(" [1, 3, 2, 1] (addCommand 0 [1, 1, 2, 1]))
    , testCase
        "add in place works for large arrays"
        (assertEqual ":(" [1, 0, 4, 5, 0, 1, 0, 0] (addCommand 0 [1, 0, 4, 5, 0, 0, 0, 0]))
    , testCase
        "add in place works for second word"
        (assertEqual ":(" [1, 4, 4, 5, 1, 1, 1, 1] (addCommand 1 [1, 2, 4, 5, 1, 1, 1, 1]))
    ]

multiplyCommandTests :: TestTree
multiplyCommandTests =
  testGroup
    "multiplyCommand"
    [ testCase "multiply in place" (assertEqual ":(" [2, 3, 6, 2] (multiplyCommand 0 [2, 3, 1, 2]))
    , testCase
        "multiply can happen as the second word"
        (assertEqual ":(" [1, 5, 4, 5, 2, 5, 7, 1] (multiplyCommand 1 [1, 2, 4, 5, 2, 5, 7, 1]))
    ]

listUtilityTests :: TestTree
listUtilityTests =
  testGroup "listUtility" [testCase "replace replaces index" (assertEqual ":(" [0, 2, 0, 0] (replace [0, 0, 0, 0] 1 2))]
