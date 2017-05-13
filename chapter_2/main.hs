module Chapter2 where

    -- Ex. 2.12
    -- let x = 3; y = 1000 in x * 3 + y
    -- let y = 10; x = 10 * 5 + y in x * 5
    -- let x = 7; y = negate x; z = y * 10 in z / x + y
    
    where1 =
        x * 3 + y
        where
        x = 3
        y = 1000

    where2 =
        x * 5
        where
        x = 10 * 5 + y
        y = 10

    where3 =
        z / x + y
        where
        x = 7
        y = negate x
        z = y * 10

    -- 2 + 2 * 3 - 1 => 2 + (2 * 3) - 1
    -- (^) 10 $ 1 + 1 => (^) 10 (1 + 1)
    -- 2 ^ 2 * 4 ^ 5 + 1 => (2 ^ 2) * (4 ^ 5) + 1

    
    