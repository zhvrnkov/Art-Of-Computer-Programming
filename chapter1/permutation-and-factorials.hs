import Data.List

data Permutation = Permutation { n :: [Int], k :: Int }

count :: Permutation -> Int
count (Permutation objects k)
  | k <= 0 = 0
  | k == 1 = n
  | n <= 0 = 0
  | otherwise = (* n) . count $ Permutation (tail objects) (k - 1)
  where n = length objects

allcombinations :: Int -> [[Int]]
allcombinations 0 = []
allcombinations n = _allcombinations n [[1]]

_allcombinations :: Int -> [[Int]] -> [[Int]]
_allcombinations counter perm
  | counter == 1 = perm
  | otherwise = _allcombinations (counter - 1) $ foldl (\acc xs -> acc ++ algorithm xs) [] $ perm

algorithm :: [Int] -> [[Int]]
algorithm objects = algorithm_new tuples bs
  where tuples = algorithm_tuples objects
        bs     = algorithm_bs [1..(length objects + 1)] tuples

algorithm_tuples :: [Int] -> [[Int]]
algorithm_tuples perm = map (\k -> perm ++ [k]) [1..(length perm + 1)]

algorithm_bs :: [Int] -> [[Int]] -> [[Int]]
algorithm_bs ns tuples = map (\tuple -> filter (/= (last tuple)) ns) tuples

algorithm_new :: [[Int]] -> [[Int]] -> [[Int]]
algorithm_new tuples bs = map action $ zip tuples bs
  where action = \(tuple, b) -> (map (\i -> b !! (i - 1)) (init tuple)) ++ [last tuple]
