import 'package:ecommerceapptotrial/core/class/curd.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';

class LoginData{
  Crud curd;
 LoginData (this.curd);
  postdata(String email,String password)async{
    var response=await curd.postData(Apiconnect.login, {
      "email":email,
      "password":password,
    });
    return response.fold((l)=>l ,(r)=>r);
  }

}
