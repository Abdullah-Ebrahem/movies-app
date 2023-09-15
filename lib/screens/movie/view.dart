import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MovieDetailes extends StatefulWidget {
  final String movieTitle;
  final String imgUrl;
  final String posterUrl;
  final String overView;
  final String rate;
  int voteCount;
  MovieDetailes(
      {super.key,
      required this.movieTitle,
      required this.imgUrl,
      required this.overView,
      required this.rate,
      required this.voteCount,
      required this.posterUrl});

  @override
  State<MovieDetailes> createState() => _MovieDetailesState();
}

class _MovieDetailesState extends State<MovieDetailes> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movieTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.imgUrl,
              width: MediaQuery.of(context).size.width,
              height: 222.h,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                      isSelected ? widget.voteCount++ : widget.voteCount--;
                    });
                  },
                  child: Chip(
                    side: BorderSide.none,
                    backgroundColor: Colors.white,
                    avatar: Icon(
                      Icons.star,
                      color: isSelected ? Colors.amber : Colors.grey,
                      size: 33.w,
                    ),
                    label: Text(
                      widget.rate,
                      style: TextStyle(
                          fontSize: 33.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Text(
                  'vote count: ${widget.voteCount}',
                  style: TextStyle(fontSize: 25.sp),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 8.w),
              child: Wrap(children: [
                Text(
                  widget.overView,
                  style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
