module Problem2
  ( withVerb
  , withNoun
  , problem2Input
  , addCommand
  , multiplyCommand
  , intcodeCompile
  , processInstruction
  , replace
  , runIntcode
  , pairsToIntcode
  , searchForValue
  ) where

searchForValue :: [Int] -> Int -> Int -> Int
searchForValue list numberOfPermutations target =
  snd (filter ((== target) . fst) (pairsToIntcode list numberOfPermutations))

pairsToIntcode :: [Int] -> Int -> [(Int, Int)]
pairsToIntcode list size =
  [(runIntcode (list `withNoun` noun `withVerb` verb), verb + (noun * 100)) | noun <- [1 .. size], verb <- [1 .. size]]

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
    key = list !! (wordNumber * 4)

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

withNoun :: [Int] -> Int -> [Int]
list `withNoun` value = replace list 1 value

withVerb :: [Int] -> Int -> [Int]
list `withVerb` value = replace list 2 value

problem2Input :: [Int]
problem2Input =
  [ 1
  , 0
  , 0
  , 3
  , 1
  , 1
  , 2
  , 3
  , 1
  , 3
  , 4
  , 3
  , 1
  , 5
  , 0
  , 3
  , 2
  , 10
  , 1
  , 19
  , 1
  , 19
  , 9
  , 23
  , 1
  , 23
  , 6
  , 27
  , 2
  , 27
  , 13
  , 31
  , 1
  , 10
  , 31
  , 35
  , 1
  , 10
  , 35
  , 39
  , 2
  , 39
  , 6
  , 43
  , 1
  , 43
  , 5
  , 47
  , 2
  , 10
  , 47
  , 51
  , 1
  , 5
  , 51
  , 55
  , 1
  , 55
  , 13
  , 59
  , 1
  , 59
  , 9
  , 63
  , 2
  , 9
  , 63
  , 67
  , 1
  , 6
  , 67
  , 71
  , 1
  , 71
  , 13
  , 75
  , 1
  , 75
  , 10
  , 79
  , 1
  , 5
  , 79
  , 83
  , 1
  , 10
  , 83
  , 87
  , 1
  , 5
  , 87
  , 91
  , 1
  , 91
  , 9
  , 95
  , 2
  , 13
  , 95
  , 99
  , 1
  , 5
  , 99
  , 103
  , 2
  , 103
  , 9
  , 107
  , 1
  , 5
  , 107
  , 111
  , 2
  , 111
  , 9
  , 115
  , 1
  , 115
  , 6
  , 119
  , 2
  , 13
  , 119
  , 123
  , 1
  , 123
  , 5
  , 127
  , 1
  , 127
  , 9
  , 131
  , 1
  , 131
  , 10
  , 135
  , 1
  , 13
  , 135
  , 139
  , 2
  , 9
  , 139
  , 143
  , 1
  , 5
  , 143
  , 147
  , 1
  , 13
  , 147
  , 151
  , 1
  , 151
  , 2
  , 155
  , 1
  , 10
  , 155
  , 0
  , 99
  , 2
  , 14
  , 0
  , 0
  ]

x = problem2Input `withNoun` 2
