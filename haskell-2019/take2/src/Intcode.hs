module Intcode where

type Modes = (Int, Int, Int)

type ParamAndMode = (Int, Int)

type IntcodeWord = (Int, Int, Int, Int, Modes)

runIntcode :: [Int] -> Int
runIntcode list = head (fst (intcodeCompile 0 (list, "", 1)))

compile :: [Int] -> ([Int], String)
compile = compileWithInput 1

compileWithInput :: Int -> [Int] -> ([Int], String)
compileWithInput input list = intcodeCompile 0 (list, "", input)

intcodeCompile :: Int -> ([Int], String, Int) -> ([Int], String)
intcodeCompile instructionPointer (list, output, input)
  | key == 99 = (list, output)
  | key == 8 = intcodeCompile (instructionPointer + 4) (equals list instructionPointer, output, input)
  | key == 7 = intcodeCompile (instructionPointer + 4) (lessThan list instructionPointer, output, input)
  | key == 6 = intcodeCompile (jumpZero list instructionPointer) (list, output, input)
  | key == 5 = intcodeCompile (jumpNonZero list instructionPointer) (list, output, input)
  | key == 4 = intcodeCompile (instructionPointer + 2) (list, output ++ show (read (instructionPointer + 1, m1)), input)
  | key == 3 =
    intcodeCompile
      (instructionPointer + 2)
      (replace list (readFromIndex list (instructionPointer + 1, 1)) input, output, input)
  | key == 2 = intcodeCompile (instructionPointer + 4) (multiply list instructionPointer, output, input)
  | key == 1 = intcodeCompile (instructionPointer + 4) (add list instructionPointer, output, input)
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

eq a b
  | a == b = 1
  | otherwise = 0

less a b
  | a < b = 1
  | otherwise = 0

multiply :: [Int] -> Int -> [Int]
multiply = fourArgCommand (*)

add :: [Int] -> Int -> [Int]
add = fourArgCommand (+)

equals :: [Int] -> Int -> [Int]
equals = fourArgCommand eq

lessThan :: [Int] -> Int -> [Int]
lessThan = fourArgCommand less

jumpNonZeroTransform :: Int -> Int -> Int -> Int
jumpNonZeroTransform p1 p2 ip
  | p1 == 0 = ip + 3
  | otherwise = p2

jumpZeroTransform :: Int -> Int -> Int -> Int
jumpZeroTransform p1 p2 ip
  | p1 == 0 = p2
  | otherwise = ip + 3

jumpCommand :: (Int -> Int -> Int -> Int) -> [Int] -> Int -> Int
jumpCommand transform list ip =
  let (_, m2, m1) = instructionToModes (list !! ip)
      p1 = readFromIndex list (ip + 1, m1)
      p2 = readFromIndex list (ip + 2, m2)
   in transform p1 p2 ip

jumpNonZero :: [Int] -> Int -> Int
jumpNonZero = jumpCommand jumpNonZeroTransform

jumpZero :: [Int] -> Int -> Int
jumpZero = jumpCommand jumpZeroTransform

replace :: [Int] -> Int -> Int -> [Int]
replace list index value = take index list ++ [value] ++ drop (index + 1) list

readFromIndex :: [Int] -> (Int, Int) -> Int
readFromIndex list (index, 0) = list !! (list !! index)
readFromIndex list (index, 1) = list !! index

instructionToModes :: Int -> Modes
instructionToModes i = (mod (i `div` 10000) 10, mod (i `div` 1000) 10, mod (i `div` 100) 10)

slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)
