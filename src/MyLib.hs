{-# OPTIONS_GHC -ddump-rule-firings -ddump-simpl -dsuppress-all #-}
module Main where

import Optics.Core
import Test.Tasty.Bench

test
  :: (Int -> a -> a)
  -> ((Int, a), [a], (Int, Maybe a))
  -> ((Int, a), [a], (Int, Maybe a))
test = iover (_1 % itraversed `iadjoin` _2 % itraversed `iadjoin` _3 % itraversed % _Just)

xxx :: ((Int, Int), [Int], (Int, Maybe Int))
xxx = ((1,2), [1..1000], (3, Just 4))

main :: IO ()
main = defaultMain
  [ bench "test" $ nf (test (+)) xxx
  ]
