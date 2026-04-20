module Practica6 where

data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

nVacios :: Arbol a -> Int
nVacios Vacio = 0
nVacios (AB n Vacio Vacio) = 2
nVacios (AB n t1 Vacio) = 1 + nVacios(t1)
nVacios (AB n Vacio t2) = 1 + nVacios(t2)
nVacios (AB n t1 t2) = nVacios(t1) + nVacios(t2)



