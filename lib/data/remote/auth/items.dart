import 'package:ecommerceapptotrial/core/class/curd.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';


class ItemsData{
  Crud curd;
  ItemsData(this.curd);
  getData(String id,String usersid)async{
    var response=await curd.postData(Apiconnect.items, {"id":id,"userid":usersid});
    return response.fold((l)=>l ,(r)=>r);
  }

}
