import 'package:ecommerceappn/core/class/curd.dart';
import 'package:ecommerceappn/linkapi.dart';

class PendingsData {
  Curd crud;
  PendingsData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.orderspendings, {
      "id": userid,
    });
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  delelteData(String orderid) async {
    var response = await crud.postData(AppLink.ordersdelete, {"id": orderid});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }
}
