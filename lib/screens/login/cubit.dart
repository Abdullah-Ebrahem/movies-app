import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/methods.dart';
import 'package:movies/screens/login/model.dart';

part 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginCubit() : super(LoginIntialStates());
  static LoginCubit getObject(context) => BlocProvider.of(context);

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingStates());
      try {
        final response =
            await Dio(BaseOptions(receiveDataWhenStatusError: true))
                .post('https://roaya-lab.onrender.com/login', data: {
          'email': emailController.text,
          'password': passwordController.text
        });
        final data = UserLogin.fromJson(response.data);
        cacheData(
            email: data.user.email,
            firstName: data.user.firstName,
            lastName: data.user.lastName);
        emit(LoginSuccessStates(msg: 'Success'));
      } on DioException catch (e) {
        if (e.response != null) {
          emit(LoginFailedStates(msg: e.response!.data['message']));
        } else if (e.response == null) {
          emit(LoginFailedStates(msg: 'Network Error'));
        }
      }
    }
  }
}
