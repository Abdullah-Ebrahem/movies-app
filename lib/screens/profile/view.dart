import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/cache_helper.dart';
import 'package:movies/core/methods.dart';
import 'package:movies/screens/login/view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        titleSpacing: 20.w,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
            width: MediaQuery.of(context).size.width,
          ),
          Text('${CacheHelper.getFirstName()} ${CacheHelper.getLastName()}'),
          SizedBox(
            height: 5.h,
          ),
          Text(CacheHelper.getEmail()),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
              onTap: () {
                CacheHelper.clear();
                navigateTo(page: const LoginScreen(), withHistory: false);
              },
              child: const Chip(
                  avatar: Icon(
                    Icons.logout_rounded,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Log out',
                    style: TextStyle(color: Colors.red),
                  )))
        ],
      ),
    );
  }
}
