pow :: (Num b, Fractional b, Integral n) => b -> n -> b
pow b n
  | n > 0 = b * pow b (n - 1)
  | n < 0 = (1 / b) * pow b (n + 1)
  | n == 0 = 1

