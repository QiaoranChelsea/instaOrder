module Order where 


import Product
import Command
import Shipping

-- data Order = Order 
-- instance Receiver Order where
--     searchProduct Order p = execute Cmd3 p


data PlaceOrderCmd = PlaceOrderCmd

-- | concrete command implementation of placing user order
instance Command PlaceOrderCmd where
    placeOrder' PlaceOrderCmd m ps = let plist = getSingleCost ps
                                         get3rd = \(_,_,c) -> c 
                                         final = getFinalCost $ map get3rd plist 
                                         shippingcost = getFinalCost $ map (getShippingCost m) $ map snd ps
                                     in Just (plist,final + shippingcost)  


--invoker instance for placeOrder
instance Invoker PlaceOrderCmd where
    executeOrder PlaceOrderCmd m ps = prettyFinalOrder $ placeOrder' PlaceOrderCmd m ps



getSingleCost :: [(Product,Int)] -> [(Product,Int, Int)]
getSingleCost ps = map (\(p,i) -> (p,i,(currentPrice p) * i)) ps 


getShippingCost :: Shipping' m => m -> Int -> Int
getShippingCost m w = calculateShippingCost m w 

getFinalCost :: [Int] -> Int 
getFinalCost ps = Prelude.foldl (+) 0 ps

orderListEx :: [(Product, Int)]
orderListEx = [(Product Item1, 1), (Product Item2, 5)]

--Instance PlaceOrderReceiver 
prettyFinalOrder :: Maybe ([(Product,Int,Int)],Int)  -> String 
prettyFinalOrder (Just (plist, final)) = unlines (map (\(p,q,c) -> getProduct Cmd1 p ++ ", Qty:"  ++ show q ++ ", Cost:" ++ show c) plist) ++ "Final cost:" ++ show final  
prettyFinalOrder _ = "Error: Order can't be placed."
