module Chapter5 where

-- not :: Bool -> Bool
-- length :: [a] -> Int
-- concat :: [[a]] -> [a]
-- head :: [a] -> a
-- (<) :: Ord a => a -> a -> Bool

-- 1) type of f is a -> a -> a -> and the type of x is Char
-- then the type of f x is Char -> Char -> Char

-- 2) type of g is a -> b -> c -> b
-- then the type of g 0 'c' "woot" is Char

-- 3) type of h is (Num a, Num b) => a -> b -> b
-- then the type of h 1.0 2 is Num b => b (because :t 2 is Num t => t)

-- 4) type of h is (Num a, Num b) => a -> b -> b
-- then the type of h 1 (5.5 :: Double) is Double

-- 5) type of j is (Ord a, Eq b) => a -> b -> a
-- then the type of j "key" "has" is [Char] (:t "has" [Char])

-- 6) type of j is (Ord a, Eq b) => a -> b -> a
-- then the type of j "key" is Eq b => b -> [Char]

-- 7) type of k is (Ord a, Num b) => a -> b -> a
-- then the type of k 1 2 is Num a => a (similar to question 5), or Ord a => a, not correct (why ???)
-- the correct answer is (Num a, Ord b) => a

-- 8) type of k is (Ord a, Num b) => a -> b -> a
-- then the type of k 1 2 is the same as in 7, because 'a' is returned, not 'b'

-- 9) type of k is (Ord a, Num b) => a -> b -> a
-- then the type of k (1 :: Integer) 2 is Integer (:t (1 :: Integer))

-- Polymorphism

-- 2) let m :: a -> a -> a
-- m a b = a
-- m a b = b
-- is the only possible implementations
-- when given different types error will be raised
-- f.e. m 1 "2" => error

-- 3) let m :: a -> b -> b; m a b = b
-- only one implementation, behaviour doesn't change when type of 'a' or 'b' changes

-- Type inference

-- 1) Type signature of general function
-- (++) :: [a] -> [a] -> [a]
-- How might that change when we apply
-- it to the following value?
-- myConcat x = x ++ " yo"
-- It changes to myConcat :: [Char] -> [Char]

-- 2) ? General function
-- (*) :: Num a => a -> a -> a
-- Applied to a value
-- myMult x = (x / 3) * 5
-- It changes to myMult :: Fractional a => a
-- (correct answer Fractional a => a -> a)

-- 3) take :: Int -> [a] -> [a]
-- myTake x = take x "hey you"
-- It changes to myTake :: Num a => [Char]
-- (correct answer myTake :: Int -> [Char])

-- 4) (>) :: Ord a => a -> a -> Bool
-- myCom x = x > (length [1..10])
-- It changes to myCom :: Int -> Bool

-- 5) (<) :: Ord a => a -> a -> Bool
-- myAlph x = x < 'z'
-- It changes to myAlph :: Char -> Bool

-- Chapter Exercises

-- 1) A value of type [a] is a list whose elements are all of some type a
-- 2) A function of type [[a]] -> [a] could take a list of strings as an argument
-- 3) A function of type [a] -> Int -> a returns one element of type a from a list
-- 4) A function of type (a,b) -> a takes a tuple argument and returns the first value

-- 1.
-- a) (* 9) 6 type is Num a => a
-- b) head [(0, "doge"), (1, "kitten")] type is Num a => (a, [Char])
-- c) head [(0 :: Integer, "doge"), (1, "kitten")] type is (Integer, [Char])
-- d) if False then True else False type is Boolean (correction: Bool)
-- e) length [1,2,3,4,5] type is Int
-- f) (length [1, 2, 3, 4]) > (length "TACOCAT") type is Bool

-- 2. x = 5; y = x + 5; w = y * 10;
-- type of w is Num a => a

-- 3. x = 5; y = x + 5; z y = y * 10
-- type of z is Num a => a -> a

-- 4. x = 5; y = x + 5; f = 4 / y
-- type of f is Fractional a => a

-- 5. x = "Julie"; y = " <3 "; z = "Haskell"; f = x ++ y ++ z
-- type of z is [Char]

-- Determine the type

-- 1) bigNum = (^) 5 $ 10; wahoo = bigNum $ 10
-- won't compile, the same as 9765625 $ 10

-- 2) x = print; z = x "hello world"
-- compiles

-- 3) a = (+); b = 5; c = a b 10; d = a c 200

-- 4) won't compile

-- Type variable or specific type constructor

-- 2) f :: zed -> Zed -> Blah
-- zed - fully polymorphic
-- Zed - concrete
-- Blah - concrete

-- 3) f :: Enum b => a -> b -> C
-- a - fully polymorphic
-- b - constrained polymorphic
-- C - concrete

-- 4) f :: f -> g -> C
-- f - fully p.
-- g - fully p.
-- C - concrete

-- Write a type signature
-- 1) functionH :: x -> x (correct answer functionH :: [t] -> t)
-- functionH (x:_) = x

-- 2) functionC :: x -> y -> Boolean (correct answer functionC :: Ord a => a -> a -> Bool)
-- functionC x y = if (x > y) then True else False

-- 3) functionS :: (x, y) -> y
-- functionS (x, y) = y

-- Given a type, write the function

-- 1) i :: a -> a
-- i a = a

-- 2) c :: a -> b -> a
-- c a b = a

-- 3) c'' :: b -> a -> b
-- c'' b a = b
-- same as 'c' above

-- 4) c' :: a -> b -> b
-- c' a b = b

-- 5) r :: [a] -> [a]
-- r = undefined ?

-- 6) co :: (b -> c) -> (a -> b) -> (a -> c)
-- co ?

-- 7) a :: (a -> c) -> a -> a
-- a = undefined ?

-- 8) a' :: (a -> b) -> a -> b
-- a' = undefined ?

-- Fix it
fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

sing = if (x > y) then fstString x or sndString y
    where x = "Singin"
          y = "Somewhere"
          
-- module Arith3Broken where
-- main :: IO()
-- main = do
--     print (1 + 2)
--     putStrLn "10"
--     print (negate (- 1))
--     print ((+) 0 blah)
--     where blah = negate 1
