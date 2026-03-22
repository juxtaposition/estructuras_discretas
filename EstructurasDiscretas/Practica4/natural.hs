module Natural (DTNat(..)) where

data DTNat = Cero | S DTNat deriving(Eq, Show)
