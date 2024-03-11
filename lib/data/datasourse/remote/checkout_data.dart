import 'package:ecommerceappn/core/class/curd.dart';
import 'package:ecommerceappn/linkapi.dart';

class CheckOutData {
  Curd crud;
  CheckOutData(this.crud);

  checkOut(Map data) async {
    var response = await crud.postData(AppLink.orderscheckout, data);
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }
}
