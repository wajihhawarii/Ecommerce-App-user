import 'package:ecommerceappn/core/class/curd.dart';
import 'package:ecommerceappn/linkapi.dart';

class ArchiveData {
  Curd crud;
  ArchiveData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.ordersarchive, {"id": userid});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  ratting(String ordersid, String rating, String comment) async {
    var response = await crud.postData(AppLink.ratings, {
      "id": ordersid,
      "rating": rating,
      "comment": comment,
    });
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }
}
