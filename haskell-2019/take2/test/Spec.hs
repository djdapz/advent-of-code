module Main where

import           Test.Tasty
import           Test.Tasty.HUnit

import           IntcodeSpec
import           Lib
import           MathLib
import           Problem1Spec
import           Problem2Spec
import           Problem3Spec
import           Problem4Spec
import           Problem5Spec
import           Problem6Spec
import           Problem7Spec

main = defaultMain tests

tests :: TestTree
tests =
  testGroup
    "ALL Tests"
    [ problem1Tests
    , intcodeTest
    , problem2Tests
    , problem3Tests
    , problem4Tests
    , problem5Tests
    , problem6Tests
    , problem7Tests
    ]
