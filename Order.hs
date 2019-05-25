module Order where 

import UserRoles
import Product
import ProductCmd





data Order = Order 

instance ProductReceiver Order where
    viewProduct Order p = execute Cmd3 p


