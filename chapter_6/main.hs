module Chapter6 where

-- let ones x = snd (divMod x 10)

-- Intermission: Exercises
-- 1) max (length [1, 2, 3]) (length [8, 9, 10, 11, 12])
-- works fine
-- 2) compare (3 * 4) (3 * 5)
-- works fine
-- 3) compare "Julie" True
-- doesn't work, diffent types
-- 4) (5 + 3) > (3 + 6)
-- works fine

--1
data TisAnInteger =
    TisAn Integer

instance Eq TisAnInteger where
    (==) (TisAn x) (TisAn x') = x == x'

--2
data TwoIntegers =
    Two Integer Integer

instance Eq TwoIntegers where
    (==) (Two x y) (Two x' y') = (x == x') && (y == y')

--3
data StringOrInt =
    TisAnInt   Int
  | TisAString String

instance Eq StringOrInt where
    (==) (TisAnInt x) (TisAnInt x') = x == x'
    (==) (TisAString y) (TisAString y') = y == y'

data Pair a =
    Pair a a

instance Eq a => Eq (Pair a) where
    (==) (Pair a a') (Pair b b') = (a == b) && (a' == b')

data Tuple a b =
    Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==) (Tuple a b) (Tuple a' b') = (a == a') && (b == b')

data Which a =
    ThisOne a
  | ThatOne a

instance Eq a => Eq (Which a) where
    (==) (ThisOne a) (ThisOne a') = a == a'
    (==) (ThatOne b) (ThatOne b') = b == b'

data EitherOr a b =
    Hello a
  | Goodbye b

-- instance (Eq a, Eq b) => Eq (EitherOr a b) where
--     (==) (Hello a) (Hello b) = a == b
--     (==) (Goodbye a) (Goodbye b) = a == b

-- 1. The Eq class
-- c) makes equality tests possible
-- 2. The typeclass Ord 
-- c) is a superclass of Eq

-- Does it typecheck?
-- 1) No, function has no instance of Show
-- 2) No, No instance for (Eq Mood) arising from a use of ‘==’ (Needs to have instance of Eq)
-- 4) s1 = Sentence "dogs" "drool" doesn't work
-- s2 = Sentence "Julie" "loves" "dogs" works fine

-- Given a datatype declaration, what can we do?
-- 1) phew = Papu "chases" True - doesn't work, misses data declaration
-- 2) truth = Papu (Rocks "chomskydoz") (Yeah True) - works fine
-- 3) equalityForall :: Papu -> Papu -> Bool; equalityForall p p' = p == p' does typecheck
-- 4) comparePapus :: Papu -> Papu -> Bool; comparePapus p p' = p > p' doesn't typecheck, needs Ord

-- Match the types
-- 1) i :: a doesn't work. No instance for (Num a)
-- 2) f :: Num a => a; f = 1.0. Doesn't work, has to be float
-- 3) f :: Fractional a => a; f = 1.0. Works fine
-- 4) f :: RealFrac a => a; f = 1.0. Works fine
-- 5) freud :: Ord a => a -> a; freud x = x. Works fine
-- 6) freud' :: Int -> Int; freud' x = x. Works fine
-- 7) myX = 1 :: Int; sigmund :: a -> a; sigmund x = myX. Doesn't work
-- 8) myX = 1 :: Int; sigmund' :: Num a => a -> a; sigmund' x = myX. Doesn't work
-- Return value should be Int (not clear why, because Num is a typeclass for all numbers including integers)

-- A typeclass is a sort of interface that defines some behavior. If a type is a part of a typeclass,
-- that means that it supports and implements the behavior the typeclass describes.
-- Num is a numeric typeclass.
-- Int is a type.

-- 9) jung :: [Int] -> Int; jung xs = head (sort xs). Works fine
-- 10) young :: Ord a => [a] -> a; young xs = head (sort xs). Works fine
-- 11) 
--mySort :: [Char] -> [Char]
--mySort = sort

--signifier :: Ord a => [a] -> a
--signifier xs = head (mySort xs)

--Doesn't work. mySort is now constrained to only take and return [Char]

-- Type-Kwon-Do
-- 1) chk :: Eq b => (a -> b) -> a -> b -> Bool; chk a b c = True




