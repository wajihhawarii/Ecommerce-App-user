// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:trainecom/controller/auth/firstpage_controller.dart';
// import '../../../core/constant/color.dart';
// import '../../../core/constant/image.dart';
// import '../../widgets/auth/custom_clippath.dart';
// import '../../widgets/auth/custom_materailbutton.dart';

// class FirstPage extends StatelessWidget {
//   const FirstPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     FirstPageControllerImp firstPageControllerImp =Get.put(FirstPageControllerImp());
//     return Scaffold(
//         body: Stack(
//       children: [
//         const CustomClipPathFirstPage(),
//         Positioned(
//           top: 50,
//           child: SizedBox(
//             width: 400,
//             height: 400,
//             child: Image.asset(AppImage.logo),
//           ),
//         ),
//         Positioned(
//           top: 20,
//           child: TextButton(
//             onPressed: () {},
//             child: const Text("< Back",
//                 style: TextStyle(color: AppColor.white, fontSize: 20)),
//           ),
//         ),
//         // for (int i = 0; i < 5;i++)
//         CustomMaterailButton(
//             buttoncolor: AppColor.black,
//             buttonname: "15".tr,
//             buttonpositionright: 20,
//             onpressed: () => firstPageControllerImp.goToLogin()),
//         CustomMaterailButton(
//             buttoncolor: AppColor.pinkAccent,
//             buttonname: "17".tr,
//             buttonpositionleft: 20,
//             onpressed: () => firstPageControllerImp.goToRegister()),
//       ],
//     ));
//   }
// }
