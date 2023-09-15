import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemMovie extends StatelessWidget {
  final String? imgUrl;
  final String movieTitle;
  final String releaseDate;
  const ItemMovie(
      {super.key,
      this.imgUrl,
      required this.movieTitle,
      required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imgUrl!.isEmpty
              ? Placeholder(
                  fallbackHeight: 200.h,
                )
              : Image.network(
                  imgUrl!,
                  width: MediaQuery.of(context).size.width,
                  height: 200.h,
                  fit: BoxFit.fill,
                ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    movieTitle,
                    style: TextStyle(
                        fontSize: 15.sp, overflow: TextOverflow.ellipsis),
                  ),
                ),
                Text(
                  releaseDate,
                  style: TextStyle(fontSize: 15.sp),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
