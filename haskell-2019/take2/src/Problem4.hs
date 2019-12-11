module Problem4 where

containsDoubleDigit' :: String -> Bool
containsDoubleDigit' [x]        = False
containsDoubleDigit' [x, y]     = x == y
containsDoubleDigit' (x:y:rest) = x == y || containsDoubleDigit' (y : rest)

containsDoubleDigit :: String -> Bool
containsDoubleDigit [x] = False
containsDoubleDigit [x, y] = x == y
containsDoubleDigit [x, y, z] = (x == y || y == z) && x /= z
containsDoubleDigit [w, x, y, z]
  | w == x && w /= y = True
  | x == y && x /= w && y /= z = True
  | y == z && y /= x = True
  | otherwise = False
containsDoubleDigit (w:x:y:z:rest)
  | w == x && x /= y = True
  | x == y && x /= w && y /= z = True
  | y == z = containsDoubleDigit (x : y : z : rest)
  | otherwise = containsDoubleDigit (z : rest)

digitsIncrease :: String -> Bool
digitsIncrease [x, y]     = x <= y
digitsIncrease (x:y:rest) = (x <= y) && digitsIncrease (y : rest)

passwordRange :: Int -> Int -> [Int]
passwordRange lower upper =
  [password | password <- [lower .. upper], containsDoubleDigit (show password), digitsIncrease (show password)]

passwordRangeA :: Int -> Int -> [Int]
passwordRangeA lower upper =
  [password | password <- [lower .. upper], containsDoubleDigit' (show password), digitsIncrease (show password)]
