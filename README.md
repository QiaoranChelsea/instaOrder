# instaOrder: An online order management system 


## Description
The domain of the project is an online order management system, implemented in Haskell.

Within the core system, the user could search the product detail in Product Module, check the products’ availability based on the information of inventory, and also could place the order from third party vendor if products quantities are out of stock. An inventory is a warehouse module containing availability(quantity) of each product.

The system could be used and extended by clients in several ways:
* Add new instance of product based on Product Modules
* Add new kinds of product as a new class by extending Product Module.
* Order product based on different (type and kinds of) products and different Shipping Methods (Standard, Economy and Prime).
* Extend with new operation through command interface for end user in UserRoles Module (Customer Client).
* Extend new userRole "Admin" in UserRoleExtend module

## Steps to run
* `git clone https://github.com/QiaoranChelsea/instaOrder.git`

* `cd instaOrder`

* `ghci Main.hs` 

## Examples

### operation for searching product 
1. search product Item1 with UserRoles as User 
```
> searchProduct User item1
"Design Patterns | $100 | Its a introductory book for learning design paradigms in OO and FP"
```

2. search product Item1 with UserRoles as Admin (As you can see the productId 1 in the result which is hide from the User)
```
> searchProduct Admin item1 
"1 | Design Patterns | $100 | Its a introductory book for learning design paradigms in OO and FP"
```

3. search new kind of product where the weight (10g) is a new attribute compared to old product.
```
> searchNKProduct User (NewKind NewKind1)
"Into the Wild | $500 | 10g | A book on Road-trip"
```

4. Search old product item1 with extended attribute
```
> searchNKProduct User (NewKind Item1)
"Design Patterns | $100 | 1100g | Its a introductory book for learning design paradigms in OO and FP"```
```

### Operation for placing order
1. Place order with UserRoles as User and choose Standard shipping method. 
NOTE: product qty is available in this case 
```
> putStrLn $ placeOrder User Standard [(Product Item1, 1), (Product Item2, 10)]
Design Patterns | $100 | Its a introductory book for learning design paradigms in OO and FP, Qty:1, cost:$100
Harry Potter | $200 | Its a fantasy book, Qty:10, cost:$2000
Shipping Cost:$110
Final cost:$2210
```





3. Place order with UserRoles as User and choose Standard shipping method
```
> putStrLn $ prettyFinalOrder $ placeOrder PlaceOrderCmd Standard [(Product Item1, 1), (Product Item2, 5)]
Design Patterns | 100 | Its a introductory book for learning design paradigms in OO and FP, Qty:1, Cost:100
Harry Potter | 200 | Its a fantasy book, Qty:5, Cost:1000
Final cost:1160
```

4. Search old prodcut with extended attribute
```
> searchNewProductKind User Item1
"Design Patterns | 100 | Its a introductory book for learning design paradigms in OO and FP | 1100"
```




