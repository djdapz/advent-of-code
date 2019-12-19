module Intcode where

type Modes = (Int, Int, Int)

type ParamAndMode = (Int, Int)

type IntcodeWord = (Int, Int, Int, Int, Modes)

runIntcode :: [Int] -> Int
runIntcode list = head (intcodeCompile 0 list)

intcodeCompile :: Int -> [Int] -> [Int]
intcodeCompile instructionPointer list
  | key == 99 = list
  | otherwise = intcodeCompile (instructionPointer + 1) (processInstruction instructionPointer list)
  where
    key = list !! (instructionPointer * 4)

processInstruction :: Int -> [Int] -> [Int]
processInstruction wordNumber list =
  let word = readInstruction wordNumber list
      (instruction, _, _, destination, _) = word
      p1 = get1 list word
      p2 = get2 list word
   in replace list destination (runCommand instruction p1 p2)

selectFromInstruction :: [Int] -> Int -> Int -> Int
selectFromInstruction list offset index = list !! (index + offset)

getParameter :: [Int] -> Int -> Int -> Int
getParameter input offset param = input !! selectFromInstruction input offset param

runCommand :: Int -> Int -> Int -> Int
runCommand key p1 p2
  | key == 1 = p1 + p2
  | key == 2 = p1 * p2
  | otherwise = error ("command (" ++ show key ++ ") not found")


replace :: [Int] -> Int -> Int -> [Int]
replace list index value = take index list ++ [value] ++ drop (index + 1) list

readInstruction :: Int -> [Int] -> IntcodeWord
readInstruction wordNumber input = arrayToWord (slice (wordNumber * 4) (wordNumber * 4 + 3) input)

readParameter :: [Int] -> ParamAndMode -> Int
readParameter list (p, 0) = list !! p
readParameter list (p, 1) = p

instructionToModes :: Int -> Modes
instructionToModes i = (mod (i `div` 10000) 10, mod (i `div` 1000) 10, mod (i `div` 100) 10)

arrayToWord :: [Int] -> IntcodeWord
arrayToWord [a, b, c, d] = (a `mod` 10, b, c, d, instructionToModes a)

getInstruction :: IntcodeWord -> Int
getInstruction (instruction, _, _, _, _) = instruction

get1 :: [Int] -> IntcodeWord -> Int
get1 list (_, p, _, _, (m, _, _)) = readParameter list (p, m)

get2 :: [Int] -> IntcodeWord -> Int
get2 list (_, _, p, _, (_, m, _)) = readParameter list (p, m)

slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)
