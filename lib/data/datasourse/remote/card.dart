import 'package:ecommerceappn/core/class/curd.dart';
import 'package:ecommerceappn/linkapi.dart';

class CardData {
  Curd crud;
  CardData(this.crud);

  viewCart(String userid) async {
    var response = await crud.postData(AppLink.cartview, {"usersid": userid});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  addCart(String userid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartadd, {"userid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  deleteCart(String userid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartdelete, {"usersid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  checkCoupon(String checkcoupon) async {
    var response =
        await crud.postData(AppLink.checkcoupon, {"couponname": checkcoupon});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  getCountCart(String userid, String itemsid) async {
    var response = await crud.postData(
        AppLink.cartgetcountitems, {"usersid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }
}
