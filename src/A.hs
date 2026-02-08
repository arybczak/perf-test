{-# LANGUAGE DefaultSignatures #-}
{-# LANGUAGE FunctionalDependencies #-}
module A where

import Optics.Core

class Foo i s t a b | s -> i a, t -> i b, s b -> t, t a -> s where
  foo :: IxTraversal i s t a b

  default foo
    :: (TraversableWithIndex i g, s ~ g a, t ~ g b)
    => IxTraversal i s t a b
  foo = itraversed
  {-# INLINE[1] foo #-}

instance Foo Int [a] [b] a b where
--  foo = itraversed
--  {-# INLINE[1] foo #-}
