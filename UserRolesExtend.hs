module UserRolesExtend where
import Product
import qualified ProductExtension as NP
import qualified ProductCmd as PC
import UserRoles

-- | extend new use role: Admin
instance ProductReceiver Admin where
    searchProduct Admin p = PC.execute PC.Cmd2 p

-- | Extension for Product Receiver which could search new kind of product 
class NewKindProductReceiver a  where 
  searchNewProductKind :: NP.NewKind' nk => a -> nk -> String


instance NewKindProductReceiver User where
    searchNewProductKind User p = NP.execute NP.NewCmd1 p

instance NewKindProductReceiver Admin where
    searchNewProductKind Admin p = NP.execute NP.NewCmd1 p

