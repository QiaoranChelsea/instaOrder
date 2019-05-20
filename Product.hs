{-# LANGUAGE ExistentialQuantification #-}

-- | Product : A type class-based implementation of object-oriented Object
module Product where

--
-- * Interface for ProductRack
--

-- | Interface.
class Product' p where
  pid' :: p -> Int 
  name' :: p -> String 
  price' :: p -> Int 
  description' :: p -> String 

-- | Product instance wrapper.
data Product = forall p. Product' p => Product p

-- | Operations on wrapped instances.
pid         (Product p) = pid'  p
name        (Product p) = name' p
price       (Product p) = price'   p
description (Product p) = description' p


--
-- * instances 
--

-- * Item 1 

data Item1 = Item1
item1 = Product Item1 

instance Product' Item1 where
  pid'         _ = 1 
  name'        _ = "name1"
  price'       _ = 100
  description' _ = "description1"

-- * Item 2

data Item2 = Item2
item2 = Product Item2

instance Product' Item2 where
  pid'         _ = 2 
  name'        _ = "name2"
  price'       _ = 200
  description' _ = "description2"

-- * Item 3 
data Item3 = Item3
item3 = Product Item3

instance Product' Item3 where
  pid'         _ = 3 
  name'        _ = "name3"
  price'       _ = 300
  description' _ = "description3"

--
-- ** Examples 
--
plist = [Product Item1, Product Item2, Product Item3]

productDetail :: Product -> String 
productDetail = \p -> concat [show (pid p), " | " , name p, " | ", show (price p), " | ", description p]

showProductList :: [Product] -> [String]
showProductList= map productDetail




