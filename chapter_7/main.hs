module Chapter7 where
    -- 1. Which (two or more) of the following are equivalent?
    -- a) mTh x y z = x * y * z
    -- b) mTh x y = \z -> x * y * z
    -- c) mTh x = \y -> \z -> x * y * z
    -- d) mTh = \x -> \y -> \z -> x * y * z
    -- All equivalent

    -- 2. The type of mTh 3 is Num a => a -> a -> a (Shouldn't this be an Integer -> Integer -> Integer ?)

    -- 3. 
    -- a) Rewrite the f function in the where clause.
		-- addOneIfOdd n = case odd n of
		-- True -> f n
		-- False -> n
		-- where f n = n + 1

		-- addOneIfOdd n = case odd n of
		-- True -> f n
		-- False -> n
		-- where f = \n -> n + 1

	-- b) addFive x y = (if x > y then y else x) + 5
		-- addFive = \x -> \y -> (if x > y then y else x) + 5

	-- c) mflip f = \x -> \y -> f y x
		-- mflip f x y = f y x

    -- Pattern matching
    -- Intermission: Exercises
    
    -- 1. k (x, y) = x
       -- k1 = k ((4-1), 10)
       -- k2 = k ("three", (1 + 2))
       -- k3 = k (3, True)
       
       -- a) Type of k is k :: (a, b) -> a
       -- b) k2 :: [Char], not the same as k1 and k3
       -- c) k3
    
    -- 2. 
	-- f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
	-- f (a, b, c) (d, e, f) = ((a, d), (c, f))


