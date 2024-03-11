import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Responseive {
  static late MediaQueryData mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late Orientation orientation; //من اجل الوضع العرضي والطولي للجهاز

  static List<DeviceOrientation> orientations = [
    //الوضعيات المسموح فيها بالجهاز
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitDown,
  ];
  void init(BuildContext context) {
    //يجب ان تهيئ عند بدر البرنامج
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    orientation =
        mediaQueryData.orientation; //من اجل الوضع العرضي والطولي للجهاز
  }
}
