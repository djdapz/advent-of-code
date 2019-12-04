module Lib
    ( someFunc,
    sayHI
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

sayHI :: String -> String
sayHI word = "hi! " ++ word