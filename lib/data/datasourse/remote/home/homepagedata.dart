import 'package:ecommerceappn/core/class/curd.dart';
import 'package:ecommerceappn/linkapi.dart';

class HomeData {
  Curd crud;
  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  searchData(
    String search,
  ) async {
    var response = await crud.postData(AppLink.search, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
