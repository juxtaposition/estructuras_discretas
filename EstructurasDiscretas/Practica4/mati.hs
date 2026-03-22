module Mati (Matrioska(..)) where

data Matrioska = Mati | Cont Matrioska deriving(Eq, Show)

