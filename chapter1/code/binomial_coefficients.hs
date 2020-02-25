tails :: [a] -> [[a]]
tails [] = return []
tails xs = xs:(tails $ tail xs)

combinations :: Eq a => [a] -> Int -> [[a]]
combinations _ 0 = [[]]
combinations objects places = do
  y:ys <- tails objects
  x <- combinations ys (places - 1)
  return $ y:x

combinations' :: Eq a => [a] -> Int -> [[a]]
combinations' _ 0 = [[]]
combinations' xs n = [y:ys | y:ys' <- tails xs
                           , ys <- combinations ys' (n - 1)]

