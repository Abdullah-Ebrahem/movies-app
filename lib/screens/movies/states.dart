part of 'controller.dart';

abstract class MoviesStates {}

class MoviesIntialState extends MoviesStates {}

class MoviesLoadingState extends MoviesStates {}

class MoviesSuccesState extends MoviesStates {
  final String msg;
  MoviesSuccesState({required this.msg});
}

class MoviesFailedState extends MoviesStates {
  final String msg;
  MoviesFailedState({required this.msg});
}
