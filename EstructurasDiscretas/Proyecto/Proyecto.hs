import Data.Map (Map, fromList, insertWith, empty, toList)
import Data.List (sortOn)
import Data.Ord (Down(..))
import Data.Text (replace, pack, unpack)

-- Is more easy just create the type instead write all the time the Type for each fn using Maps
type FreqMap = Map Char Int

-- Binary Tree data type
data BT a = Void | BT a (BT a ) (BT a) deriving (Eq, Ord, Show)

-- upsert the Map with the new key value
upsertDicc :: Char -> FreqMap -> FreqMap
upsertDicc key mp = insertWith (+) key 1 mp

-- Build the dicc with the key value of each character
createDicc :: [Char] -> FreqMap
createDicc xs = foldr (\c -> upsertDicc c) empty xs

-- Convert from Map (FreqMap) to List
freqList :: FreqMap -> [(Char, Int)]
freqList fm = sortOn snd (toList fm)

-- convertToNodos :: [(a, b)] -> [BT (a, b)]
convertToNodos xs = [BT (Just c, n) Void Void | (c,n) <- xs]

-- Auxiliar funtion whiuch return the freq value
-- freq :: Num b => BT (a, b) -> b
freq (BT (Just _, n) _ _) = n
freq (BT (Nothing, n) _ _) = n
freq Void = 0

-- En realidad se ve feo y grande pero son solo los casos que tuve que agregar para hacer el patter matching! 
-- a lo mejor hay una mejor manera pero pues asi me salio :D
buildHuffman :: (Num b, Ord b) => [BT (Maybe a, b)] -> BT (Maybe a, b)
buildHuffman [t] = t
buildHuffman ((BT (Just n, x) t1 t2):(BT (Nothing, y) t3 t4):[]) = (BT (Nothing, x + y) (BT (Just n, x) t1 t2) (BT (Nothing, y) t3 t4))
buildHuffman ((BT (Nothing, x) t1 t2):(BT (Just m, y) t3 t4):[]) = (BT (Nothing, x + y) (BT (Nothing, x) t1 t2) (BT (Just m, y) t3 t4))
buildHuffman ((BT (Nothing, x) t1 t2):(BT (Nothing, y) t3 t4):[]) = (BT (Nothing, x + y) (BT (Nothing, x) t1 t2) (BT (Nothing, y) t3 t4))
buildHuffman ((BT (Just n, x) t1 t2):(BT (Just m, y) t3 t4):rest) =
    buildHuffman
        (sortOn freq
            (BT (Nothing, x + y) (BT (Just n, x) t1 t2) (BT (Just m, y) t3 t4) : rest))

buildHuffman ((BT (Nothing, x) t1 t2):(BT (Just m, y) t3 t4):rest) =
    buildHuffman
        (sortOn freq
            (BT (Nothing, x + y) (BT (Nothing, x) t1 t2) (BT (Just m, y) t3 t4) : rest))

buildHuffman ((BT (Just n, x) t1 t2):(BT (Nothing, y) t3 t4):rest) =
    buildHuffman
        (sortOn freq
            (BT (Nothing, x + y) (BT (Just n, x) t1 t2) (BT (Nothing, y) t3 t4) : rest))

buildHuffman ((BT (Nothing, x) t1 t2):(BT (Nothing, y) t3 t4):rest) =
    buildHuffman
        (sortOn freq
            (BT (Nothing, x + y) (BT (Nothing, x) t1 t2) (BT (Nothing, y) t3 t4) : rest))


paso ((BT (Just n, x) t1 t2):(BT (Just m, y) t3 t4):rest) =
        (sortOn freq
            (BT (Nothing, x + y) (BT (Just n, x) t1 t2) (BT (Just m, y) t3 t4) : rest))


mapCode (BT (Just c, _) Void Void) = [(c, "")]
mapCode (BT _ l r) =
    [(c, '0':code) | (c, code) <- mapCode l] ++
    [(c, '1':code) | (c, code) <- mapCode r]
mapCode Void = []

binaryBody [] xs = xs
binaryBody ((k, v):rest) xs = binaryBody rest (unpack (replace (pack [k]) (pack v) (pack xs)))

main :: IO ()
main = do
    putStrLn "Inserta la cadena a encodear:"
    text <- getLine
    print (buildHuffman (convertToNodos (freqList (createDicc text))))


