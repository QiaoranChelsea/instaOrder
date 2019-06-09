module Main where 


import Command 
import UserRoles 
import Product 
import Order 
-- | extension module
import ProductExtension
import UserRolesExtend
import Shipping

import Inventory
import Syntax

main :: IO ()
main = undefined 

--
-- ** Examples 
--

-- | 1. search product Item1 with UserRoles as User 
ex1 = searchProduct User item1


-- | 2. search product Item1 with UserRoles as Admin (As you can see the productId 1 in the result which is hide from the User)
ex2 = searchProduct Admin item1 


-- | 3. search new kind of product where the weight (10g) is a new attribute compared to old product.
ex3 = searchNKProduct User (NewKind NewKind1)


-- | 4. search old product item1 with extended attribute
ex4 = searchNKProduct User (NewKind Item1)



--
-- * Operation for placing order
-- 
-- | 1. Place order with UserRoles as User and choose Standard shipping method. 
ex5 = putStrLn $ placeOrder User Standard [(Product Item1, 1), (Product Item2, 10)]


-- | 2. Place order with UserRoles as User and choose Standard shipping method. 
ex6 = putStrLn $ placeOrder User Standard [(Product Item1, 25), (Product Item2, 10)]

-- | 3. Place order for Newkind Product with UserRoles as User and choose Standard shipping method.
ex7 = putStrLn $ placeNKOrder User Standard  [(NewKind Item1, 10), (NewKind NewKind1, 1)]







