import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/cache_helper.dart';
import 'package:movies/core/methods.dart';
import 'package:movies/screens/login/view.dart';
import 'package:movies/screens/master/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: CacheHelper.getIfFirstTime()
          ? const LoginScreen()
          : const MasterScreen(),
      builder: (context, child) => MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: child,
        title: 'Movies App',
        theme: ThemeData(
          brightness: Brightness.light,
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                fontSize: 17.sp,
              ),
              filled: true,
              fillColor: Colors.white),
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Color(0xff5A5A5A))),
          //elevated button
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.r)),
                  fixedSize: Size(MediaQuery.of(context).size.width, 44.h),
                  backgroundColor: const Color(0xffFFBB3B))),
          scaffoldBackgroundColor: const Color(0xffF5F5F5),
          //app bar
          appBarTheme: AppBarTheme(
              titleSpacing: 0,
              backgroundColor: const Color(0xffFFBB3B),
              iconTheme: const IconThemeData(color: Color(0xff7C7C7C)),
              titleTextStyle:
                  TextStyle(color: const Color(0xff7C7C7C), fontSize: 24.sp)),
        ),
      ),
    );
  }
}
