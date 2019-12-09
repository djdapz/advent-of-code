module Main where

import           Lib
import           MathLib
import           Problem1
import           Problem2

main :: IO ()
main = do
  print ("Problem1a: " ++ show (sum [massToFuel x | x <- problem1Data]))
  print ("Problem1b: " ++ show (sum [recursiveMassToFuel x | x <- problem1Data]))
  print ("Problem2a: " ++ show (head (intcodeCompile 0 problem2Input)))
  someFunc
