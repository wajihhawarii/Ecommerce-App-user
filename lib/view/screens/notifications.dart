import 'package:ecommerceappn/controller/notifications_controller.dart';
import 'package:ecommerceappn/core/class/hundlingdata.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationsControllerImp controller =
        Get.put(NotificationsControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.purpule,
        title: const Text(
          "<= Notifications =>",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
      body: HandlingDataRequest(
        statusRequest: controller.statusRequest!,
        widget: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              ...List.generate(
                  controller.data.length,
                  (index) => GetBuilder<NotificationsControllerImp>(
                        builder: (controller) => Container(
                          padding: const EdgeInsets.all(5),
                          child: Card(
                            color: Colors.white,
                            elevation: 5,
                            child: ListTile(
                              dense: true,
                              title: Text(
                                controller.data[index]["notifictions_title"],
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                controller.data[index]["notifictions_body"],
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic),
                              ),
                              trailing: Text(
                                //    "${controller.data[index]["notifictions_datetime"]}",
                                Jiffy("${controller.data[index]["notifictions_datetime"]}",
                                        "yyyy-MM-dd")
                                    .fromNow(),

                                style: const TextStyle(
                                    color: Colors.red,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
