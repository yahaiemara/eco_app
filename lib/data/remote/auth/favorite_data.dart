import 'package:ecommerceapptotrial/core/class/curd.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';

class FavoriteData{
  Crud curd;
  FavoriteData(this.curd);
  // ignore: non_constant_identifier_names
  AddFavorite(String userid,String itemsid)async{
    var response=await curd.postData(Apiconnect.favoriteadd, {"userid":userid,"itemsid":itemsid});
    return response.fold((l)=>l ,(r)=>r);
  }
    // ignore: non_constant_identifier_names
    RemoveFavorite(String userid,String itemsid)async{
    var response=await curd.postData(Apiconnect.favoriterem, {"userid":userid,"itemsid":itemsid});
    return response.fold((l)=>l ,(r)=>r);
  }

}
