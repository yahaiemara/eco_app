import 'package:ecommerceapptotrial/core/class/curd.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';

class ArchiveData{
  Crud curd;
 ArchiveData (this.curd);
  getData(String userid)async{
    var response=await curd.postData(Apiconnect.archiveorder, {"userid":userid});
    return response.fold((l)=>l ,(r)=>r);
  }
 rating(String orderid,String rating,String comment)async{
    var response=await curd.postData(Apiconnect.rating, {"orderid":orderid,"rating":rating,"comment":comment});
    return response.fold((l)=>l ,(r)=>r);
  }


}
