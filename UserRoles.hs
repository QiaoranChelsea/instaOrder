module UserRoles where 

import ProductCmd
import Product

--
-- * interface for Receriver
--

-- | interface 
data User = User 
data Admin = Admin

class ProductReceiver a  where 
    searchProduct ::  a -> Product -> String

instance ProductReceiver User where
    searchProduct User p = execute Cmd1 p

prettyFinalOrder :: Maybe ([(Product,Int,Int)],Int)  -> String 
prettyFinalOrder (Just (plist, final)) = unlines (map (\(p,q,c) -> getProduct Cmd1 p ++ ", Qty:"  ++ show q ++ ", Cost:" ++ show c) plist) ++ "Final cost:" ++ show final  
prettyFinalOrder _ = "Error: Order can't be placed."
