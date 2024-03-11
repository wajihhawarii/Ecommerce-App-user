import 'package:ecommerceappn/core/class/curd.dart';
import 'package:ecommerceappn/linkapi.dart';

class MyFavorateData {
  Curd crud;
  MyFavorateData(this.crud);

  viewData(String id) async {
    var response = await crud.postData(AppLink.favoreteview, {"id": id});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  removeData(String userid, String itemsid) async {
    var response = await crud.postData(
        AppLink.deletefromfavorate, {"userid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  addData(String userid, String itemsid) async {
    var response = await crud
        .postData(AppLink.favorateadd, {"userid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }
}
