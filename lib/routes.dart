import 'package:ecommerceappn/view/screens/address/adddaitelse.dart';
import 'package:ecommerceappn/view/screens/address/view.dart';
import 'package:ecommerceappn/view/screens/auth/loginpage.dart';
import 'package:ecommerceappn/view/screens/auth/signuppage.dart';
import 'package:ecommerceappn/view/screens/auth/success_signup.dart';
import 'package:ecommerceappn/view/screens/auth/veriyfycodesignup.dart';
import 'package:ecommerceappn/view/screens/card.dart';
import 'package:ecommerceappn/view/screens/checkout/checkoutorder.dart';
import 'package:ecommerceappn/view/screens/favorte.dart';
import 'package:ecommerceappn/view/screens/forgetpassword/forgetpassword.dart';
import 'package:ecommerceappn/view/screens/forgetpassword/resetpassword.dart';
import 'package:ecommerceappn/view/screens/forgetpassword/success_resetpassword.dart';
import 'package:ecommerceappn/view/screens/forgetpassword/verifycode.dart';
import 'package:ecommerceappn/view/screens/home/homepage.dart';
import 'package:ecommerceappn/view/screens/home/homescreen.dart';
import 'package:ecommerceappn/view/screens/items.dart';
import 'package:ecommerceappn/view/screens/itemsdetailes.dart';
import 'package:ecommerceappn/view/screens/languagepage.dart';
import 'package:ecommerceappn/view/screens/onbording.dart';
import 'package:ecommerceappn/view/screens/orders/archive.dart';
import 'package:ecommerceappn/view/screens/orders/detailes.dart';
import 'package:ecommerceappn/view/screens/orders/pending.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'core/constant/route.dart';

//,middlewares: [ MiddleWare()]
List<GetPage<dynamic>> routes = [
  GetPage(
    name: "/",
    page: () => const LanguagePage(),
  ),
  GetPage(
    name: AppRoute.homepage,
    page: () => const HomePage(),
  ),
  GetPage(name: AppRoute.homescreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.loginpage, page: () => const LoginPage()),
  GetPage(name: AppRoute.signuppage, page: () => const SignUpPage()),
  GetPage(name: AppRoute.onbording, page: () => const OnBording()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.itemsdetailes, page: () => const ItemsDetailes()),

  //VerfiyCodeSignUp//
  GetPage(
      name: AppRoute.verfiycodesignup,
      page: () => const VerfiyCodeSignUpSignUp()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(
      name: AppRoute.verfiyCoderesetpassword,
      page: () => const VerfiyCodeResetPassWord()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),

  //address
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  // GetPage(name: AppRoute.addressadd, page: ()=> const  AddressAdd()),
  GetPage(
      name: AppRoute.addressaddpart2, page: () => const AddressAddDetailes()),
  GetPage(name: AppRoute.card, page: () => const CardPage()),
  GetPage(name: AppRoute.checkout, page: () => const CheckOut()),
//orders
  GetPage(name: AppRoute.orderspending, page: () => const PendingsOrders()),
  GetPage(name: AppRoute.ordersarchive, page: () => const ArchiveOrders()),
  GetPage(name: AppRoute.orderdetailes, page: () => const OrderDetailes()),
  GetPage(name: AppRoute.favorate, page: () => const MyFavorate()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
];
