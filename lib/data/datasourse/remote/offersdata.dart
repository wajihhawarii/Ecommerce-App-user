import 'package:ecommerceappn/core/class/curd.dart';
import 'package:ecommerceappn/linkapi.dart';

class OffersData {
  Curd crud;
  OffersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }
}
