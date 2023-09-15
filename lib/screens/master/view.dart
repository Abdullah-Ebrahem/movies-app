import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/screens/master/controller.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  final controller = MasterController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure you want to quit?'),
            actions: [
              TextButton(
                  onPressed: () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                      exit(0);
                    }
                  },
                  child: const Text('exit')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('close'))
            ],
          ),
        );
        return true;
      },
      child: Scaffold(
        body: controller.screens[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: (value) {
              controller.currentIndex = value;
              setState(() {});
            },
            elevation: 0,
            iconSize: 25.w,
            selectedFontSize: 8.sp,
            unselectedFontSize: 8.sp,
            backgroundColor: Colors.white,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            selectedItemColor: const Color(0xffFFBB3B),
            unselectedItemColor: const Color(0xff898989),
            items: List.generate(
                controller.labels.length,
                (index) => BottomNavigationBarItem(
                    icon: Icon(
                      controller.icons[index],
                    ),
                    label: controller.labels[index].toUpperCase()))),
      ),
    );
  }
}
