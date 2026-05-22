import Data.Map (Map, fromList, insertWith, empty, toList)
import Data.List (sortOn)
import Data.Ord (Down(..))
import Data.Text (replace, pack, unpack)
import Data.Bits
import Aux (stringTo8BitsBinary) 

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


-- Convert a Huffman tree into a map with the Character and his representation in binary
charDicc :: BT (Maybe a, b) -> [(a, [Char])]
charDicc Void = []
charDicc (BT (Just c, _) Void Void) = [(c, "")]
charDicc (BT _ l r) = [(c, '0':rest) | (c, rest) <- charDicc l] ++ [(c, '1':rest) | (c, rest) <- charDicc r]

-- Convert from a list of chars and values to the binary representation
-- We used the replace from Data.Text pack and unpack is for conver String to Text and viceversa
convertToBinary :: [(Char, String)] -> String -> String
convertToBinary [] xs = xs
convertToBinary ((k, v):rest) xs = convertToBinary rest (unpack (replace (pack [k]) (pack v) (pack xs)))

-- We are using an auxiliar fn for find the character for each bit code
decode :: BT (Maybe a, b) -> [Char] -> [a] -> [a]
decode huffmanTree [] acc = acc
decode huffmanTree (x:xs) acc = decode huffmanTree (snd (decodeAux huffmanTree (x:xs))) (acc ++ (fst (decodeAux huffmanTree (x:xs))))

-- Get the character encoded by the binary data we are moving from 0 (left) or 1 (right)
decodeAux :: BT (Maybe a, b) -> [Char] -> ([a], [Char])
decodeAux (BT (Just k, v) Void Void) (xs) = ([k], xs)
decodeAux (BT (Nothing, v) t1 t2) (x:xs) = if x == '0' then decodeAux t1 xs else decodeAux t2 xs


-- TODO: Crate a more verbose main
main :: IO ()
main = do
    putStrLn "Inserta la cadena a encodear:"
    originalText <- getLine
    -- putStrLn ("Cadena a encodear: " ++ originalText)
    let originalFreqMap = freqList (createDicc originalText)
    putStrLn "Tabla de frecuencia con sus valores: "
    print originalFreqMap
    putStrLn ""
    putStrLn "Ahora utilizando el mapeo (table) de frecuencias contruiremos el arbol de huffman: "
    let huffmanTree = buildHuffman (convertToNodos (originalFreqMap))
    print huffmanTree
    putStrLn ""
    let charDiccValues = charDicc (huffmanTree)
    putStrLn "Por cada caracter le corresponde un codigo de huffman (bit al recorrer el arbol izq o der): "
    print charDiccValues
    putStrLn ""
    putStrLn "Y su represnetacion en binario queda como:"
    let binaryCode = convertToBinary (charDiccValues) originalText
    putStrLn binaryCode
    putStrLn ""
    putStrLn "Ahora usando el arbol de arriba y su representacion en binario obtendremos la cadena orinal:"
    putStrLn (decode huffmanTree binaryCode "")
    putStrLn "################# ACTIVIDAD #################"
    putStrLn "Vamos a comparar el size de la cadena original en bits y de la generada con huffman:"
    putStrLn "Size de la cadena original en bits:"
    let originalTextLen = length (stringTo8BitsBinary originalText)
    print originalTextLen
    putStrLn ""
    putStrLn "Ahora el size en bits de la cadena generada con huffman:"
    let newTextLen = length binaryCode
    print newTextLen
    putStrLn ""
    putStrLn "El ahorro fue de: "
    putStrLn ((show (originalTextLen - newTextLen)) ++ " bits")


