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


-- Convert a Huffman tree into a map with the Character and his representation in binary
charDicc Void = []
charDicc (BT (Just c, _) Void Void) = [(c, "")]
charDicc (BT _ l r) = [(c, '0':rest) | (c, rest) <- charDicc l] ++ [(c, '1':rest) | (c, rest) <- charDicc r]

-- Convert from a list of chars and values to the binary representation
-- We used the replace from Data.Text pack and unpack is for conver String to Text and viceversa
convertToBinary [] xs = xs
convertToBinary ((k, v):rest) xs = convertToBinary rest (unpack (replace (pack [k]) (pack v) (pack xs)))

main :: IO ()
main = do
    putStrLn "Inserta la cadena a encodear:"
    text <- getLine
    let binaryCode = convertToBinary ( charDicc (buildHuffman (convertToNodos (freqList (createDicc text))))) text
    print binaryCode

