module Problem1Spec
  ( problem1Tests
  ) where

import           Test.Tasty
import           Test.Tasty.HUnit

import           Problem1

problem1Tests :: TestTree
problem1Tests = testGroup "Problem1" [massToFuelTest, recursiveMassToFuelTest]

massToFuelTest :: TestTree
massToFuelTest =
  testGroup
    "Convert Mass To Fuel"
    [ testCase "case1" (assertEqual ":(" 2 (massToFuel 12))
    , testCase "case2" (assertEqual ":(" 2 (massToFuel 14))
    , testCase "case3" (assertEqual ":(" 654 (massToFuel 1969))
    , testCase "case4" (assertEqual ":(" 33583 (massToFuel 100756))
    , testCase
        "should turn list of masses into total fuel"
        (assertEqual "hi" (2 + 2 + 654) (massesToFuel [12, 14, 1969]))
    ]

recursiveMassToFuelTest :: TestTree
recursiveMassToFuelTest =
  testGroup
    "Recursive Mass To Fuel"
    [ testCase "should not recurse beyond 0" (assertEqual ":(" 2 (recursiveMassToFuel 12))
    , testCase "should not recurse to incldue the mass of the previous" (assertEqual ":(" 12 (recursiveMassToFuel 40))
    , testCase "should not ork for a big one" (assertEqual ":(" 966 (recursiveMassToFuel 1969))
    ]
