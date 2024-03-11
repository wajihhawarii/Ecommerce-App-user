import 'package:ecommerceappn/Responsive/respons.dart';
import 'package:ecommerceappn/core/localization/changelocal.dart';
import 'package:ecommerceappn/core/localization/translation.dart';
import 'package:ecommerceappn/core/services/myservices.dart';
import 'package:ecommerceappn/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'bindings/bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await SystemChrome.setPreferredOrientations(
      Responseive.orientations); //تحديد الوضعيات التي سوف يشتغل بها الجهاز
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageControllerImp languageControllerImp =
        Get.put(LanguageControllerImp());
    Responseive().init(context); // Responsive  تهيئة كلاس.
    return GetMaterialApp(
      translations: MyTranslation(),
      initialBinding: InialBindings(),
      locale: languageControllerImp.language,
      debugShowCheckedModeBanner: false,
      getPages: routes,
    );
  }
}
