module Main where

import           Lib
import           MathLib
import           Problem1
import           Problem2
import           Problem3

main :: IO ()
main = do
  print ("Problem1a: " ++ show (sum [massToFuel x | x <- problem1Data]))
  print ("Problem1b: " ++ show (sum [recursiveMassToFuel x | x <- problem1Data]))
  print ("Problem2a: " ++ show (head (intcodeCompile 0 problem2Input)))
  print ("Problem2a: " ++ show (searchForValue problem2Input 100 19690720))
  print ("Problem3a: " ++ show (closestCross (splitOnCommas problem3Wire1) (splitOnCommas problem3Wire2)))
  print ("Problem3a: " ++ show (closestIntersection (splitOnCommas problem3Wire1) (splitOnCommas problem3Wire2)))
