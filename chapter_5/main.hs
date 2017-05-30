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
