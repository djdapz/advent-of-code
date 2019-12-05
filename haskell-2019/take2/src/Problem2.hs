module Problem2
  ( problem2Input
  , addCommand
  , multiplyCommand
  , intcodeCompile
  , processWordAt
  , replace
  ) where

intcodeCompile :: [Int] -> [Int]
intcodeCompile list = list

processWordAt :: Int -> [Int] -> [Int]
processWordAt wordNumber list
  | key == 99 = list
  | key == 1 = addCommand wordNumber list
  | key == 2 = multiplyCommand wordNumber list
  | otherwise = error "wrong optcode"
  where
    key = list !! (wordNumber * 4)

selectOffset :: [Int] -> Int -> Int -> Int
selectOffset list offset index = list !! (index + offset)

addCommand :: Int -> [Int] -> [Int]
addCommand wordNumber input =
  let offset = wordNumber * 4
      select = selectOffset input offset
   in replace input (select 3) (select 1 + select 2)

multiplyCommand :: Int -> [Int] -> [Int]
multiplyCommand wordNumber input =
  let offset = wordNumber * 4
      select = selectOffset input offset
   in replace input (select 3) (select 1 * select 2)

replace :: [Int] -> Int -> Int -> [Int]
replace list index value = take index list ++ [value] ++ drop (index + 1) list

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
