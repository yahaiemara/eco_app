import 'package:ecommerceapptotrial/core/class/curd.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';

class Home{
  Crud curd;
  Home(this.curd);
  getData()async{
    var response=await curd.postData(Apiconnect.home, {});
    return response.fold((l)=>l ,(r)=>r);
  }

 search(String search)async{
    var response=await curd.postData(Apiconnect.searchitems, {"search":search});
    return response.fold((l)=>l ,(r)=>r);
  }

}
