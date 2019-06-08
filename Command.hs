-- | The Invoker and command interface along with concrete command impelemntation 
module Command where 

import Product 
import qualified Data.Map as M
import Shipping
import Syntax 
--
-- * interface for Command
--

-- | interface 
class  Command cmd  where 
    getProduct :: cmd -> Product -> String 
    placeOrder' :: Shipping' m => cmd -> m -> [(Product,Int)] -> Maybe ([(Product,Int,Int)],Int)   


--
--  ** concrete command as instances 
-- 

data Cmd1 = Cmd1 
-- | concrete command1 : give products' (name + price + description) 
instance Command Cmd1 where 
    getProduct Cmd1 p = concat [ productName p, " | ", show (currentPrice p), " | ", productDescription p]


data Cmd2 = Cmd2
-- | concrete command2 : give products' ( id + name + price + description) 
instance Command Cmd2  where 
    getProduct Cmd2 p = concat [show (productId p), " | " , productName p, " | ", show (currentPrice p), " | ", productDescription p]

data Cmd3 = Cmd3
-- | concrete command2 : give products' ( id + name + price)  
instance Command Cmd3  where 
    getProduct Cmd3 p = concat [show (productId p), " | " , productName p, " | ", show (currentPrice p)]

-- data PlaceOrderCmd = PlaceOrderCmd
-- instance Command PlaceOrderCmd where
    

--
--  **  Invoker Class
-- 

-- |interface 

class Command cmd => Invoker cmd where 
    execute      :: cmd -> Product -> String 
    executeOrder ::  Shipping' m => cmd -> m -> [(Product,Int)]-> String 

instance Invoker Cmd1 where 
    execute = getProduct 

instance  Invoker Cmd2 where
    execute = getProduct  

instance  Invoker Cmd3 where
    execute = getProduct 







