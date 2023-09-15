import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function() onPress;
  const MyButton({super.key, required this.label, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 45.w, end: 45.w),
      child: ElevatedButton(
          onPressed: onPress,
          child: Text(
            label.toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
