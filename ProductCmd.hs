module ProductCmd where 

import Product 
import qualified Data.Map as M
--
-- * interface for Command
--

-- | interface 
class  ProductCmd cmd  where 
    getProduct :: cmd -> Product -> String 

--
--  ** concrete command  
-- 

data Cmd1 = Cmd1 

-- | concrete command1  
instance ProductCmd Cmd1 where 
    getProduct Cmd1 p = concat [ name p, " | ", show (price p), " | ", description p]


data Cmd2 = Cmd2
-- | concrete command2 
instance ProductCmd Cmd2  where 
    getProduct Cmd2 p = concat [show (pid p), " | " , name p, " | ", show (price p), " | ", description p]

data Cmd3 = Cmd3
-- | concrete command2 
instance ProductCmd Cmd3  where 
    getProduct Cmd3 p = concat [show (pid p), " | " , name p, " | ", show (price p)]



--
--  **  Invoker Class
-- 

-- | try function 
-- register :: ProductCmd cmd =>  M.Map String cmd
-- register = M.fromList [("u1", Cmd1),("u2", Cmd2)]

-- execute ::  String -> String -> Product ->  String  
-- execute role cmdName p = case M.lookup role register of 
--                                 Just cmd -> getProduct cmd p 
--                                 Nothing -> ""

-- |interface 

class ProductCmd cmd => Invoker cmd where 
    execute :: cmd -> Product -> String 

instance Invoker Cmd1 where 
    execute = getProduct 

instance  Invoker Cmd2 where
    execute = getProduct  

instance  Invoker Cmd3 where
    execute = getProduct  





