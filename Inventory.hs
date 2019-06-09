-- | Inventory Module
module Inventory where 

import Product 
import Vendor
import Syntax

-- | inventory infomation
inventory :: Inventory
inventory = [(1,(20,100)), (2,(15,200)), (3,(27,300)), (4,(6,400)), (5,(10,500))]


-- | check if the qty of input product is available in the inventory
checkFromInventory :: [(Pid, Qty)] -> [(Pid, Price)]
checkFromInventory ps = map (checkAvailability inventory) ps 
                              

-- | first [(Product, Qty)] : User request 
--   second [(Product, Qty)] : what we have in inventory  
checkAvailability ::  Inventory -> (Pid, Qty) -> (Pid,Price) 
checkAvailability inv (p,q)  = case lookup p inv of 
                                        Nothing -> error "Do not find item in inventory " 
                                        Just (iqty,price)  -> if q > iqty 
                                                            then let newPrice = purchaseFromVendor vendor p 
                                                                 in (p,newPrice) 
                                                            else (p,price)  

-- | purchase form vendor and get a new price 
purchaseFromVendor :: Vendor -> Pid -> Price 
purchaseFromVendor v pid = case lookup pid v of 
                             Nothing -> error ("Product " ++show pid ++ "'s Qty is not avaible in the vendor")
                             Just p -> p



