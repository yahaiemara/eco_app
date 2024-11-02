import 'package:ecommerceapptotrial/core/class/curd.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';

class AddressData{
  Crud curd;
  AddressData(this.curd);
  getData(String usersid)async{
    var response=await curd.postData(Apiconnect.addressdata, {"usersid":usersid});
    return response.fold((l)=>l ,(r)=>r);
  }
  add(String usersid,String name,String city,String street,String lat,String long)async{
    var response=await curd.postData(Apiconnect.addaddress, {
    "usersid":usersid,
    "name":name,
    "city":city,
    "street":street,
    "lat":lat,
    "long":long
    });
    return response.fold((l)=>l ,(r)=>r);
  }
   delete(String id)async{
    var response=await curd.postData(Apiconnect.addressdata, {"id":id});
    return response.fold((l)=>l ,(r)=>r);
  }
   update(String id,String name,String city,String street,String lat,String long)async{
    var response=await curd.postData(Apiconnect.addressdata, {
      "id":id,
      "name":name,
      "city":city,
      "street":street,
      "lat":lat,
      "long":long
      });
    return response.fold((l)=>l ,(r)=>r);
  }
}
