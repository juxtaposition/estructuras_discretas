module Practica6 where

import Aux (arbolALista, minListAux, Arbol(..))

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
