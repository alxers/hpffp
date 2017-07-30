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