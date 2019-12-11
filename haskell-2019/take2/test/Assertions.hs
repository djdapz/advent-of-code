module Assertions where

import           Test.Tasty
import           Test.Tasty.HUnit

assertListIsTrue list = assertEqual "List was not true" [True | _ <- [1 .. (length list)]] list

assertListIsFalse list = assertEqual "List was not false" [False | _ <- [1 .. (length list)]] list

assertTrue = assertEquals True

assertFalse = assertEquals False

assertEquals ::  (Show a, Eq a) => a -> a -> Assertion
assertEquals = assertEqual ":("
