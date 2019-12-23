module Lib where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

sayHI :: String -> String
sayHI word = "hi! " ++ word

splitOn :: Char -> String -> [String]
splitOn symbol = splitWhere (== symbol)

splitOnCommas :: String -> [String]
splitOnCommas = splitOn ','

splitWhere :: (Char -> Bool) -> String -> [String]
splitWhere p s =
  case dropWhile p s of
    "" -> []
    s' -> w : splitWhere p s''
      where (w, s'') = break p s'
