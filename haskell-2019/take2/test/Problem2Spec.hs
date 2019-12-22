module Problem2Spec
  ( problem2Tests
  ) where

import           Test.Tasty
import           Test.Tasty.HUnit

import           Assertions
import           Intcode
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
        (assertEquals 4462686 (runIntcode (problem2Input `withNoun` 12 `withVerb` 2)))
    , testCase
        "should convert pairs to a actual value"
        (assertEquals
           [ (runIntcode (problem2Input `withNoun` 1 `withVerb` 1), 101)
           , (runIntcode (problem2Input `withNoun` 1 `withVerb` 2), 102)
           , (runIntcode (problem2Input `withNoun` 2 `withVerb` 1), 201)
           , (runIntcode (problem2Input `withNoun` 2 `withVerb` 2), 202)
           ]
           (pairsToIntcode problem2Input 2))
    , testCase
        "should tell me which noun verb give me the desired output"
        (assertEquals 201 (searchForValue problem2Input 100 1222685))
    ]

intcodeCompileTest :: TestTree
intcodeCompileTest =
  testGroup
    "intcodeCompile"
    [ testCase
        "shouldComplieList"
        (assertEquals
           ([1, 2, 1, 101, 2, 2, 3, 2, 1, 1, 12, 3, 99], "")
           (compile [1, 1, 1, 1, 2, 2, 3, 2, 1, 1, 12, 3, 99]))
    , testCase "shouldComplieList2" (assertEquals ([4, 0, 0, 0, 99], "") (compile [2, 0, 0, 0, 99]))
    , testCase "shouldCompileExample" (assertEquals ([2, 0, 0, 0, 99], "") (compile [1, 0, 0, 0, 99]))
    , testCase "shouldCompileExample" (assertEquals ([2, 3, 0, 6, 99], "") (compile [2, 3, 0, 3, 99]))
    , testCase
        "shouldCompileExample"
        (assertEquals ([2, 4, 4, 5, 99, 9801], "") (compile [2, 4, 4, 5, 99, 0]))
    , testCase
        "shouldCompileExampleWithNegatives"
        (assertEquals ([1101, 100, -1, 4, 99], "") (compile [1101, 100, -1, 4, 0]))
    , testCase
        "shouldCompileExample"
        (assertEquals ([30, 1, 1, 4, 2, 5, 6, 0, 99], "") (compile [1, 1, 1, 4, 99, 5, 6, 0, 99]))
    , testGroup
        "opcode 4"
        [ testCase "shouldPutValuesInOutputWithOpcode4" ("99" `assertEquals` snd (compile [4, 2, 99]))
        , testCase
            "shouldPutValuesInOutputWithOpcode4"
            ("499" `assertEquals` snd (compile [4, 2, 4, 4, 99]))
        , testCase
            "shouldLetOpcode4WorkInDirectMode"
            ("299" `assertEquals` snd (compile [104, 2, 4, 4, 99]))
        ]
    , testGroup
        "opcode 4"
        [ testCase
            "shouldReadInOneForInputWithOpcode3"
            ([1, 0, 99] `assertEquals` fst (compile [3, 0, 99]))
        ]
    , testGroup
        "opcode 8 (Equals)"
        [ testCase
            "should assert  equal in direct mode"
            ([1108, 1, 3, 1, 99] `assertEquals` fst (compile [1108, 3, 3, 1, 99]))
        , testCase
            "should assert not equal in direct mode"
            ([1108, 0, 3, 1, 99] `assertEquals` fst (compile [1108, 2, 3, 1, 99]))
        , testCase
            "should assert equal in indirect mode"
            ([8, 2, 3, 1, 99] `assertEquals` fst (compile [8, 2, 3, 3, 99]))
        , testCase
            "should assert equal in indirect mode"
            ([8, 2, 0, 2, 99] `assertEquals` fst (compile [8, 2, 3, 2, 99]))
        ]
    , testGroup
        "opcode 7 (less than)"
        [ testCase
            "should assert  less in direct mode"
            ([1107, 1, 3, 1, 99] `assertEquals` fst (compile [1107, 2, 3, 1, 99]))
        , testCase
            "should assert not less in direct mode when greater"
            ([1107, 0, 3, 1, 99] `assertEquals` fst (compile [1107, 4, 3, 1, 99]))
        , testCase
            "should assert not less in direct mode when equal"
            ([1107, 0, 3, 1, 99] `assertEquals` fst (compile [1107, 3, 3, 1, 99]))
        , testCase
            "should assert less than in indirect mode"
            ([7, 2, 3, 0, 99] `assertEquals` fst (compile [7, 2, 3, 3, 99]))
        , testCase
            "should assert less than in indirect mode"
            ([7, 1, 4, 1, 99] `assertEquals` fst (compile [7, 1, 4, 3, 99]))
        ]
    , testGroup
        "opcode 5 (jump if non zero)"
        [ testCase
            "should jump in direct mode"
            ([8, 2, 5, 2, 2, 1101, 4, 4, 0, 99] `assertEquals` fst (compile [1105, 2, 5, 2, 2, 1101, 4, 4, 0, 99]))
        , testCase
            "should  not jump when false jump in indirect mode"
            ([5, 2, 0, 1102, 2202, 1101, 4, 99] `assertEquals` fst (compile [5, 2, 0, 1102, 2, 1101, 4, 99]))
        , testCase
            "should jump when true in indirect mode"
            ([38, 2, 4, 1102, 7, 3439393, 312341234, 1101, 5, 33, 0, 99] `assertEquals`
             fst (compile [5, 2, 4, 1102, 7, 3439393, 312341234, 1101, 5, 33, 0, 99]))
        ]
    , testGroup
        "opcode 5 (jump if zero)"
        [ testCase
            "should not jump in direct mode whe non zero"
            ([1106, 2, 5, 1102, 2202, 1101, 4, 99] `assertEquals` fst (compile [1106, 2, 5, 1102, 2, 1101, 4, 99]))
        , testCase
            "should  jump in direct mode when zero"
            ([1106, 103, 5, 1102, 2, 1101, 4, 99, 1, 99] `assertEquals`
             fst (compile [1106, 0, 5, 1102, 2, 1101, 4, 99, 1, 99]))
        , testCase
            "should  jump in indirect mode when zero"
            ([55, 4, 5, 1102, 0, 9, 4, 99, 1, 1101, 22, 33, 0, 99] `assertEquals`
             fst (compile [6, 4, 5, 1102, 0, 9, 4, 99, 1, 1101, 22, 33, 0, 99]))
        ]
     ]

