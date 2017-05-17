module Reverse where

rvrs :: String -> String
rvrs x =
    -- "awesome"
    (drop 9 x) ++ " " ++
    -- "is"
    (take 2 (drop 6 x)) ++ " " ++
    -- "Curry"
    (take 5 x)

main :: IO ()
main = print $ rvrs "Curry is awesome"