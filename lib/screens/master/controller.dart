import 'package:flutter/material.dart';
import 'package:movies/screens/movies/view.dart';
import 'package:movies/screens/profile/view.dart';
import 'package:movies/screens/search/view.dart';

class MasterController {
  int currentIndex = 0;
  List<String> labels = ['home', 'search', 'profile'];
  List<IconData?> icons = [
    Icons.home,
    Icons.search_sharp,
    Icons.person_2_rounded
  ];
  List<Widget> screens = const [
    MoviesScreen(),
    SearchScreen(),
    ProfileScreen()
  ];
}
