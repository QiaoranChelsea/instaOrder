module Order where 

import UserRoles
import Product
import ProductCmd





data Order = Order 

instance ProductReceiver Order where
    searchProduct Order p = execute Cmd3 p


