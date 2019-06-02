{-# LANGUAGE ExistentialQuantification #-}
-- | Showing how we extend product with new product and new kind
module ProductExtension where

import Product 
import ProductCmd

-- 
-- * Extension to add new product using type class and implementing command design pattern for product module
-- 
data NewItem1 = NewItem1
newItem1 = Product NewItem1 

instance Product' NewItem1 where
  productId'         _ = 4
  productName'        _ = "Alice in Wonderland"
  currentPrice'       _ = 500
  productDescription' _ = "Fairy Book for children"


-- 
-- * Extension to  add new kind (data type) in product module which implements type classes and command design pattern
--   Add new kind 

class Product' p => NewKind' p where 
  weight' :: p -> Int 

-- | Creating a new product (new Kind adding "weight")
data NewKind1 = NewKind1

-- | Product' instance for NewKind1
instance Product' NewKind1 where 
  productId'     _ = 5
  productName'    _ = "Into the Wild"
  currentPrice'    _ = 100
  productDescription' _ = "A book on Road-trip"  

-- | Extending weight attribute to the newKind1
instance NewKind' NewKind1 where
  weight'   _ = 10


-- | Extending old item1 with new attribute "weight" from product Module
instance NewKind' Item1 where 
  weight' _ = 1100


-- * Boiler plate code to extend this new kind with command design pattern

-- | extension for ProductCmd
class ProductCmd cmd => KindCmd cmd where
  getKind :: NewKind' nk => cmd -> nk -> String 

data NewCmd1 = NewCmd1 

-- | since we are use ProductCmnd as super class for KindCmd, it's required
instance ProductCmd NewCmd1 where 
  getProduct NewCmd1 p = ""

instance KindCmd NewCmd1 where 
  getKind NewCmd1 p = concat [productName' p, " | ", show (currentPrice' p), " | ", productDescription' p," | ", show (weight' p)]

-- | exntension for Invoker 
class KindCmd cmd => NewInvoker cmd where 
  execute :: NewKind' nk => cmd -> nk -> String 

instance NewInvoker NewCmd1 where
  execute = getKind 
















