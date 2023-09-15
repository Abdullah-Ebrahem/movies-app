import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/methods.dart';
import 'package:movies/screens/register/model.dart';

part 'states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RegisterCubit() : super(RegisterIntialState());

  static RegisterCubit getObject(context) => BlocProvider.of(context);

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      try {
        emit(RegisterLoadingState());
        final response =
            await Dio(BaseOptions(receiveDataWhenStatusError: true))
                .post('https://roaya-lab.onrender.com/signUp', data: {
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'confirmPassword': confirmPasswordController.text,
        });
        final data = UserRegister.fromJson(response.data);
        cacheData(
            email: data.email,
            firstName: data.firstName,
            lastName: data.lastName);
        emit(RegisterSuccessState(msg: 'Success'));
      } on DioException catch (e) {
        if (e.response != null) {
          emit(RegisterFailedState(msg: e.response!.data['message']));
        } else if (e.response == null) {
          emit(RegisterFailedState(msg: 'Network Error'));
        }
      }
    }
  }
}
