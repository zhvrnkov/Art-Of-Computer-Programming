import Data.List

iRange = [1..10]
jRange = [1..10]

a :: [((Int, Int), Int)]
a =
  iRange >>= (\first  ->
  jRange >>= (\second ->
  let key = (first, second)
      value = (maximum iRange * (first - 1) + second)
  in return (key, value)))

findKey :: Eq a => a -> [(a, v)] -> v
findKey key dict =
  snd . head . filter (\(key', value) -> key == key') $ dict

sumOfKeys :: (Eq a, Num v) => [a] -> [(a, v)] -> v
sumOfKeys keys dict =
  let values = map (\key -> findKey key dict) keys
  in sum values

r :: Int -> Bool
r = even

s :: Int -> Bool
s = odd

keysIJ :: [(Int, Int)]
keysIJ =
  let iKeys = filter r iRange
  in  iKeys >>= (\i ->
  let jKeys = filter s jRange
  in  jKeys >>= (\j ->
  return (i,j)))

keysJI :: [(Int, Int)]
keysJI =
  let jKeys = filter s jRange
  in jKeys >>= (\j ->
  let iKeys = filter r iRange
  in iKeys >>= (\i ->
  return (i,j)))

diff = keysIJ \\ keysJI

sumOfKeysIJ = sumOfKeys keysIJ a
sumOfKeysJI = sumOfKeys keysJI a

s' :: Int -> Int -> Bool
s' i j = (i > 3) && (i < 7) && odd j

keysIJ' =
  let iKeys = filter r iRange
  in iKeys >>= (\i ->
  let jKeys = filter (s' i) jRange
  in jKeys >>= (\j ->
  return (i,j)))

s'' :: Int -> Bool
s'' j =
  let r_i_IsTrueForSomeI = foldl (\acc i -> acc || r i) False iRange
      s_i_j_IsTrueForSomeI = foldl (\acc i -> acc || s' i j) False iRange
  in r_i_IsTrueForSomeI && s_i_j_IsTrueForSomeI

r' :: Int -> Int -> Bool
r' j i =
  let r_i_IsTrueForThatI = r i
      s_i_j_IsTrueForThatIAndJ = s' i j
  in r_i_IsTrueForThatI && s_i_j_IsTrueForThatIAndJ
  
keysIJ'' =
  let jKeys = filter s'' jRange
  in jKeys >>= (\j ->
  let iKeys = filter (r' j) jRange
  in iKeys >>= (\i ->
  return (i,j)))

diff' = keysIJ' \\ keysIJ''
