module Intcode where


runIntcode :: [Int] -> Int
runIntcode list = head (intcodeCompile 0 list)

intcodeCompile :: Int -> [Int] -> [Int]
intcodeCompile instructionPointer list
  | key == 99 = list
  | otherwise = intcodeCompile (instructionPointer + 1) (processInstruction instructionPointer list)
  where
    key = list !! (instructionPointer * 4)

processInstruction :: Int -> [Int] -> [Int]
processInstruction wordNumber list
  | key == 1 = addCommand wordNumber list
  | key == 2 = multiplyCommand wordNumber list
  | otherwise = error "wrong optcode"
  where
    key = mod (list !! (wordNumber * 4)) 100

selectFromInstruction :: [Int] -> Int -> Int -> Int
selectFromInstruction list offset index = list !! (index + offset)

getParameter :: [Int] -> Int -> Int -> Int
getParameter input offset param = input !! selectFromInstruction input offset param

addCommand :: Int -> [Int] -> [Int]
addCommand wordNumber input =
  let offset = wordNumber * 4
      getParameterAt = getParameter input offset
   in replace input (selectFromInstruction input offset 3) (getParameterAt 1 + getParameterAt 2)

multiplyCommand :: Int -> [Int] -> [Int]
multiplyCommand wordNumber input =
  let offset = wordNumber * 4
      getParameterAt = getParameter input offset
   in replace input (selectFromInstruction input offset 3) (getParameterAt 1 * getParameterAt 2)

replace :: [Int] -> Int -> Int -> [Int]
replace list index value = take index list ++ [value] ++ drop (index + 1) list