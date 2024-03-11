import 'package:ecommerceappn/core/class/curd.dart';
import 'package:ecommerceappn/linkapi.dart';

class ItemsData {
  Curd crud;
  ItemsData(this.crud);

  getData(String userid, String catid) async {
    var response = await crud.postData(AppLink.itemspage, {
      "userid": userid,
      "id": catid,
    });
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }
}
