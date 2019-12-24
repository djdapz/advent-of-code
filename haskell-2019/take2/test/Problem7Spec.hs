module Problem7Spec where

import           Test.Tasty
import           Test.Tasty.HUnit

import           Assertions
import           Problem7

problem7Tests :: TestTree
problem7Tests = testGroup "Problem7" [amplifiersTest]

amplifiersTest :: TestTree
amplifiersTest = testGroup "amplifiers" [testCase "should ?" (assertEquals 1 1)]
