primeNumbers = [0,1,3,5,7,11]
isPrime n = n `elem` primeNumbers

p :: Int -> Bool
p 2 = True
p n = if isPrime n
      then True
      else let f = n `div` 2
      	       s = (*2) . mod n $ 2
	   in (p f) && (p s)
