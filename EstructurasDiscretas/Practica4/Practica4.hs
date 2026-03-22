import Natural (DTNat(..), sumaNat, multiNat)
 

-- Este metodo lo que hace tomar un entero y devolver su similar con un tipo de dato DTNat 
a_natural :: Int -> DTNat 
a_natural 0 = Cero
a_natural x = S ( a_natural (x-1))

-- Este metodo toma un tipo de Dato DTNat (S (S Cero)) y regresa un entero
a_entero :: DTNat -> Int
a_entero Cero = 0
a_entero (S x) = 1 + (a_entero x)

-- Este metodo toma dos DTNat y regresa la potencia de un DTNat elevado a un DTNat
potenciaNat :: DTNat -> DTNat -> DTNat
potenciaNat Cero Cero = (S Cero)
potenciaNat (S n) Cero = (S Cero)
potenciaNat Cero (S m) = Cero
potenciaNat (S n) (S Cero) = (S n)
potenciaNat (S n) (S m) =  multiNat (S n) (potenciaNat (S n) m) 
