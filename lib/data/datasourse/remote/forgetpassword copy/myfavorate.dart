import 'package:ecommerceappn/core/class/curd.dart';
import 'package:ecommerceappn/linkapi.dart';

class MyFavorateData {
  Curd crud;
  MyFavorateData(this.crud);

  postData(String id) async {
    var response = await crud.postData(AppLink.favoreteview, {"id": id});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  removeData(String id) async {
    var response = await crud.postData(AppLink.deletefromfavorate, {"id": id});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }
}
