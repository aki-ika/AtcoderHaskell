import Data.Array.Unboxed (listArray, UArray, (!), bounds)

import qualified Data.ByteString.Char8 as BS
import Data.Char (isSpace)
import Data.List (unfoldr)
import Data.Bool (bool)


main :: IO ()
main = do
    n <- readLn :: IO Int
    as <- readIntListUsingBS
    let asU = listArray (1, n) as :: UArray Int Int
    printYN $ solve asU

 
solve :: UArray Int Int -> Bool
solve as = any (\(a, b, c) -> a + b + c == 1000) $ pick3 as

 
pick3 :: UArray Int Int -> [(Int, Int, Int)]
pick3 as = [(as ! i, as ! j, as ! k) | i <- [1..n], j <- [i+1..n], k <- [j+1..n]]
  where
    (_, n) = bounds as


readIntListUsingBS :: IO [Int]
readIntListUsingBS = unfoldr (BS.readInt . BS.dropWhile isSpace) <$> BS.getLine

printYN :: Bool -> IO ()
printYN = putStr . bool "No" "Yes"
