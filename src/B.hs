{-# OPTIONS_GHC -ddump-rule-firings -ddump-simpl -dsuppress-all #-}
module B (test) where

import A
import Optics.Core

test :: [a] -> [(Int, a)]
test = itoListOf foo
