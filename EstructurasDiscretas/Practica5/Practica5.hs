module Practica5 where

import Data.Char


-- Fucion que toma un String or [Char] y lo convierte a uppercase
hollerBack :: [Char] -> [Char]
hollerBack [] = []
hollerBack (x:xs) = (toUpper x):(hollerBack xs) 
