import Data.Bits

sayHello :: String -> IO ()
sayHello x = putStrLn ("Hello, " ++ x) 

calcularPropina :: Float -> Float 
calcularPropina x = x * (0.10) -- Soy pobre solo el 10 :P

-- No usar recursion, entonces hay que usa if then else
menor :: [Int] -> Int
menor (x:[])   = x
menor (x:y:[]) = if x > y then y else x
menor (x:y:z:[]) = if x < y
                     then if x < z
                       then x else z
                   else if y < z then y
                       else z

decide :: Bool -> String -> String -> String
decide b t f = if b then t else f

-- No sé si deba agregar tantos caso pero es que si no los agregaba ghci me marcaba errores :P
esDescendiente :: [Int] -> Bool
esDescendiente (x:y:z:[]) = if x > y
                              then if x > y
                                then if y > z
                                  then True else False
                                else False
                              else False

-- Usando el amigo modulito y mirando el residuo de divir x / y
esDivisible :: Int -> Int -> IO ()
esDivisible x 0 = putStrLn ("No se puede dividir entre cero")
esDivisible x y = if x `mod` y == 0
                  then putStrLn (show x ++ " es divislbe por " ++ show y)
                  else putStrLn (show x ++ " no es divislbe por " ++ show y)

-- Es para usando solo bitwise
-- Cuando el bit significativo es 0 regresa 0
-- esto es porque los numero pares en binario terminar en cero y los impares en 1
-- ejemplo: 5 = 101 Impart, 6 = 110 (par), 7 = 111 (impar), 8 = 1000, etc
esPar :: Int -> Bool
esPar n = (n .&. 1) == 0

hipotenusa :: Float -> Float -> Float
hipotenusa a b = sqrt(b^2 + a^2)

pendiente :: (Float, Float) -> (Float, Float) -> Float
pendiente (x1, y1) (x2, y2) = (y2 - y1) / (x2 - x1)

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x1, y1) (x2, y2) = sqrt((x2 - x1)^2 + (y2 - y1)^2)

cuadrados :: [Int] -> [Int]
cuadrados l = [x^2 | x <- l]
