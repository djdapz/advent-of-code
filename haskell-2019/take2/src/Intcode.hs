module Intcode where

type Modes = (Int, Int, Int)

type ParamAndMode = (Int, Int)

type IntcodeWord = (Int, Int, Int, Int, Modes)

runIntcode :: [Int] -> Int
runIntcode list = head (fst (intcodeCompile 0 (list, "")))

intcodeCompile :: Int -> ([Int], String) -> ([Int], String)
intcodeCompile instructionPointer (list, output)
  | key == 99 = (list, output)
  | key == 4 = intcodeCompile (instructionPointer + 2) (list, output ++ show (read (instructionPointer + 1, m1)))
  | key == 2 = intcodeCompile (instructionPointer + 4) (multiply list instructionPointer, output)
  | key == 1 = intcodeCompile (instructionPointer + 4) (add list instructionPointer, output)
  | otherwise =
    error
      ("Cannot find" ++
       show key ++ " from " ++ show instruction ++ "list = " ++ show list ++ " pointer =" ++ show instructionPointer)
  where
    instruction = list !! instructionPointer
    key = instruction `mod` 100
    read = readFromIndex list
    (m3, m2, m1) = instructionToModes instruction

fourArgCommand :: (Int -> Int -> Int) -> [Int] -> Int -> [Int]
fourArgCommand transformation list ip =
  let (_, m2, m1) = instructionToModes (list !! ip)
      destination = readFromIndex list (ip + 3, 1)
      p1 = readFromIndex list (ip + 1, m1)
      p2 = readFromIndex list (ip + 2, m2)
   in replace list destination (transformation p1 p2)

plus a b = a + b

times a b = a * b

multiply :: [Int] -> Int -> [Int]
multiply = fourArgCommand times

add :: [Int] -> Int -> [Int]
add = fourArgCommand plus

replace :: [Int] -> Int -> Int -> [Int]
replace list index value = take index list ++ [value] ++ drop (index + 1) list

readFromIndex :: [Int] -> (Int, Int) -> Int
readFromIndex list (index, 0) = list !! (list !! index)
readFromIndex list (index, 1) = list !! index

instructionToModes :: Int -> Modes
instructionToModes i = (mod (i `div` 10000) 10, mod (i `div` 1000) 10, mod (i `div` 100) 10)

slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)
