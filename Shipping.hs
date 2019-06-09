{-# LANGUAGE ExistentialQuantification #-}
module Shipping where 
import Product


class Shipping' m where
  calculateShippingCost :: m -> Int -> Int

-- | Shipping instance wrapper
data Shipping = forall s. Shipping' s => Shipping s


--
-- * Instances of different shipping method 
--
data Standard = Standard
instance Shipping' Standard where
  calculateShippingCost Standard w = 10 * w

data Economy = Economy
instance Shipping' Economy where
  calculateShippingCost Economy w = 15 * w
  

data Prime = Prime
instance Shipping' Prime where
  calculateShippingCost Prime w = 18 * w
