module Hamming (distance) where
hamming :: String -> String -> Int
hamming (x : xs) (y : ys) = (if x == y then 0 else 1) + hamming xs ys
hamming [] [] = 0

distance :: String -> String -> Maybe Int
distance [] [] = Just 0
distance _ [] = Just 0
distance [] _ = Just 0
distance xs ys =
  if length xs /= length ys
  then
    Nothing
  else
      Just (hamming xs ys)
