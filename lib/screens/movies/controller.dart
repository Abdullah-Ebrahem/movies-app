import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/cache_helper.dart';
import 'package:movies/screens/movies/model.dart';
part 'states.dart';

class MoviesController extends Cubit<MoviesStates> {
  MoviesController() : super(MoviesIntialState());

  static MoviesController getObject(context) => BlocProvider.of(context);

  final String baseUrl = 'https://image.tmdb.org/t/p/original';
  MoviesData? _data;
  List<String> moviesTitles = [];
  int pageNumber = 1;

  MoviesData? get data => _data;

  getMovies() async {
    emit(MoviesLoadingState());
    try {
      final response = await Dio().get(
          'https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=$pageNumber');
      _data = MoviesData.fromJson(response.data);
      emit(MoviesSuccesState(msg: 'Success'));
      for (var item in data!.results) {
        moviesTitles.add(item.title);
      }
      CacheHelper.saveMovies(moviesTitles);
    } on DioException catch (e) {
      if (e.response != null) {
        emit(MoviesFailedState(msg: 'Failed'));
      } else if (e.response == null) {
        emit(MoviesFailedState(msg: 'Network Error'));
      }
    }
  }
}
