import 'package:ecommerceapptotrial/core/class/curd.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';

class CartData{
  Crud curd;
  CartData(this.curd);
  // ignore: non_constant_identifier_names
  addCart(String userid,String itemsid)async{
    var response=await curd.postData(Apiconnect.addcart, {"userid":userid,"itemsid":itemsid});
    return response.fold((l)=>l ,(r)=>r);
  }
    // ignore: non_constant_identifier_names
    removeCart(String userid,String itemsid)async{
    var response=await curd.postData(Apiconnect.deletecart, {"userid":userid,"itemsid":itemsid});
    return response.fold((l)=>l ,(r)=>r);
  }
   getCount(String userid,String itemsid)async{
    var response=await curd.postData(Apiconnect.getcountitems, {"userid":userid,"itemsid":itemsid});
    return response.fold((l)=>l ,(r)=>r);
  }
   getData(String userid)async{
    var response=await curd.postData(Apiconnect.cartview, {"userid":userid});
    return response.fold((l)=>l ,(r)=>r);
  }
  checkcoupon(String couponname)async{
    var response=await curd.postData(Apiconnect.checkcoupon, {"couponname":couponname});
    return response.fold((l)=>l ,(r)=>r);
  }

}