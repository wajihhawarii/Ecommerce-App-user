import 'package:ecommerceappn/core/class/curd.dart';
import 'package:ecommerceappn/linkapi.dart';

class AddressData {
  Curd crud;
  AddressData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.addressview, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  addData(String usersid, String city, String street, String name) async {
    var response = await crud.postData(AppLink.addressadd, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      // "lat": lat,
      // "long": long,  من اجل الخريطة هذان المتحولان
    });
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  deleteData(String addressid) async {
    //كان من الالفضل ان نرسل رقم تعريف المسخدم
    var response =
        await crud.postData(AppLink.adressdelete, {"addressid": addressid});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }
}
