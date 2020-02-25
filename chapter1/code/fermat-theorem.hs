import Data.Fixed

--mod' :: (RealFrac a) => a -> a -> a
--mod' x y = (x -) . (* y) . fromIntegral . floor $ x/y
--mod' x y = {-x - (y *-} (fromIntegral $ floor $ x / y)

modulo :: (Real a) => a -> a -> a -> Bool
modulo x y z = mod' x z == mod' y z

sieve :: (Integral a) => [a] -> [a]
sieve [] = []
sieve (p : xs) = p : sieve [x | x <- xs, x `mod` p > 0]

take' :: (Integral b) => b -> [a] -> [a]
take' 0 _ = []
take' _ [] = error "Empty list"
take' n (x:xs) = x: take' (n - 1) xs

primes :: (Integral a) => a -> [Integer]
primes first = take' first $ sieve [2..]

proof :: Integer -> Integer -> [(Integer, Bool)]
proof a numberOfPrimes = {-foldr reduce True $ -}map check $ primes numberOfPrimes
  where reduce = \res acc -> res && acc
        check  = \p -> (p, modulo (fromInteger a ^ p) (fromInteger a) (fromInteger p))
