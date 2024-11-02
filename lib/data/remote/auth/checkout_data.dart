import 'package:ecommerceapptotrial/core/class/curd.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';

class CheckoutData{
  Crud curd;
  CheckoutData(this.curd);
  checkout(Map data)async{
    var response=await curd.postData(Apiconnect.checkout, data);
    return response.fold((l)=>l ,(r)=>r);
  }

}
