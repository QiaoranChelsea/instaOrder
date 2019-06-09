module UserRolesExtend where
import Product
import qualified ProductExtension as NP
import qualified Command as PC
import UserRoles
import Shipping

-- | extend new use role: Admin
data Admin = Admin
instance Receiver Admin where
    searchProduct Admin p = PC.execute PC.Cmd2 p   


-- | Extension for Product Receiver which could search new kind of product 
class NewReceiver a  where 
  searchNKProduct ::  a -> NP.NewKind -> String
  placeNKOrder ::  (Shipping' m)=>  a -> m -> [(NP.NewKind,Int)] -> String

instance NewReceiver User where
    searchNKProduct User p = NP.execute NP.NewCmd1 p
    placeNKOrder User m ps = NP.executeNKOrder NP.PlaceNKOrderCmd m ps

instance NewReceiver Admin where
    searchNKProduct Admin p = NP.execute NP.NewCmd1 p

