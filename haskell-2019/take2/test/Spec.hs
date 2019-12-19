module Main where

import           Test.Tasty
import           Test.Tasty.HUnit

import           Lib
import           MathLib
import           IntcodeSpec
import           Problem1Spec
import           Problem2Spec
import           Problem3Spec
import           Problem4Spec
import           Problem5Spec

main = defaultMain tests

tests :: TestTree
tests = testGroup "ALL Tests" [problem1Tests, problem2Tests, problem3Tests, problem4Tests, problem5Tests,  intcodeTest]
