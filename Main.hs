module Main where 


import ProductCmd 
import UserRoles 
import Product 
import Order 


main :: IO ()
main = undefined 
-- | view Product from User 
userEx = viewProduct User item1

adminEx = viewProduct Admin item1

orderEx = viewProduct Order  item2