import qualified Data.Set as Set
type Prime = Integer

fac :: Integer -> Integer
fac 0 = 1
fac n = (* n) . fac $ (n - 1)

data Permutation = Permutation { n :: [Int], k :: Int }

count :: Permutation -> Int
count (Permutation objects k)
  | k == 0 = 0
  | k == 1 = n
  | otherwise = (* n) . count $ Permutation (tail objects) (k - 1)
  where n = length objects

--act :: Permutation -> [[Int]]
--act perm =

allCombinations :: Set.Set a -> [[a]]
allCombinations set =
  let list = Set.toList set
  in _allCombinations list

_allCombinations :: [a] -> [[a]]
_allCombinations [] = [[]]
_allCombinations objs =
  (objs >>= (\obj -> map (obj:) . _allCombinations . tail $ objs))

sieve :: (Integral a) => [a] -> [a]
sieve [] = []
sieve (p : xs) = p : sieve [x | x <- xs, x `mod` p > 0]

primes = take 1000 $ sieve [2..]

factorize :: Integer -> [Prime]
factorize num
  | num `elem` primes = [num]
  | otherwise = smallestPrime : factorize (num `div` smallestPrime)
  where smallestPrime = last . filter (\prime -> num `mod` prime == 0) $ primes

-- Q: why last or head doesn't matter and don't affect the result?
-- well since order of multiplication could be ignored this can be, but:
-- is there only one way to factorize any number?
