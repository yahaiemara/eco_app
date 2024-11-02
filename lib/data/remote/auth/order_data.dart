import 'package:ecommerceapptotrial/core/class/curd.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';

class OrderData{
  Crud curd;
  OrderData(this.curd);
  getData(String orderid)async{
    var response=await curd.postData(Apiconnect.orderdetails, {"orderid":orderid});
    return response.fold((l)=>l ,(r)=>r);
  }

}
