-- | Inventory Module
module Inventory where 

import Product 
import Text.CSV
import Vendor
import Syntax

-- | TODO: use let to wrap value with IO monad 

-- | get invenroty info in inventory.csv
-- getInventoryInfo :: IO String
-- getInventoryInfo = do
--   inventory_csv <- parseCSVFromFile "resource/inventory.csv"
--   case inventory_csv of
--     Left err -> error "Error during the Getinventory"
--     Right csv -> do let res = printCSV csv  
--                  return res
inventory :: Inventory
inventory = [(1,(20,100)), (2,(15,200)), (3,(27,300)), (4,(6,400))]


-- | 
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


purchaseFromVendor :: Vendor -> Pid -> Price 
purchaseFromVendor v pid = case lookup pid v of 
                             Nothing -> error ("Product " ++show pid ++ "'s Qty is not avaible in the vendor")
                             Just p -> p




-- -- | extract the information in specific column. Count start with 0
-- extractColumn :: Read t => CSV -> Int -> [t]
-- extractColumn csv n =
--   [ read (record !! n) | record <- csv
--                        , length record > n
--                        , record /= [""] ]

