module Practica6 where

-- Los test me fallabva si sacaba el tipo de dato Arbol a un file como Aux.hs
data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

data TipoDeOrden = InOrder | PreOrder | PostOrder deriving (Eq, Ord, Show)


nVacios :: Arbol a -> Int
nVacios Vacio = 0
nVacios (AB n Vacio Vacio) = 2
nVacios (AB n t1 Vacio) = 1 + nVacios(t1)
nVacios (AB n Vacio t2) = 1 + nVacios(t2)
nVacios (AB n t1 t2) = nVacios(t1) + nVacios(t2)


refleja :: Arbol a -> Arbol a
refleja Vacio = Vacio
refleja (AB n Vacio Vacio) = AB n Vacio Vacio
refleja (AB n t1 Vacio) = AB n Vacio (refleja t1)
refleja (AB n Vacio t2) = AB n (refleja t2) Vacio
refleja (AB n t1 t2) = AB n (refleja t2) (refleja t1)

minimo :: Ord a => Arbol a -> a
minimo Vacio = error "Arbol Vacio"
minimo (AB n t1 t2) = minListAux (arbolALista (AB n t1 t2)) n

arbolALista :: Arbol a -> [a]
arbolALista (AB n Vacio Vacio) = [n]
arbolALista (AB n Vacio t2) = [n] ++ (arbolALista t2)
arbolALista (AB n t1 Vacio) = [n] ++ (arbolALista t1)
arbolALista (AB n t1 t2) = [n] ++ ((arbolALista t1) ++ (arbolALista t2))

minListAux :: Ord t => [t] -> t -> t
minListAux []  x = x
minListAux (x:xs) y = if x < y then (minListAux (xs) x) else (minListAux xs y)


recorrido :: Arbol a -> TipoDeOrden -> [a]
recorrido Vacio _ = []
recorrido (AB x t1 t2) InOrder = recorrido t1 InOrder ++ [x] ++ recorrido t2 InOrder
recorrido (AB x t1 t2) PreOrder = [x] ++ recorrido t1 PreOrder ++ recorrido t2 PreOrder
recorrido (AB x t1 t2) PostOrder = recorrido t1 PostOrder ++ recorrido t2 PostOrder ++ [x]

-- Funcion tomada de las notas del laboratorio.
-- https://github.com/1rv1nn/lab-discretas/blob/main/arbolesHaskell_6/nota.hs#L87
alturaAb :: Arbol a -> Int
alturaAb  Vacio = 0
alturaAb (AB r Vacio Vacio) = 1
alturaAb (AB r t1 t2) =  1 + max (alturaAb t1) (alturaAb t2)

esBalanceado :: Arbol a -> Bool
esBalanceado Vacio = True
esBalanceado (AB _ t1 t2) = if (alturaAb t1) == (alturaAb t2) then True else False

listaArbol :: [Int] -> Arbol Int
listaArbol [] = Vacio
listaArbol (x:[]) = (AB x Vacio Vacio)
listaArbol (x:y:xs) = AB x (AB y Vacio Vacio) (listaArbol xs)