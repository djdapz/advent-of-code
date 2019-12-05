module Main where

import           Test.Tasty
import           Test.Tasty.HUnit

import           Lib
import           MathLib
import           Problem1Spec
import           Problem2Spec

main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [demoTests, problem1Tests, problem2Tests]

demoTests :: TestTree
demoTests = testGroup "Demo Tests" [sayYoTest, add5Test]

sayYoTest :: TestTree
sayYoTest = testCase "Testing sayYo" (assertEqual "Should say Yo to Friend!" "hi! Friend!" (sayHI "Friend!"))

add5Test :: TestTree
add5Test = testCase "Testing add5" (assertEqual "Should add 5 to get 10" 10 (addTwo 9 1))
