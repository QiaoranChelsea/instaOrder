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

class Product' p => NewKind' p where 
    weight' :: p -> Int 

-- data NewKind = forall p. NewKind' p => NewKind p

-- pid         (NewKind p) = pid'  p
-- name        (NewKind p) = name' p
-- price       (NewKind p) = price'   p
-- description (NewKind p) = description' p
-- weight      (NewKind p) = weight' p


data NewKind1 = NewKind1

-- newKind1 = NewKind NewKind1 
instance Product' NewKind1 where 
  pid'         _ = 5 
  name'        _ = "NewKindName1"
  price'       _ = 100
  description' _ = "NewKindDescription1"    

instance NewKind' NewKind1 where
  weight'      _ = 10













