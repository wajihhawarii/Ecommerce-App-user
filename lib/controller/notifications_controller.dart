import 'package:ecommerceappn/core/class/statuserequest.dart';
import 'package:ecommerceappn/core/function/hundlingdata.dart';
import 'package:ecommerceappn/core/services/myservices.dart';
import 'package:ecommerceappn/data/datasourse/remote/notifications_data.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class NotificationsController extends GetxController {
  getData();
}

class NotificationsControllerImp extends NotificationsController {
  StatusRequest? statusRequest;
  NotificationsData notificationsData = NotificationsData(Get.find());
  MyServices myServices = Get.find();
  List data = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var respons = await notificationsData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        print("111111111111111111111111111111111111");
        data.addAll(respons['data']);
      } else {
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
        print('222222222222222222222222222222222222222222');
      }
    }
    update(); //  GetxController  من اجل تحديث الواجهة  وهي تاتي من كلا
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
