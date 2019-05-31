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


instance ProductReceiver Admin where
    searchProduct Admin p = execute Cmd2 p


