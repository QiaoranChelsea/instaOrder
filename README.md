# instaOrder: A Online-or


## Description
The domain of the project is an online order management system, implemented in Haskell.
Within the core system, the user could search the product detail in Product Module, check the products’ availability based on the information of inventory, and also could place the order from third party vendor if products are out of stock. An inventory is a warehouse module containing availability of each product and location of the vendor.

## Step to run
`git clone https://github.com/QiaoranChelsea/instaOrder.git`
`cd instaOrder`
`ghci Main.hs` 

## Examples
1. search product Item1 with UserRoles as User 
```
> searchProduct User item1
"Design Patterns | 100 | Its a introductory book for learning design paradigms in OO and FP"
```

2. search product Item1 with UserRoles as Admin
```
> searchProduct Admin item1 
"1 | Design Patterns | 100 | Its a introductory book for learning design paradigms in OO and FP"
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

5. search new kind 
```
> searchNewProductKind User NewKind1
"Into the Wild | 100 | A book on Road-trip | 10"
```


