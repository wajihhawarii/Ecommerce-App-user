import 'package:ecommerceappn/core/class/curd.dart';

import '../../../../linkapi.dart';

class OrdersDetailsData {
  Curd crud;
  OrdersDetailsData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.ordersdetailes, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
