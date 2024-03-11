import 'package:ecommerceappn/core/class/statuserequest.dart';
import 'package:ecommerceappn/core/function/hundlingdata.dart';
import 'package:ecommerceappn/core/services/myservices.dart';
import 'package:ecommerceappn/data/datasourse/remote/myfavoratedata.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FavorateController extends GetxController {
  Map isFavorate = {};

  MyFavorateData favorateData = MyFavorateData(Get.find());

  List data = []; //من اجل تخزين البيانات

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  setFavorate(id, val) {
    isFavorate[id] = val;
    update();

//val تعبر هل العنصر مضاف الى المفضلة ام لاء وهي تاخذ قيمتين اما الصفر او الواحد
//itemId الرقم الخاص بالعنصر
  }

  addFavorate(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var respons = await favorateData.addData(
        myServices.sharedPreferences.getString("id")!, itemsid);

    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        //data.addAll(respons['data']);
        Get.snackbar(" warning ", "Data is Add");
      } else {
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
      }
    } else {}
    // update();
  }

  removeFavorate(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var respons = await favorateData.removeData(
        myServices.sharedPreferences.getString("id")!, itemsid);

    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        // data.addAll(respons['data']);
        Get.snackbar(" warning ", "Data is Remove ");
      } else {
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
      }
    } else {}
    // update();
  }
}
