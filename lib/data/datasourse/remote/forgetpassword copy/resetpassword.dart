import 'package:ecommerceappn/core/class/curd.dart';
import 'package:ecommerceappn/linkapi.dart';

class ResetPassWordData {
  Curd crud;
  ResetPassWordData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLink.resetpassword1, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }
}
