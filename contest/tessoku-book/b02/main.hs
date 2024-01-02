import Data.Bool (bool)

main :: IO ()
main = do
    [n, m] <- map read . words <$> getLine :: IO [Int]
    putStr $ yesno $ solve n m

solve :: Int -> Int -> Bool
solve n m = any (\x -> 100 `mod` x == 0) [n..m]

yesno :: Bool -> String
yesno = bool "No" "Yes"



