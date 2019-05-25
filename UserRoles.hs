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
    viewProduct ::  a -> Product -> String

instance ProductReceiver User where
    viewProduct User p = execute Cmd1 p


instance ProductReceiver Admin where
    viewProduct Admin p = execute Cmd2 p


