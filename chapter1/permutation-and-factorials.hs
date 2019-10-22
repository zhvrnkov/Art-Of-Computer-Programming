data Permutation = Permutation { n :: [Int], k :: Int }

count :: Permutation -> Int
count (Permutation objects k)
  | k <= 0 = 0
  | k == 1 = n
  | n <= 0 = 0
  | otherwise = (* n) . count $ Permutation (tail objects) (k - 1)
  where n = length objects

allcombinations :: [a] -> [[a]]

allcombinations [] = [[]]
allcombinations objects =
  (objects >>= (\object -> map (object:) . allcombinations . tail $ objects))

ac :: [a] -> [[a]]

ac [] = [[]]
ac os =
  map t os
  where t = \o -> map (o:) . ac . tail $ os
