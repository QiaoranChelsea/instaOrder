module Main where 


import ProductCmd 
import UserRoles 
import Product 
import Order 
-- | extension module
import ProductExtension
import UserRolesExtend


-- TODO : 1. check whether the Item is already in the Product Module

main :: IO ()
main = undefined 
-- | view Product from User 
userEx = searchProduct User item1

adminEx = searchProduct Admin item1

orderEx = searchProduct Order  item2