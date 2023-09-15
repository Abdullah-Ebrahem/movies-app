import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/loading_widget.dart';
import 'package:movies/core/methods.dart';
import 'package:movies/screens/movies/components/item_movie.dart';
import 'package:movies/screens/movies/components/item_tab.dart';
import 'package:movies/screens/movies/controller.dart';

import '../movie/view.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 500,
      child: BlocProvider(
        create: (context) => MoviesController(),
        child: Builder(builder: (context) {
          final cubit = MoviesController.getObject(context);
          cubit.getMovies();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text('Movies'),
              titleSpacing: 20.w,
              bottom: TabBar(
                indicatorColor: Colors.transparent,
                isScrollable: true,
                onTap: (value) {
                  cubit.pageNumber = value;
                },
                tabs: List.generate(
                    500,
                    (index) => BlocBuilder<MoviesController, MoviesStates>(
                        builder: (context, state) => ItemTab(
                            title: (index + 1).toString(),
                            onTap: () {
                              cubit.pageNumber = index + 1;
                              cubit.getMovies();
                            },
                            isCurrentTab: index + 1 == cubit.pageNumber))),
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () => cubit.getMovies(),
              child: BlocBuilder<MoviesController, MoviesStates>(
                builder: (context, state) {
                  if (state is MoviesSuccesState) {
                    return ListView.builder(
                        padding: EdgeInsetsDirectional.only(top: 10.h),
                        itemCount: cubit.data != null
                            ? cubit.data!.results.length
                            : 20,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                navigateTo(
                                    page: MovieDetailes(
                                  posterUrl:
                                      '${cubit.baseUrl}${cubit.data!.results[index].posterPath}',
                                  voteCount:
                                      cubit.data!.results[index].voteCount,
                                  rate: cubit.data!.results[index].voteAverage
                                      .toString(),
                                  movieTitle: cubit.data!.results[index].title,
                                  imgUrl:
                                      '${cubit.baseUrl}${cubit.data!.results[index].backdropPath}',
                                  overView: cubit.data!.results[index].overview,
                                ));
                              },
                              child: ItemMovie(
                                  releaseDate:
                                      cubit.data!.results[index].releaseDate,
                                  imgUrl: cubit.data!.results[index]
                                              .backdropPath !=
                                          null
                                      ? '${cubit.baseUrl}${cubit.data!.results[index].backdropPath}'
                                      : '',
                                  movieTitle: cubit.data!.results[index].title),
                            ));
                  } else if (state is MoviesLoadingState) {
                    return ListView.builder(
                      itemCount:
                          cubit.data != null ? cubit.data!.results.length : 20,
                      itemBuilder: (context, index) => const Loading(),
                    );
                  } else {
                    return const Center(
                      child: Text('Network Error'),
                    );
                  }
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
