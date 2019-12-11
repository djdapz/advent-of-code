module Problem5 where

instructionToModes :: Int -> [Int]
instructionToModes i = [mod (i `div` 10000) 10, mod (i `div` 1000) 10, mod (i `div` 100) 10, i `mod` 100]
