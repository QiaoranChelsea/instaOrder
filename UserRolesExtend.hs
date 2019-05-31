module UserRolesExtend where
import Product
import qualified ProductExtension as NP
import qualified ProductCmd as PC
import UserRoles


class NewKindProductReceiver a  where 
  searchNewProductKind :: NP.NewKind' nk => a -> nk -> String


instance NewKindProductReceiver User where
    searchNewProductKind User p = NP.execute NP.NewCmd1 p

instance NewKindProductReceiver Admin where
    searchNewProductKind Admin p = NP.execute NP.NewCmd1 p

