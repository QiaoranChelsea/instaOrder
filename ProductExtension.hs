{-# LANGUAGE ExistentialQuantification #-}

module ProductExtension where

import Product 

-- | add new product 
data NewItem1 = NewItem1
newItem1 = Product NewItem1 

instance Product' NewItem1 where
  pid'         _ = 4
  name'        _ = "newProductName1"
  price'       _ = 10000
  description' _ = "newDescription1"



-- | add new kind 











