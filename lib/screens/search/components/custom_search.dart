import 'package:flutter/material.dart';
import 'package:movies/core/cache_helper.dart';

class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    Set<String> matchQuery = {};
    List<String> movies = [];
    for (var item in CacheHelper.getMovies()) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    movies = matchQuery.toList();
    return ListView.builder(
      itemCount: movies.length, //matchQuery.length,
      itemBuilder: (context, index) {
        // var result = matchQuery[index];
        return ListTile(
          title: Text(movies[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Set<String> matchQuery = {};
    List<String> movies = [];
    for (var item in CacheHelper.getMovies()) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    movies = matchQuery.toList();
    return ListView.builder(
      itemCount: movies.length, //matchQuery.length,
      itemBuilder: (context, index) {
        // var result = matchQuery[index];
        return ListTile(
          title: Text(movies[index]),
        );
      },
    );
  }
}
