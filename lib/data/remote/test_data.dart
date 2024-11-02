import 'package:ecommerceapptotrial/core/class/curd.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';

class TestData{
  Crud curd;
  TestData(this.curd);
  getData()async{
    var response=await curd.postData(Apiconnect.test, {});
    return response.fold((l)=>l ,(r)=>r);
  }

}
