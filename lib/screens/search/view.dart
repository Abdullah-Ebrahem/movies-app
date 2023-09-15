import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/input.dart';
import 'package:movies/screens/movies/controller.dart';
import 'components/custom_search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = MoviesController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 85.h,
          title: Input(
            label: '',
            hint: 'search here',
            onTap: () {
              showSearch(context: context, delegate: CustomSearch());
            },
          )),
    );
  }
}
