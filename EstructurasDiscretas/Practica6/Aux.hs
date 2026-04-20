module Aux  (arbolALista, minListAux,  Arbol(..)) where

data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

arbolALista :: Arbol a -> [a]
arbolALista (AB n Vacio Vacio) = [n]
arbolALista (AB n Vacio t2) = [n] ++ (arbolALista t2)
arbolALista (AB n t1 Vacio) = [n] ++ (arbolALista t1)
arbolALista (AB n t1 t2) = [n] ++ ((arbolALista t1) ++ (arbolALista t2))

minListAux :: Ord t => [t] -> t -> t
minListAux []  x = x
minListAux (x:xs) y = if x < y then (minListAux (xs) x) else (minListAux xs y)