import 'package:ecommerceapptotrial/core/class/curd.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';

class MyFavorite{
  Crud curd;
  MyFavorite(this.curd);
  getData(String id)async{
    var response=await curd.postData(Apiconnect.myfavorite, {"id" : id});
    return response.fold((l)=>l ,(r)=>r);
  }
    deleteData(String id )async{
    var response=await curd.postData(Apiconnect.deletefromfavorite, {"id":id});
    return response.fold((l)=>l ,(r)=>r);
  }

}
