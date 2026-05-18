import Data.Map (Map, fromList, insertWith, empty)

-- Is more easy just create the type instead write all the time the Type for each fn using Maps
type FreqMap = Map Char Int

-- upsert the Map with the new key value
upsertDicc :: Char -> FreqMap -> FreqMap
upsertDicc key mp = insertWith (+) key 1 mp

-- Creamos el diccionario con las freq de cada Char
createDicc :: [Char] -> FreqMap
createDicc xs = foldr (\c -> upsertDicc c) empty xs

main :: IO ()
main = do
    putStrLn "Inserta la cadena a encodear:"
    text <- getLine
    print (createDicc text)


