{-# LANGUAGE ExistentialQuantification #-}

-- | Product : A type class-based implementation of object-oriented Object
module Product where 

--
-- * Interface for Product 
--

-- | Interface.
class Product' p where
  productId' :: p -> Int 
  productName' :: p -> String 
  currentPrice' :: p -> Int 
  productDescription' :: p -> String
  

-- | Product instance wrapper.
data Product = forall p. Product' p => Product p

-- | Operations on wrapped instances.
productId          (Product p) = productId'  p
productName        (Product p) = productName' p
currentPrice       (Product p) = currentPrice'   p
productDescription (Product p) = productDescription' p

instance Eq Product where 
  p1 == p2 = (productId p1) == (productId p2)

instance Show Product where 
  show p = concat [show (productId p)," | " , productName p, " | " ,show (currentPrice p)]
--
-- * instances 
--

-- * Item 1 

data Item1 = Item1
item1 = Product Item1 

instance Product' Item1 where
  productId'          _ = 1 
  productName'        _ = "Design Patterns"
  currentPrice'       _ = 100
  productDescription' _ = "Its a introductory book for learning design paradigms in OO and FP"
  

-- * Item 2

data Item2 = Item2
item2 = Product Item2

instance Product' Item2 where
  productId'         _ = 2 
  productName'        _ = "Harry Potter"
  currentPrice'       _ = 200
  productDescription' _ =  "Its a fantasy book"
  

-- * Item 3 
data Item3 = Item3
item3 = Product Item3

instance Product' Item3 where
  productId'         _ = 3 
  productName'        _ = "Thin Air"
  currentPrice'       _ = 300
  productDescription' _ = "Its a thriller story by Jessica Shaw"
  






