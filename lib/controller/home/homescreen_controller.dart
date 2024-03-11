import 'package:ecommerceappn/view/screens/notifications.dart';
import 'package:ecommerceappn/view/screens/offers.dart';
import 'package:ecommerceappn/view/screens/settings/settingspage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screens/home/homepage.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenContrllerImp extends HomeScreenController {
  int currentpage = 0;

  List listpage = const [
    HomePage(),
    NotificationsView(),
    OffersView(),
    SettingPage(),
  ];

  List bottomappbar = [
    {
      "title": "Home",
      "icon": Icons.home,
    },
    {
      "title": "notification",
      "icon": Icons.notifications_paused,
    },
    {"title": "offers", "icon": Icons.add_reaction_rounded},
    {
      "title": "settings",
      "icon": Icons.settings,
    },
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
