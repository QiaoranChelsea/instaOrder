module Main where 


import ProductCmd 
import UserRoles 
import Product 
import Order 
-- | extension module
import ProductExtension

-- TODO : 1. check whether the Item is already in the Product Module

main :: IO ()
main = undefined 
-- | view Product from User 
userEx = viewProduct User item1

adminEx = viewProduct Admin item1

orderEx = viewProduct Order  item2