part of 'cubit.dart';

abstract class LoginStates {}

class LoginIntialStates extends LoginStates {}

class LoginLoadingStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {
  final String msg;
  LoginSuccessStates({required this.msg});
}

class LoginFailedStates extends LoginStates {
  final String msg;
  LoginFailedStates({required this.msg});
}