addCommandTests :: TestTree
addCommandTests =
  testGroup
    "addCommand"
    [ testCase "add in place" (assertEquals [1, 3, 2, 1] (add [1, 1, 2, 1] 0))
    , testCase
        "add in place works for large arrays"
        (assertEquals [1, 0, 4, 5, 0, 1, 0, 0] (add [1, 0, 4, 5, 0, 0, 0, 0] 0))
    , testCase
        "add in place works for second word"
        (assertEquals [1, 4, 4, 5, 1, 1, 1, 1] (add [1, 2, 4, 5, 1, 1, 1, 1] 4))
    ]

multiplyCommandTests :: TestTree
multiplyCommandTests =
  testGroup
    "multiplyCommand"
    [ testCase "multiply in place" (assertEquals [2, 3, 6, 2] (multiply [2, 3, 1, 2] 0))
    , testCase
        "multiply can happen as the second word"
        (assertEquals [1, 5, 4, 5, 2, 5, 7, 1] (multiply [1, 2, 4, 5, 2, 5, 7, 1] 4))
    ]

listUtilityTests :: TestTree
listUtilityTests =
  testGroup "listUtility" [testCase "replace replaces index" (assertEquals [0, 2, 0, 0] (replace [0, 0, 0, 0] 1 2))]
