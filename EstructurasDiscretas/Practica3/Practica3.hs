import Practica2

-- Actividad 1
sumaSoloInt :: Int -> Int -> Int
sumaSoloInt a b = a + b

sumaNum :: Num a => a -> a -> a
sumaNum a b = a + b


-- Funciones

data Materia = Materia String Int deriving Show -- Tal vez deriving show no sea necesario pero lo use par debugear
materias :: [Materia]
materias = [Materia "Algebra Superior" 10, Materia "Estructuras Discretas" 10, Materia "Matematicas para las Ciencias Aplicadas I" 12, Materia "Introduccion a las Cienciasa de la Computacion" 10, Materia "Ingles I" 04]

-- Función auxiliatr para obtener de un tipo Materia su creditos
obtenerCreditos :: Materia -> Int
obtenerCreditos (Materia _ c) = c

-- Función auxiliar para obtener el nombre de una Materia
soloNombre :: Materia -> String
soloNombre (Materia n _) = n

-- Aca filtramos las materias por los creditos y regreamos una lista de String
creditos :: Int -> [String]
creditos a = [(soloNombre m) | m <- materias, obtenerCreditos m == a]


-- Aca ya importamos la practica2 y usamos la funcion esPar
-- Usamos lista de compreción para crear la nueva lista con solo pares
soloPares :: [Int] -> [Int]
soloPares [] = []
soloPares xs = [y | y <- xs, esPar y]

-- Tenemo que regresar el numero de elementos negativos en una lista
negativos :: [Int] -> Int
negativos xs = length [y | y <- xs, y < 0]

-- Primos

-- Esta función solo regresa los divisores de nuestro numero, asi que si es un primo
-- solo debe regresar 2 y no mas en otro caso es compuesto
divisores x = [y | y <- [1..x], x `mod` y == 0]

-- Aca solo filtramos a los numeros que cumplran con la condicion de que sus divisores sean solo 2
primos :: [Int] -> [Int]
primos xs = [ x | x <- xs, length (divisores x ) == 2]

-- Minimo comun divisor de dos numeros
divisoresComunes a b = [ x | x <- (divisores a), y <- (divisores b), x == y]

-- Verifica si dos numeros son coprimos
coprimosAux a b = (length (divisoresComunes a b )) == 1

-- Regresa todo los numeros coprimos a un entero dado
coprimos a = [x | x <- [1..a], coprimosAux x a]
