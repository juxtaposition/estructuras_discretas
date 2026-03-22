import Natural (DTNat(..))
 

-- Este metodo lo que hace tomar un entero y devolver su similar con un tipo de dato DTNat 
a_natural :: Int -> DTNat 
a_natural 0 = Cero
a_natural x = S ( a_natural (x-1))

-- Este metodo toma un tipo de Dato DTNat (S (S Cero)) y regresa un entero
a_entero :: DTNat -> Int
a_entero Cero = 0
a_entero (S x) = 1 + (a_entero x)

