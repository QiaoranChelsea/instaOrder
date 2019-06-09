module UserRoles where 

import Command
import Product
import Shipping
import Order

--
-- * interface for Receriver
--

-- | interface 
data User = User 


class Receiver a  where 
    searchProduct ::  a -> Product -> String
    placeOrder :: Shipping' m => a -> m -> [(Product,Int)] -> String

instance Receiver User where
    searchProduct User p = execute Cmd1 p
    placeOrder User m  ps = executeOrder PlaceOrderCmd m ps



