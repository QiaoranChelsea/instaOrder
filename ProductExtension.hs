{-# LANGUAGE ExistentialQuantification #-}

module ProductExtension where

import Product 
import ProductCmd

-- | Extension to add new product using type class and implementing command design pattern for product module
data NewItem1 = NewItem1
newItem1 = Product NewItem1 

instance Product' NewItem1 where
  productId'         _ = 4
  productName'        _ = "Alice in Wonderland"
  currentPrice'       _ = 500
  productDescription' _ = "Fairy Book for children"


-- |Extension to  add new kind (data type) in product module which implements type classes and command design pattern
-- | Add new kind 

class Product' p => NewKind' p where 
  weight' :: p -> Int 

data NewKind = forall p. (NewKind' p) => NewKind p
weight   (NewKind p) = weight' p

instance Product' NewKind where 
  productId'     _ = 0
  productName'    _ = ""
  currentPrice'    _ = 0
  productDescription' _ = ""

--Creating a new product (new Kind adding "weight")
data NewKind1 = NewKind1

instance Product' NewKind1 where 
  productId'     _ = 5
  productName'    _ = "Intp the Wild"
  currentPrice'    _ = 100
  productDescription' _ = "A book on Road-trip"  

-- Adding weight attribute to the newKind1
instance NewKind' NewKind1 where
  weight'   _ = 10


-- Extending old item1 from product Module
instance NewKind' Item1 where 
  weight' _ = 1100



--Boiler plate code to extend this new kind with command design pattern
class ProductCmd cmd => KindCmd cmd where
  getKind :: NewKind' nk => cmd -> nk -> String 

data NewCmd1 = NewCmd1 

instance ProductCmd NewCmd1 where 
  getProduct NewCmd1 p = ""

instance KindCmd NewCmd1 where 
  getKind NewCmd1 p = concat [productName' p, " | ", show (currentPrice' p), " | ", productDescription' p," | ", show (weight' p)]

class KindCmd cmd => NewInvoker cmd where 
  execute :: NewKind' nk => cmd -> nk -> String 

instance NewInvoker NewCmd1 where
  execute = getKind 
















