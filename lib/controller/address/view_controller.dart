import 'package:ecommerceappn/core/class/statuserequest.dart';
import 'package:ecommerceappn/core/function/hundlingdata.dart';
import 'package:ecommerceappn/core/services/myservices.dart';
import 'package:ecommerceappn/data/datasourse/remote/address.dart';
import 'package:ecommerceappn/data/model/addressmodel.dart';
import 'package:get/get.dart';

abstract class AddressViewController extends GetxController {
  getData();
}

class AddressViewControllerImp extends AddressViewController {
  StatusRequest? statusRequest;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  List data = [];
  @override
  getData() async {
    statusRequest = StatusRequest.loading;

    var respons = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        List listdata = respons['data'];
        data.addAll(listdata
            .map((e) => AddressModel.fromJson(e))); //اسندناها الي  الموديل
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure; //لا يوجد بيانات
        }
      } else {
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
      }
    }
    update(); //  GetxController  من اجل تحديث الواجهة  وهي تاتي من كلاس
  }

  deleteAddress(String address) {
    addressData.deleteData(address);
    data.removeWhere((element) => element.addressId == address);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
