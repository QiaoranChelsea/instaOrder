-- | Inventory Module
module ProductInventory where 

import Text.CSV

-- | TODO: Unwrap the IO monad get the actual value 

-- | get invenroty info in inventory.csv
getInventoryInfo :: IO () 
getInventoryInfo = do
  inventory_csv <- parseCSVFromFile "resource/inventory.csv"
  case inventory_csv of
    Right csv -> print csv
    Left err -> print err


-- | extract the information in specific column. Count start with 0
extractColumn :: Read t => CSV -> Int -> [t]
extractColumn csv n =
  [ read (record !! n) | record <- csv
                       , length record > n
                       , record /= [""] ]

