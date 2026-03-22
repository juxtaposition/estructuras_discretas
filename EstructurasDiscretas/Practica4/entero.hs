module Entero (Ent(..), sumaEnt) where 

data Ent = Zero | Suc Ent | Neg Ent deriving(Show,Eq)

mayorEnt :: Ent -> Ent -> Bool
mayorEnt (Suc n) Zero = True
mayorEnt Zero (Suc m) = False
mayorEnt (Neg n) Zero = False
mayorEnt Zero (Neg m) = True
mayorEnt (Neg n) (Suc m) = False
mayorEnt (Suc n) (Neg m) = True
mayorEnt (Suc n) (Suc m) = mayorEnt n m
mayorEnt (Neg n) (Neg m) = not (mayorEnt n m)

sumaEnt :: Ent -> Ent -> Ent
sumaEnt Zero (Suc m) = (Suc m)
sumaEnt Zero (Neg m) = (Neg m)
sumaEnt (Suc n) Zero = (Suc n)
sumaEnt (Neg n) Zero = (Neg n)
sumaEnt (Suc n) (Suc m) = Suc(sumaEnt n (Suc m))
sumaEnt (Neg n) (Neg m) = Neg (sumaEnt n m)
sumaEnt (Suc n) (Neg m) = if (Suc n)==m then Zero else restaEnt (Suc n) m
sumaEnt (Neg n) (Suc m) = if n==(Suc m) then Zero else restaEnt (Suc m) n

restaEnt :: Ent -> Ent -> Ent
restaEnt (Suc n) Zero = (Suc n)
restaEnt (Neg n) Zero = (Neg n)
restaEnt Zero (Neg m) = m
restaEnt Zero (Suc m) = Neg (Suc m)
restaEnt (Suc n) (Suc m) = if ((Suc n) == (Suc m)) then Zero else if (mayorEnt (Suc n) (Suc m)) then restaEnt n m else Neg (restaEnt m n)
restaEnt (Neg n) (Neg m) = sumaEnt (Neg n) m
restaEnt (Suc n) (Neg m) = sumaEnt (Suc n) m
restaEnt (Neg n) (Suc m) = Neg (Suc (sumaEnt n m))


