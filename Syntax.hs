module Syntax where 


import Product
type Vendor = [(Pid,Price)]
type Qty = Int 
type Pid = Int 
type Price = Int 
type Inventory = [(Pid, (Qty, Price))]

-- type ShippingCost = Int 
-- type CurPrice = Int 
-- type NewPrice = Int 
-- type TotalCost
data Invoice = Invoice { productList :: [(Product,Int,Int)], 
                         shippingCost :: Int, 
                         newPrice :: Int, 
                         reason :: String, 
                         totalCost :: Int 
                       }