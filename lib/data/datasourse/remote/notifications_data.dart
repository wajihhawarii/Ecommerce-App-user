import 'package:ecommerceappn/core/class/curd.dart';
import 'package:ecommerceappn/linkapi.dart';

class NotificationsData {
  Curd crud;
  NotificationsData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.notifications, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }
}
