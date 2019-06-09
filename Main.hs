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


-- TODO : 1. check whether the Item is already in the Product Module

main :: IO ()
main = undefined 
-- | view Product from User 
userEx = searchProduct User item1

adminEx = searchProduct Admin item1


--
-- ** Examples 
--

-- | 1. search product Item1 with UserRoles as User 
ex1 = searchProduct User item1

-- | 2. search product Item1 with UserRoles as Admin
ex2 = searchProduct Admin item1 

-- | 3. Place order with UserRoles as User and choose Standard shipping method
--ex3 =  putStrLn $ prettyFinalOrder $ placeOrder PlaceOrderCmd Standard [(Product Item1, 1), (Product Item2, 5)]

-- | 4. Search old prodcut with extended attribute 
ex4 =  searchNKProduct User (NewKind Item1)

-- | 5. search new kind 
ex5 = searchNKProduct User (NewKind NewKind1)

-- | 6. Place order with UserRoles as User and choose Standard shipping method (product qty available)
ex3 =  putStrLn $ placeOrder User Standard [(Product Item1, 1), (Product Item2, 10)]

-- |  7. Place order with UserRoles as User and choose Admin shipping method
ex6 =  putStrLn $ placeOrder User Standard [(Product Item1, 50), (Product Item2, 1)]

ex7 = putStrLn $ placeNKOrder User Standard [(NewKind NewKind1, 1)]

ex8 = putStrLn $ placeNKOrder User Standard newkindListEx

-- newkindListEx :: NewKind' nk  => [(nk,Qty)]
-- newkindListEx = [(Item1, 10), (NewKind1, 1)]

newkindListEx :: [(NewKind,Qty)]
newkindListEx = [(NewKind Item1, 10), (NewKind NewKind1, 1)] 


-- ex6 =  putStrLn $ placeOrder User Standard [(NewKind1, 5)]





plist = [Product Item1, Product Item2, Product Item3]

productDetail :: Product -> String 
productDetail = \p -> concat [show (productId p), " | " , productName p, " | ", show (currentPrice p), " | ", productDescription p]

showProductList :: [Product] -> [String]
showProductList= map productDetail