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
