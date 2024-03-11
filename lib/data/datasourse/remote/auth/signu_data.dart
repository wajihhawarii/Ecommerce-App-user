import 'package:ecommerceappn/core/class/curd.dart';
import 'package:ecommerceappn/linkapi.dart';

class SignUpData {
  Curd curd;
  SignUpData(this.curd);
  postData(String email, String password, String username, String phone) async {
    var response = await curd.postData(AppLink.signup, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
