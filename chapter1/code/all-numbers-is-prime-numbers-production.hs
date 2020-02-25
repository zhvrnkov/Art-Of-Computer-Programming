p :: Int -> Bool
p 0 = True
p 1 = True
p 2 = True
p n = let f = n `div` 2
          s = (*2) . mod n $ 2
      in (p f) && (p s)
