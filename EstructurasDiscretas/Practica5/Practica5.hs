module Practica5 where

import Data.Char


-- Funcion que toma un String or [Char] y lo convierte a uppercase
hollerBack :: [Char] -> [Char]
hollerBack [] = []
hollerBack (x:xs) = (toUpper x):(hollerBack xs) 

-- Toma un numero decimal y lo convierte a un array binario
decimal_binario :: Int -> [Int]
decimal_binario 0 = [0]
decimal_binario 1 = [1]
decimal_binario n = (decimal_binario (n `div` 2)) ++ [mod n 2]

-- Function que repite un numero n veces y lo regresa en una lista
replica :: Int -> Int -> [Int]
replica x 0 = []
replica x 1 = [x]
replica x n = [x] ++ (replica x (n-1))


-- Recupera un elemento en una lista basado en su indice
recuperaElemento :: [Int] -> Int -> Int
recuperaElemento (x:xs) 0 = x
recuperaElemento (x:xs) i = recuperaElemento (xs) (i-1) 


-- Rota, toma el primer elemento de la lista y lo mueve al final esto lo repite n veces
-- sobre la lista resultante en cada paso
rota :: [Int] -> Int -> [Int]
rota [] n = []
rota l 0 = l
rota (x:xs) n = rota (xs ++ [x]) (n-1)

-- funcion extranio
extranio :: Int -> [Int]
extranio n = [n] ++ (exAux n)

-- Implementacion del algoritmo extranio
exAux :: Int -> [Int]
exAux 1 = []
exAux n = if mod n 2 == 0 then [n `div` 2] ++ exAux (n `div` 2) else [(n * 3) + 1] ++ exAux ((n * 3) + 1)
