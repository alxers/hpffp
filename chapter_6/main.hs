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
