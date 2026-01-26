{-# OPTIONS_GHC -ddump-rule-firings -ddump-simpl -dsuppress-all #-}
module MyLib (test) where

import Optics.Core

test
  :: (Int -> a -> a)
  -> ((Int, a), [a], (Int, Maybe a))
  -> ((Int, a), [a], (Int, Maybe a))
test = iover (_1 % itraversed `iadjoin` _2 % itraversed `iadjoin` _3 % itraversed % _Just)
