import 'package:ecommerceappn/controller/settings_controller.dart';
import 'package:ecommerceappn/view/widgets/settings/topcontainersettings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/route.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MyProfile",
          style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColor.purpule,
      ),
      body: ListView(
        children: [
          const TopContainerSetting(),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  onTap: () {},
                  trailing: Switch(
                    onChanged: (val) {},
                    value: true,
                  ),
                  title: const Text("Disable Notifications"),
                ),
                const Divider(
                  thickness: 0.8,
                  color: AppColor.black,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.addressview);
                  },
                  trailing: const Icon(Icons.local_activity_outlined),
                  title: const Text("Address"),
                ),
                const Divider(
                  thickness: 0.8,
                  color: AppColor.black,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.orderspending);
                  },
                  trailing: const Icon(Icons.card_giftcard),
                  title: const Text("orders pendings"),
                ),
                const Divider(
                  thickness: 0.8,
                  color: AppColor.black,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.ordersarchive);
                  },
                  trailing: const Icon(Icons.local_activity_outlined),
                  title: const Text("Orders Archive"),
                ),
                const Divider(
                  thickness: 0.8,
                  color: AppColor.black,
                ),
                ListTile(
                  onTap: () {},
                  trailing: const Icon(Icons.help_outline_outlined),
                  title: const Text("About us"),
                ),
                const Divider(
                  thickness: 0.8,
                  color: AppColor.black,
                ),
                ListTile(
                  onTap: () {
                    launchUrl(Uri.parse(
                        "tel:+0996972954")); //ملاحظة من الضروري ان نكتب الكلمة الداخل التنصيص بشكل صحيح من اجل ان لايرمي اي استثناء
                  },
                  trailing: const Icon(Icons.phone_callback_outlined),
                  title: const Text("Contact us "),
                ),
                const Divider(
                  thickness: 0.8,
                  color: AppColor.black,
                ),
                ListTile(
                  title: const Text("Logout"),
                  onTap: () {
                    controller.logout();
                  },
                  trailing: const Icon(Icons.exit_to_app),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
