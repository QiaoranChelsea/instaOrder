{-# LANGUAGE ExistentialQuantification,
     FlexibleInstances #-}
-- | Showing how we extend product with new product and new kind
module ProductExtension where

import Product 
import Command
import Shipping
import Order
import Syntax
import Inventory

-- 
-- * Extension to add new product using type class and implementing command design pattern for product module
-- 
data NewItem1 = NewItem1
newItem1 = Product NewItem1 

instance Product' NewItem1 where
  productId'         _ = 4
  productName'        _ = "Alice in Wonderland"
  currentPrice'       _ = 400
  productDescription' _ = "Fairy Book for children"


-- 
-- * Extension to add new kind (data type) in product module which implements type classes and command design pattern
--   Add new kind 

class (Product' p, Eq p) => NewKind' p where 
  weight' :: p -> Int 

-- | Product instance wrapper.
data NewKind = forall p. NewKind' p => NewKind p

weight (NewKind p) = weight' p

instance Product' NewKind where
  productId' (NewKind p) = productId' p 
  productName' (NewKind p) =productName' p
  currentPrice' (NewKind p) = currentPrice' p
  productDescription' (NewKind p) = productDescription' p 

-- | Operations on wrapped instances.
newKindId          (NewKind p) = productId'  p
newKindName        (NewKind p) = productName' p
newKindPrice       (NewKind p) = currentPrice'   p
newKindDescription (NewKind p) = productDescription' p

instance Eq NewKind where
  p1 == p2 = newKindId p1 ==  newKindId p2


--
-- Example for Adding new kind 
--

-- | Creating a new product (new Kind adding "weight")
data NewKind1 = NewKind1

-- | Product' instance for NewKind1
instance Product' NewKind1 where 
  productId'     _ = 5
  productName'    _ = "Into the Wild"
  currentPrice'    _ = 500
  productDescription' _ = "A book on Road-trip"  

-- | Extending weight attribute to the newKind1
instance NewKind' NewKind1 where
  weight'   _ = 10

instance Eq NewKind1 where 
  nk1 == nk2 = productId' nk1 == productId' nk2


-- | Extending old item1 with new attribute "weight" from product Module
instance NewKind' Item1 where 
  weight' _ = 1100

instance Eq Item1 where 
  nk1 == nk2 = productId' nk1 == productId' nk2




-- 
--  * Extending command class to support new kind 
-- 

class Command cmd => KindCmd cmd where
  getKind ::  cmd ->  NewKind -> String 
  placeNKOrder' :: (Shipping' m) => cmd -> m -> [(NewKind,Int)] -> Maybe ([(NewKind,Int,Int)],Int,Int)   

-- | NewCmd1 to get new kind product information
data NewCmd1 = NewCmd1 

-- since we are use ProductCmnd as super class for KindCmd, it's required
instance Command NewCmd1 where 
  getProduct NewCmd1 p = ""

instance KindCmd NewCmd1 where 
  getKind NewCmd1 p = concat [productName' p, " | ", "$" ++ show (currentPrice' p)," | " , show (weight p) ++ "g", " | ", productDescription' p]


-- | Cmd to place order on new kind of product
data PlaceNKOrderCmd = PlaceNKOrderCmd
instance Command PlaceNKOrderCmd where 
  placeOrder' PlaceNKOrderCmd m ps =  placeOrder' PlaceOrderCmd m ps

instance KindCmd PlaceNKOrderCmd where
  placeNKOrder' PlaceNKOrderCmd m ps = let plist = getSingleNKCost ps
                                           get3rd = \(_,_,c) -> c 
                                           final = getFinalCost $ map get3rd plist 
                                           shippingcost = getFinalCost $ map (getShippingCost m) $ map snd ps
                                       in Just (plist,shippingcost,final + shippingcost)

-- | Helper function to impelment placeNKOrder                                      
getCurNKPriceList ::  [(NewKind, Qty)] ->  [(NewKind, Price)]
getCurNKPriceList ps = let pidQtyList = map (\(p,qty) -> (newKindId p, qty)) ps
                           pidPriceList = checkFromInventory pidQtyList
                           productList = map fst ps 
                           priceList = map snd pidPriceList
                       in zip productList priceList

getSingleNKCost ::[( NewKind,Qty)] -> [(NewKind, Qty , Price)]
getSingleNKCost ps =  map (\(pro,i) -> (pro,i, (getCurPrice pro) * i)) ps 
    where   productPriceList = getCurNKPriceList ps 
            getCurPrice p = case lookup p productPriceList of 
                                Nothing -> error "Didn't find the price in invenrory"
                                Just curPrice -> curPrice

prettyFinalNKOrder :: Maybe ([(NewKind,Qty,Price)],Int,Int)  -> String 
prettyFinalNKOrder (Just (plist, shipping, final)) = unlines (map prettyNKInvoice plist) ++ "Shipping Cost:$" ++ show shipping ++ "\n" ++ "Final cost:$" ++ show final  
prettyFinalNKOrder _ = "Error: Order can't be placed."

prettyNKInvoice ::  (NewKind,Qty,Price) -> String 
prettyNKInvoice (p, qty, price) = let curP = currentPrice' p in
                                  case curP == price `div` qty of 
                                      True ->  getKind NewCmd1 p ++ " | Qty:"  ++ show qty ++ " | cost:$" ++ show price
                                      False ->  getKind NewCmd1 p ++ " | Qty:"  ++ show qty ++ " | cost:$" ++ show price ++ "\n" ++ "Comments:" ++ "(Price changed to $" ++ show (price `div` qty )++ " due to product is not available in inventory and purchase from external vendor)"



--
-- * Extending Invoker class to supoort new kind of product
-- 
class KindCmd cmd => NewInvoker cmd where 
  execute ::  cmd -> NewKind -> String 
  executeNKOrder ::  (Shipping' m) => cmd -> m -> [(NewKind,Int)]-> String 
 

instance NewInvoker NewCmd1 where
  execute = getKind 

instance NewInvoker PlaceNKOrderCmd where
    executeNKOrder PlaceNKOrderCmd m ps = prettyFinalNKOrder $ placeNKOrder' PlaceNKOrderCmd m ps




