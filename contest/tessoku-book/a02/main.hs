import Data.Bool (bool)

main = do
    [_, x] <- map read . words <$> getLine :: IO [Int]
    xs <- map read . words <$> getLine :: IO [Int]
    putStr . yn $ x `elem` xs


yn :: Bool -> String
yn = bool "No" "Yes"