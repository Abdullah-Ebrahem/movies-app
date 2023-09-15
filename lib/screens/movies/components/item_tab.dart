import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemTab extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final bool isCurrentTab;
  const ItemTab(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isCurrentTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsetsDirectional.symmetric(vertical: 5.h, horizontal: 10.w),
        decoration: BoxDecoration(
            color: Colors.amber[200], borderRadius: BorderRadius.circular(9.r)),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20.sp,
              color: isCurrentTab ? Colors.white : Colors.grey),
        ),
      ),
    );
  }
}
