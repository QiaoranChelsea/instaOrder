module Order where 

import UserRoles
import Product
import ProductCmd

data Order = Order 

instance ProductReceiver Order where
    searchProduct Order p = execute Cmd3 p



data PlaceOrderCmd = PlaceOrderCmd

-- concrete command implementation of placing user order
instance ProductCmd PlaceOrderCmd where
    placeOrder PlaceOrderCmd ps = let plist = getSingleCost ps
                                      get3rd = \(_,_,c) -> c  
                                      final = getFinalCost $ map get3rd plist 
                                  in Just (plist,final)  

getSingleCost :: [(Product,Int)] -> [(Product,Int, Int)]
getSingleCost ps = map (\(p,i) -> (p,i,(currentPrice p) * i)) ps 

getFinalCost :: [Int] -> Int 
getFinalCost ps = Prelude.foldl (+) 0 ps

orderListEx :: [(Product, Int)]
orderListEx = [(Product Item1, 1), (Product Item2, 5)]
