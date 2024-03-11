import 'package:ecommerceappn/core/class/statuserequest.dart';
import 'package:ecommerceappn/core/function/hundlingdata.dart';
import 'package:ecommerceappn/core/services/myservices.dart';
import 'package:ecommerceappn/data/datasourse/remote/orders/archive_data.dart';
import 'package:ecommerceappn/data/model/ordersmodel.dart';
import 'package:get/get.dart';

abstract class ArchiveController extends GetxController {}

class ArchiveControllerIm extends ArchiveController {
  StatusRequest? statusRequest;
  ArchiveData archiveData = ArchiveData(Get.find());
  MyServices myServices = Get.find();
  List<OrdersModel> data = [];

  String printOrderType(String val) {
    if (val == "0") {
      return "delivery";
    }
    return "Recive";
  }

  String printPaymentMethodes(String val) {
    if (val == "0") {
      return "Cach on delivery";
    }
    return "Payment Card";
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await Approval";
    } else if (val == "1") {
      return "The Order is Being prepare";
    } else if (val == "2") {
      return "Ready To Picked Up by Delivery man ";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var respons = await archiveData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        List listdata = respons['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
        print('222222222222222222222222222222222');
      }
    }
    update();
  }

  submitRating(String orderid, double rating, String comment) async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var respons =
        await archiveData.ratting(orderid, rating.toString(), comment);
    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        Get.snackbar('Succses', "The operation Rating succsess");
        getOrders();
      } else {
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
        print('222222222222222222222222222222222');
        Get.snackbar('Failed', "The operation Rating succsess");
        getOrders();
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
