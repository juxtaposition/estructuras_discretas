module Practica5 where

import Data.Char


-- Fucion que toma un String or [Char] y lo convierte a uppercase
hollerBack :: [Char] -> [Char]
hollerBack [] = []
hollerBack (x:xs) = (toUpper x):(hollerBack xs) 

-- Toma un numero decimal y lo convierte a un array binario
decimal_binario :: Int -> [Int]
decimal_binario 0 = [0]
decimal_binario 1 = [1]
decimal_binario n = (decimal_binario (n `div` 2)) ++ [mod n 2]

-- Function que repite un numero n veces y lo regresa en una lista
replica x 0 = []
replica x 1 = [x]
replica x n = [x] ++ (replica x (n-1))
