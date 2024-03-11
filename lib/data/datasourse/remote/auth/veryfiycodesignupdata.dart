import 'package:ecommerceappn/core/class/curd.dart';
import 'package:ecommerceappn/linkapi.dart';

class VeryfiycodeSignUpData {
  Curd crud;
  VeryfiycodeSignUpData(this.crud);

  postData(String? email, String veryfiycode) async {
    var response = await crud.postData(AppLink.veryfiycode, {
      "email": email,
      "veryfiycode": veryfiycode,
    });
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  reSend(String? email) async {
    var response = await crud.postData(AppLink.resendverfiycode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }
}
