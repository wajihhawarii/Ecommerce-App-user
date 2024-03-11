import 'package:ecommerceappn/core/class/statuserequest.dart';
import 'package:ecommerceappn/core/function/hundlingdata.dart';
import 'package:ecommerceappn/core/services/myservices.dart';
import 'package:ecommerceappn/data/datasourse/remote/myfavoratedata.dart';
import 'package:ecommerceappn/data/model/myfavorate.dart';
import 'package:get/get.dart';

class MyFavorateController extends GetxController {
  Map isFavorate = {};

  MyFavorateData favorateData = MyFavorateData(Get.find());

  List<MyFavorateModel> data = []; //من اجل تخزين البيانات

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var respons = await favorateData
        .viewData(myServices.sharedPreferences.getString("id")!);

    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        //data.addAll(respons['data']);
        List responsedata = respons['data'];
        data.addAll(responsedata.map((e) => MyFavorateModel.fromJson(e)));
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print(data);
      } else {
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
      }
    } else {}
    update();
  }

  deleteDataFromFavorate(String favorateid) {
    // لا تحتاج الى وقت
    // ignore: unused_local_variable
    var response = favorateData.removeData(
        myServices.sharedPreferences.getString("id")!, favorateid);
    data.removeWhere((element) => element.favorateId == favorateid);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
