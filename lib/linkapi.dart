class AppLink {
  static const String server = "";

  static const String imagestatic = "";
  //++++++++++++++++++++++++++++++Image+++++++++++++++++++++++++++++++++++++++++++++++++++++++
  static const String imagecategories = "$imagestatic/categories";
  static const String imageitems = "$imagestatic/items";
  //============================================================================================

  static const String test = "$server/test.php";
  //=================================auth=====================================================
  static const String signup = "$server/signup.php";
  static const String login = "$server/login.php";
  static const String veryfiycode = "$server/verfiycode.php";
  //=================================forgetpassword==========================================;
  static const String checkemail = "$server/checkemail1.php";
  static const String verifycode1forgetpassword = "$server/verifycode1.php";
  static const String resendverfiycode = "$server/resendverfiycode.php";
  static const String resetpassword1 = "$server/resetpassword1.php";
  //HomePage
  static const String homepage = "$server/home.php";
  //ItemsPage
  static const String itemspage = "$server/items.php";
  static const String search = "$server/items_search.php";

  //Favorate
  // static const String favorateremove = "$server/favorate_remove.php";
  static const String favorateadd = "$server/favorate_add.php";
  static const String favoreteview = "$server/favorate_view.php";
  static const String deletefromfavorate = "$server/favorate_remove.php";

  //cart
  static const String cartview = "$server/cart_view.php";
  static const String cartadd = "$server/cart_add.php";
  static const String cartdelete = "$server/cart_delete.php";
  static const String cartgetcountitems = "$server/cart_getcountitems.php";
  //=====================================address=============================================

  static const String addressadd = "$server/address_add.php";
  static const String addressview = "$server/address_view.php";
  static const String adressedite = "$server/address_edite.php";
  static const String adressdelete = "$server/adress_delete.php";
  static const String checkcoupon = "$server/coupon_checkcoupon.php";

//=======================================orders==============================================

  static const String orderscheckout = "$server/orders_checkout.php";
  static const String ordersarchive = "$server/orders_archive.php";
  static const String orderspendings = "$server/orders_pendings.php";
  static const String ordersdetailes = "$server/orders_detailes.php";
  static const String ordersdelete = "$server/orders_delete.php";

  //===============================================================================
  static const String ratings = "$server/ratings.php";
  static const String offers = "$server/offers.php";

  //=====================================Notifacations=============================================

  static const String notifications = "$server/notifications.php";
}
