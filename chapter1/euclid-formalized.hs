import System.Environment

main = do
     args <- getArgs
     let first = (read $ head args) :: Int
     	 second = (read $ last args) :: Int
     putStrLn $ show $ algorithm (first, second, 0, 1)     


algorithm :: (Int, Int, Int, Int) -> Int
algorithm (m,n,r,1) = algorithm (m,n,m `mod` n,2)
algorithm (m,n,r,2)
  | (r == 0) = n
  | otherwise = algorithm (m,n,r,3)
algorithm (m,n,p,3) = algorithm (n,p,p,1)	  