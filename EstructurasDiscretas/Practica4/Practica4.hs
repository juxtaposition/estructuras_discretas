import Natural (DTNat(..), sumaNat, multiNat)
import Entero (Ent(..), suma_ent)
import Mati (Matrioska(..)) 

-- Este metodo lo que hace tomar un entero y devolver su similar con un tipo de dato DTNat 
a_natural :: Int -> DTNat 
a_natural 0 = Cero

-- Recursion
a_natural x = S ( a_natural (x-1))

-- Este metodo toma un tipo de Dato DTNat (S (S Cero)) y regresa un entero
a_entero :: DTNat -> Int
a_entero Cero = 0

-- Recursion
a_entero (S x) = 1 + (a_entero x)

-- Este metodo toma dos DTNat y regresa la potencia de un DTNat elevado a un DTNat
potenciaNat :: DTNat -> DTNat -> DTNat
potenciaNat Cero Cero = (S Cero)
potenciaNat (S n) Cero = (S Cero)
potenciaNat Cero (S m) = Cero
potenciaNat (S n) (S Cero) = (S n)
 
-- Recursion
potenciaNat (S n) (S m) =  multiNat (S n) (potenciaNat (S n) m) 

-- Este metodo toma un DNat y regres su factorial
facNat :: DTNat -> DTNat
facNat Cero = (S Cero)

-- Recursion
facNat (S n) = multiNat (S n) (facNat n)

-- Metodo que multiplica dos Ent (enteros) y regresa un Ent
multiEnt :: Ent -> Ent -> Ent
multiEnt Zero Zero = Zero
multiEnt (Succ Zero) Zero = Zero
multiEnt Zero (Succ Zero) = Zero
multiEnt (Succ Zero) (Succ m) = (Succ m)
multiEnt (Succ n) (Succ Zero) = (Succ n)

-- Recursion
multiEnt (Succ n) (Succ m) =  suma_ent (Succ n) (multiEnt (Succ n) m)

-- Funcion mayor or igual que compra dos matrioskas
mayorIgual Mati Mati = True
mayorIgual (Cont Mati) (Mati) = True
mayorIgual Mati (Cont m) = False

-- Recursion
mayorIgual (Cont n) (Cont m) = mayorIgual n m


-- Funcion aplana que convierte una lista planta de todas las matrioskas que la componen
aplana Mati = [Mati]

-- Recursion
aplana (Cont n) = [(Cont n)] ++ aplana(n)

