module Syntax where 

type Vendor = [(Pid,Price)]
type Qty = Int 
type Pid = Int 
type Price = Int 
type Inventory = [(Pid, (Qty, Price))]
