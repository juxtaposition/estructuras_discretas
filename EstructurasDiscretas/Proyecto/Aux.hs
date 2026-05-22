module Aux (stringTo8BitsBinary) where

import Data.Char (ord, intToDigit)


stringToInt :: [Char] -> [Int]
stringToInt [] = []
stringToInt (x:xs) = [ord x] ++ stringToInt (xs)

decimalToBinary :: Int -> [Int]
decimalToBinary 0 = []
decimalToBinary n = decimalToBinary (n `div` 2) ++ [n `mod` 2]

completeTo8Bits :: Num a => [a] -> [a]
completeTo8Bits (x:xs) = if length (x:xs) == 7 then [0] ++ (x:xs) else (x:xs)

decimalListToBinaryList :: [Int] -> [Int]
decimalListToBinaryList [] = []
decimalListToBinaryList (x:xs) = (completeTo8Bits (decimalToBinary x)) ++ (decimalListToBinaryList xs)

reduceList :: [Int] -> [Char]
reduceList [] = ""
reduceList (x:xs) = [(intToDigit x)] ++ reduceList xs

stringTo8BitsBinary :: [Char] -> [Char]
stringTo8BitsBinary s = reduceList $ decimalListToBinaryList ( stringToInt s )

