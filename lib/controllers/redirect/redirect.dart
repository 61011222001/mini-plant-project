import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/init.dart';
import 'package:mp_v1_0/views/pages/basket/basket-page.dart';
import 'package:mp_v1_0/views/pages/custom/custom-page.dart';
import 'package:mp_v1_0/views/pages/get-started/get-started-page.dart';
import 'package:mp_v1_0/views/pages/get-started/login/login-page.dart';
import 'package:mp_v1_0/views/pages/get-started/logout/logout-page.dart';
import 'package:mp_v1_0/views/pages/get-started/register/register-page.dart';
import 'package:mp_v1_0/views/pages/history/history-page.dart';
import 'package:mp_v1_0/views/pages/home/home-page.dart';
import 'package:mp_v1_0/views/pages/main-menu/main-menu-page.dart';
import 'package:mp_v1_0/views/pages/products/products-page.dart';
import 'package:mp_v1_0/views/pages/products/products-detail-page.dart';
import 'package:mp_v1_0/views/pages/profile/profile-page.dart';
import 'package:mp_v1_0/views/pages/settings/settings-page.dart';
import 'package:mp_v1_0/views/pages/shop/shop-page.dart';

Map<String, dynamic> Routes ({dynamic data}) {
  data = (data != null) ? data : {};

  return {
    '/init' : InitApp(data: data),
    '/basket' : BasketPage(data: data),
    '/custom' : CustomPage(data: data),
    '/get-started' : GetStartedPage(data: data),
    '/get-started/login' : LoginPage(data: data),
    '/get-started/logout' : LogoutPage(data: data),
    '/get-started/register' : RegisterPage(data: data),
    '/history' : HistoryPage(data: data),
    '/home' : HomePage(data: data),
    '/main-menu' : MainMenuPage(data: data),
    '/products' : ProductsPage(data: data),
    '/products/detail' : ProductsDetailPage(data: data),
    '/profile' : ProfilePage(data: data),
    '/settings' : SettingsPage(data: data),
    '/shop' : ShopPage(data: data)
  };
}

Function Back (BuildContext context) {
  Navigator.pop(context);
}

Function Replace (BuildContext context, dynamic material) {
  if (material != null) {
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context) => material
      )
    );
  } else {
    print('[ERROR] Redirect not found: ' + material.toString());
  }
}

Function Redirect (BuildContext context, String page, {Function before, dynamic data}) {
  dynamic target = Routes(data: data)[page];

  if (before != null) {
    before();
  }

  if (target != null) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context) => target
      )
    );
  } else {
    print('[ERROR] Redirect not found: ' + page);
  }
}

Function ClearPage (BuildContext context, String page, {Function before, dynamic data}) {
  dynamic target = Routes(data: data)[page];

  if (before != null) {
    before();
  }

  if (target != null) {
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context) => target
      ),
      (route) => false,
    );
  } else {
    print('[ERROR] Redirect not found: ' + page);
  }
}

Widget Toggle (String page, {Function before, dynamic data}) {
  dynamic target = Routes(data: data)[page];

  if (before != null) {
    before();
  }

  return (target != null) ? target : SizedBox();
}