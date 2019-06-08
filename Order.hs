module Order where 

import UserRoles
import Product
import Command
import Shipping

data Order = Order 
instance ProductReceiver Order where
    searchProduct Order p = execute Cmd3 p


data PlaceOrderCmd = PlaceOrderCmd

-- | concrete command implementation of placing user order
instance Command PlaceOrderCmd where
    placeOrder PlaceOrderCmd m ps = let plist = getSingleCost ps
                                        get3rd = \(_,_,c) -> c 
                                        final = getFinalCost $ map get3rd plist 
                                        shippingcost = getFinalCost $ map (getShippingCost m) $ map snd ps
                                    in Just (plist,final + shippingcost)  

getSingleCost :: [(Product,Int)] -> [(Product,Int, Int)]
getSingleCost ps = map (\(p,i) -> (p,i,(currentPrice p) * i)) ps 


getShippingCost :: Shipping' m => m -> Int -> Int
getShippingCost m w = calculateShippingCost m w 

getFinalCost :: [Int] -> Int 
getFinalCost ps = Prelude.foldl (+) 0 ps

orderListEx :: [(Product, Int)]
orderListEx = [(Product Item1, 1), (Product Item2, 5)]
