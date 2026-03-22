module Natural (DTNat(..), sumaNat, multiNat) where

data DTNat = Cero | S DTNat deriving(Eq, Show)

-- Esta funcion suma dos DTNat y regresa un nuevo DTNat
sumaNat :: DTNat -> DTNat -> DTNat
sumaNat (Cero) (Cero) = Cero

-- Recursion
sumaNat (Cero) (S m) = S ( sumaNat Cero m)
sumaNat (S n) (Cero) = S ( sumaNat n Cero)
sumaNat (S n) (S m) = S (S (sumaNat n m))

-- Esta funcion hace uso de la sumaNat para poder multiplicar dos DTNat
multiNat :: DTNat -> DTNat -> DTNat
multiNat Cero Cero = Cero
multiNat (S Cero) Cero = Cero
multiNat Cero (S Cero) = Cero
multiNat (S Cero) (S m) = (S m)
multiNat (S n) (S Cero) = (S n)

-- Recursion
multiNat (S n) (S m) =  sumaNat (S n) (multiNat (S n) m)


