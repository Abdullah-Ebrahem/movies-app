import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/cache_helper.dart';
import 'package:movies/core/input.dart';
import 'package:movies/core/methods.dart';
import 'package:movies/core/my_button.dart';
import 'package:movies/screens/master/view.dart';
import 'package:movies/screens/register/cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(builder: (context) {
        final cubit = RegisterCubit.getObject(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Back'),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Text(
                    'Sign Up',
                    style:
                        TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  Input(
                    label: 'first name',
                    hint: 'first name here',
                    controller: cubit.firstNameController,
                    keyBoardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'name is required';
                      }
                      return null;
                    },
                  ),
                  Input(
                    label: 'last name',
                    hint: 'last name here',
                    controller: cubit.lastNameController,
                    keyBoardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'last name is required';
                      }
                      return null;
                    },
                  ),
                  Input(
                    label: 'email',
                    hint: 'email name here',
                    controller: cubit.emailController,
                    keyBoardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email is required';
                      } else if (!value.endsWith('@gmail.com')) {
                        return 'email must end with @gmail.com';
                      }
                      return null;
                    },
                  ),
                  Input(
                    label: 'password',
                    hint: 'password here',
                    controller: cubit.passwordController,
                    isPassword: true,
                    keyBoardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password is required';
                      } else if (value.length < 8) {
                        return 'password must have at least 8 digits';
                      }
                      return null;
                    },
                  ),
                  Input(
                    label: 'confirm password',
                    hint: 'confirm password here',
                    controller: cubit.confirmPasswordController,
                    isPassword: true,
                    isLast: true,
                    keyBoardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'confirm password is required';
                      } else if (value != cubit.passwordController.text) {
                        return 'write the same password';
                      }
                      return null;
                    },
                  ),
                  BlocConsumer<RegisterCubit, RegisterStates>(
                    builder: (context, state) {
                      if (state is RegisterLoadingState) {
                        return const CircularProgressIndicator(
                          color: Colors.amber,
                        );
                      }
                      return MyButton(
                        label: 'register',
                        onPress: () {
                          cubit.register();
                          CacheHelper.saveNotFirstTime();
                        },
                      );
                    },
                    listener: (context, state) {
                      if (state is RegisterFailedState) {
                        showMsg(msg: state.msg);
                      } else if (state is RegisterSuccessState) {
                        navigateTo(
                            page: const MasterScreen(), withHistory: false);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
