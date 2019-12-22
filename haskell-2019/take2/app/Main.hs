module Main where

import           Intcode
import           Lib
import           MathLib
import           Problem1
import           Problem2
import           Problem3
import           Problem4
import           Problem5

p2a = head (fst (compile (problem2Input `withNoun` 12 `withVerb` 2)))

main :: IO ()
main = do
  print ("Problem1a: " ++ show (sum [massToFuel x | x <- problem1Data]))
  print ("Problem1b: " ++ show (sum [recursiveMassToFuel x | x <- problem1Data]))
  print ("Problem2a: " ++ show p2a)
  print ("Problem2a: " ++ show (searchForValue problem2Input 100 19690720))
  print ("Problem3a: " ++ show (closestCross (splitOnCommas problem3Wire1) (splitOnCommas problem3Wire2)))
  print ("Problem3b: " ++ show (closestIntersection (splitOnCommas problem3Wire1) (splitOnCommas problem3Wire2)))
  print ("Problem4a: " ++ show (length (passwordRangeA 264793 803935)))
  print ("Problem4b: " ++ show (length (passwordRange 264793 803935)))
  print ("Problem5a: " ++ show (snd (compile problem5Input)))
  print ("Problem5a: " ++ show (snd (compileWithInput 5 problem5Input)))
