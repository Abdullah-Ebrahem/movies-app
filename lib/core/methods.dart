import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/cache_helper.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void navigateTo({required Widget page, bool withHistory = true}) {
  Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            ScaleTransition(
          scale: animation,
          child: child,
        ),
        pageBuilder: (context, animation, secondaryAnimation) => page,
      ),
      (route) => withHistory);
}

void showMsg({required String msg}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
      content: Text(
    msg,
    style: TextStyle(fontSize: 25.sp),
  )));
}

void cacheData({String? email, String? firstName, String? lastName}) {
  CacheHelper.saveEmail(email: email!);
  CacheHelper.saveFirstName(firstName: firstName!);
  CacheHelper.saveLastName(lastName: lastName!);
}
