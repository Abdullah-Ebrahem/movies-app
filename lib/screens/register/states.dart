part of 'cubit.dart';

abstract class RegisterStates {}

class RegisterIntialState extends RegisterStates {}

class RegisterImgChangeState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final String msg;
  RegisterSuccessState({required this.msg});
}

class RegisterFailedState extends RegisterStates {
  final String msg;
  RegisterFailedState({required this.msg});
}
